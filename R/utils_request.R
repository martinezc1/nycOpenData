# Internal helpers for NYC Open Data requests ####
# - .nyc_endpoint(): constructs the Socrata endpoint URL from a dataset id
# - .nyc_add_filters(): adds equality filters (and IN() for multi-values) as a Socrata $where clause
# - .nyc_add_where(): appends a raw SoQL WHERE expression (for ranges, >=, <, etc.)
# - .nyc_get_json(): executes the request and returns parsed JSON (flattened)
# - .nyc_dataset_request(): common pattern for dataset wrapper functions + input validation (r07/r08)

.nyc_abort <- function(msg) {
  stop(msg, call. = FALSE)
}

# consistent snake_case column names
.nyc_clean_names <- function(df) {
  # janitor::clean_names() returns syntactic, snake_case names
  janitor::clean_names(df)
}

# light, safe type coercion (numeric/logical + ISO datetime when obvious)
.nyc_coerce_types <- function(df) {
  if (!inherits(df, "data.frame") || nrow(df) == 0) return(df)

  is_iso_datetime <- function(x) {
    # Strict-ish ISO datetime:
    # 2025-02-18T12:34:56
    # 2025-02-18T12:34:56.123
    # optional trailing Z or timezone offset
    grepl(
      "^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}(\\.\\d+)?(Z|[+-]\\d{2}:?\\d{2})?$",
      x
    )
  }

  parse_iso_datetime_safe <- function(x) {
    # Normalize common endings so base::strptime doesn't choke on Z / offsets
    x3 <- sub("Z$", "", x)
    x3 <- sub("([+-]\\d{2}:?\\d{2})$", "", x3)

    tryCatch(
      as.POSIXct(x3, tz = "UTC", format = "%Y-%m-%dT%H:%M:%OS"),
      error = function(e) rep(as.POSIXct(NA), length(x3))
    )
  }

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

    # Numeric (always numeric; never integer to avoid overflow warnings)
    xn <- gsub(",", "", x2, fixed = TRUE)
    ok_num <- grepl("^[-+]?(\\d+\\.?\\d*|\\d*\\.?\\d+)$", xn) | is.na(xn)
    if (all(ok_num)) {
      num <- suppressWarnings(as.numeric(xn))
      if (all(is.na(xn) | !is.na(num))) {
        df[[nm]] <- num
        next
      }
    }

    # ISO-ish datetime (only if it REALLY matches + is short enough)
    non_na <- x2[!is.na(x2)]
    if (length(non_na) > 0) {
      # If strings are huge, do not attempt datetime parsing
      if (max(nchar(non_na), na.rm = TRUE) <= 64) {
        dt_ok <- is_iso_datetime(non_na)
        if (sum(dt_ok) / length(non_na) >= 0.95) {
          parsed <- parse_iso_datetime_safe(x2)
          # Only apply if parsing succeeded for most non-missing
          if (sum(!is.na(parsed[!is.na(x2)])) / length(non_na) >= 0.95) {
            df[[nm]] <- parsed
            next
          }
        }
      }
    }
  }

  df
}

.nyc_validate_limit <- function(limit) {
  if (length(limit) != 1 || is.na(limit)) .nyc_abort("`limit` must be a single, non-missing numeric value.")
  if (!is.numeric(limit)) .nyc_abort("`limit` must be a single numeric value.")
  if (limit < 0) .nyc_abort("`limit` must be between 0 and Inf.")
  if (limit != floor(limit)) .nyc_abort("`limit` must be an integer (whole number).")
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

  out <- tibble::as_tibble(data, .name_repair = "minimal")

  # r16: snake_case output names
  out <- .nyc_clean_names(out)

  # r17: helpful type coercion (safe defaults)
  out <- .nyc_coerce_types(out)

  out
}
