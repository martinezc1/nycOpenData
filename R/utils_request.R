.nyc_get_json <- function(endpoint, query, timeout_sec = 30) {
  if (!curl::has_internet()) {
    stop("No internet connection detected. This function requires access to data.cityofnewyork.us.", call. = FALSE)
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
    body_txt <- tryCatch(httr::content(resp, as = "text", encoding = "UTF-8"), error = function(e) "")
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
