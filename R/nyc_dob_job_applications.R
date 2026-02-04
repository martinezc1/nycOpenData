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
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_dob_job_applications(limit = 2)
#'   small_sample
#'
#'   nyc_dob_job_applications(limit = 2, filters = list(borough = "BROOKLYN"))
#' }
#'
#' @export
nyc_dob_job_applications <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("ic3t-wcy2")

  query_list <- list(
    "$limit" = limit,
    "$order" = "latest_action_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
