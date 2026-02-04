# Internal helpers for NYC Open Data requests
# - .nyc_endpoint(): constructs the Socrata endpoint URL from a dataset id
# - .nyc_add_filters(): adds a Socrata $where clause from a named list of filters
# - .nyc_get_json(): executes the request and returns parsed JSON (flattened)

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

  # Escape single quotes defensively for Socrata WHERE clause:
  # Socrata uses SQL-like quoting, where a literal single quote becomes ''
  vals <- vapply(filters, function(x) gsub("'", "''", x, fixed = TRUE), character(1))

  # Build "field = 'value'" clauses and join with AND for a Socrata $where
  where_clauses <- paste0(names(filters), " = '", unlist(vals), "'")
  query[["$where"]] <- paste(where_clauses, collapse = " AND ")

  query
}


.nyc_get_json <- function(endpoint, query, timeout_sec = 30) {
  # NOTE: This function assumes `endpoint` and `query` are already constructed.
  # It is responsible only for request execution + error handling + JSON parsing.

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
