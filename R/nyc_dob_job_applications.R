#' NYC DOB Job Application Filings
#'
#' Downloads DOB Job Application Filings data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing DOB Job Application Filings data.
#'
#' @details
#' This dataset includes job application filings submitted to the NYC Department
#' of Buildings (DOB). Each record represents a construction or alteration
#' project application, including location, work type, and approval status.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/ic3t-wcy2>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_dob_job_applications(limit = 10)
#'   head(small_sample)
#'
#'   nyc_dob_job_applications(limit = 5000)
#' }
#' }
#'
#' @export
nyc_dob_job_applications <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/ic3t-wcy2.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "latest_action_date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
