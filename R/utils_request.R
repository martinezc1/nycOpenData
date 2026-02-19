# Internal helpers for NYC Open Data requests ####
# - .nyc_endpoint(): constructs the Socrata endpoint URL from a dataset id
# - .nyc_add_filters(): adds equality filters (and IN() for multi-values) as a Socrata $where clause
# - .nyc_add_where(): appends a raw SoQL WHERE expression (for ranges, >=, <, etc.)
# - .nyc_get_json(): executes the request and returns parsed JSON (flattened)
# - .nyc_dataset_request(): common pattern for dataset wrapper functions + input validation (r07/r08)

.nyc_abort <- function(msg) {
  stop(msg, call. = FALSE)
}

# r16: enforce snake_case output column names
.nyc_clean_names <- function(df) {
  janitor::clean_names(df)
}

# r17: light, safe type coercion (numeric/logical + ISO datetime when obvious)
.nyc_coerce_types <- function(df) {
  if (!inherits(df, "data.frame") || nrow(df) == 0) return(df)

  for (nm in names(df)) {
    x <- df[[nm]]
    if (!is.character(x)) next

    x2 <- trimws(x)
    x2[x2 == ""] <- NA_character_

    # Logical
    xl <- tolower(x2)
    if (all(is.na(xl) | xl %in% c("true", "false"))) {
      df[[nm]] <- as.logical(xl)
      next
    }

    # Numeric / Integer (only if all non-missing parse cleanly)
    xn <- gsub(",", "", x2, fixed = TRUE)
    ok_num <- grepl("^[-+]?(\\d+\\.?\\d*|\\d*\\.?\\d+)$", xn) | is.na(xn)
    if (all(ok_num)) {
      num <- suppressWarnings(as.numeric(xn))
      if (all(is.na(xn) | !is.na(num))) {
        if (all(is.na(num) | abs(num - round(num)) < .Machine$double.eps^0.5)) {
          df[[nm]] <- as.integer(round(num))
        } else {
          df[[nm]] <- num
        }
        next
      }
    }

    # ISO-ish datetime: 2025-02-18T12:34:56(.mmm)(Z)
    looks_dt <- grepl("^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:", x2) | is.na(x2)
    if (any(looks_dt, na.rm = TRUE)) {
      parsed <- suppressWarnings(as.POSIXct(x2, tz = "UTC", format = "%Y-%m-%dT%H:%M:%OS"))
      non_missing <- sum(!is.na(x2))
      parsed_ok <- sum(!is.na(parsed))
      if (non_missing > 0 && parsed_ok / non_missing >= 0.95) {
        df[[nm]] <- parsed
        next
      }
    }
  }

  df
}

.nyc_validate_limit <- function(limit) {
  if (length(limit) != 1 || is.na(limit)) {
    .nyc_abort("`limit` must be a single, non-missing numeric value.")
  }
  if (!is.numeric(limit)) {
    .nyc_abort("`limit` must be a single numeric value.")
  }
  if (limit < 0) {
    .nyc_abort("`limit` must be between 0 and Inf.")
  }
  as.integer(limit)
}

.nyc_validate_timeout <- function(timeout_sec) {
  if (length(timeout_sec) != 1 || is.na(timeout_sec)) {
    .nyc_abort("`timeout_sec` must be a single, non-missing numeric value.")
  }
  if (!is.numeric(timeout_sec)) {
    .nyc_abort("`timeout_sec` must be a single numeric value.")
  }
  if (timeout_sec <= 0) {
    .nyc_abort("`timeout_sec` must be > 0.")
  }
  timeout_sec
}

.nyc_validate_filters <- function(filters) {
  if (is.null(filters) || length(filters) == 0) return(list())

  if (!is.list(filters)) {
    .nyc_abort("`filters` must be a named list.")
  }
  if (is.null(names(filters)) || any(!nzchar(names(filters)))) {
    .nyc_abort("`filters` must be a *named* list (all elements must have names).")
  }
  if (any(vapply(filters, function(x) length(x) == 0, logical(1)))) {
    .nyc_abort("`filters` values cannot be empty.")
  }
  if (anyNA(unlist(filters))) {
    .nyc_abort("`filters` cannot contain NA values.")
  }

  filters
}

.nyc_endpoint <- function(dataset_id) {
  stopifnot(
    is.character(dataset_id),
    length(dataset_id) == 1,
    nzchar(dataset_id)
  )
  paste0("https://data.cityofnewyork.us/resource/", dataset_id, ".json")
}

.nyc_add_filters <- function(query, filters) {
  if (is.null(filters) || length(filters) == 0) return(query)

  stopifnot(is.list(filters))

  make_clause <- function(field, value) {
    is_text <- is.character(value) || is.factor(value)

    if (is.factor(value)) value <- as.character(value)
    if (is.character(value)) value <- trimws(value)

    value <- as.character(value)

    if (is_text && any(!nzchar(value))) {
      .nyc_abort("`filters` character values cannot be empty or whitespace-only.")
    }

    value <- gsub("'", "''", value, fixed = TRUE)
    field_expr <- if (is_text) paste0("TRIM(", field, ")") else field

    if (length(value) == 1) {
      paste0(field_expr, " = '", value, "'")
    } else {
      vals <- paste0("'", value, "'", collapse = ", ")
      paste0(field_expr, " IN (", vals, ")")
    }
  }

  clauses <- mapply(make_clause, names(filters), filters, USE.NAMES = FALSE)
  query[["$where"]] <- paste(clauses, collapse = " AND ")

  query
}

# Allow passing a raw SoQL where clause (e.g., date ranges, inequalities)
.nyc_add_where <- function(query, where) {
  if (is.null(where) || length(where) == 0) return(query)

  if (!is.character(where) || length(where) != 1 || is.na(where)) {
    .nyc_abort("`where` must be a single non-missing character string.")
  }
  if (!nzchar(where)) return(query)

  if (!is.null(query[["$where"]]) && nzchar(query[["$where"]])) {
    query[["$where"]] <- paste0("(", query[["$where"]], ") AND (", where, ")")
  } else {
    query[["$where"]] <- where
  }

  query
}

.nyc_get_json <- function(endpoint, query, timeout_sec = 30) {
  if (!curl::has_internet()) {
    stop(
      "No internet connection detected. This function requires access to data.cityofnewyork.us.",
      call. = FALSE
    )
  }

  resp <- tryCatch(
    httr::GET(endpoint, query = query, httr::timeout(timeout_sec)),
    error = function(e) {
      stop(
        paste0(
          "NYC Open Data request failed (network unavailable or API slow).\n",
          "Try again later or increase `timeout_sec`.\n\n",
          "Underlying error: ", conditionMessage(e)
        ),
        call. = FALSE
      )
    }
  )

  if (httr::http_error(resp)) {
    status <- httr::status_code(resp)
    body_txt <- tryCatch(
      httr::content(resp, as = "text", encoding = "UTF-8"),
      error = function(e) ""
    )

    stop(
      paste0(
        "NYC Open Data request failed with HTTP status ", status, ".\n",
        "Try again later, or verify your filters.\n\n",
        if (nzchar(body_txt)) paste0("Response: ", substr(body_txt, 1, 500)) else ""
      ),
      call. = FALSE
    )
  }

  txt <- httr::content(resp, as = "text", encoding = "UTF-8")
  jsonlite::fromJSON(txt, flatten = TRUE)
}

.nyc_dataset_request <- function(dataset_id,
                                 limit = 10000,
                                 filters = list(),
                                 order = NULL,
                                 where = NULL,
                                 timeout_sec = 30) {

  # Input validation (r08)
  limit <- .nyc_validate_limit(limit)
  timeout_sec <- .nyc_validate_timeout(timeout_sec)
  filters <- .nyc_validate_filters(filters)

  endpoint <- .nyc_endpoint(dataset_id)

  query_list <- list("$limit" = limit)

  if (!is.null(order)) {
    if (!is.character(order) || length(order) != 1 || is.na(order) || !nzchar(order)) {
      .nyc_abort("`order` must be a single non-empty character string.")
    }
    query_list[["$order"]] <- order
  }

  query_list <- .nyc_add_filters(query_list, filters)
  query_list <- .nyc_add_where(query_list, where)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)

  out <- tibble::as_tibble(data)

  # r16: snake_case output names
  out <- .nyc_clean_names(out)

  # r17: helpful type coercion (safe defaults)
  out <- .nyc_coerce_types(out)

  out
}
