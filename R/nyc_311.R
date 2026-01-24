#' NYC 311 Service Requests
#'
#' Downloads NYC 311 Service Request data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing 311 Service Request data.
#'
#' @details
#' This dataset contains all service requests made to NYC 311 since 2010.
#' Data is updated daily and includes agency, complaint type, location, and resolution.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2010-to-Present/erm2-nwe9/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_311(limit = 2)
#'   small_sample
#'   nyc_311(filters = list(agency = "NYPD", city = "BROOKLYN"))
#' }
#' }
#' @export
nyc_311 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/erm2-nwe9.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "created_date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  if (!curl::has_internet()) {
    stop(
      "No internet connection detected. nyc_311() requires access to data.cityofnewyork.us.",
      call. = FALSE
    )
  }

  resp <- tryCatch(
    httr::GET(
      endpoint,
      query = query_list,
      httr::timeout(timeout_sec)
    ),
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

  # Convert non-200 responses into friendly errors
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
  data <- jsonlite::fromJSON(txt, flatten = TRUE)
  tibble::as_tibble(data)
}
