#' 2015-2018 School Closure Discharge Reporting
#'
#' Downloads 2015-2018 School Closure Discharge Reporting data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing School Closure Discharge Report data.
#'
#' @details
#' This dataset provides data regarding students enrolled
#' in the closed schools according to the guidelines set by Local Law 43 of 2011.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Education/2015-2018-School-Closure-Discharge-Reporting/abh8-frsx/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_school_discharge_report_2015_2018(limit = 2)
#'   small_sample
#'
#'   nyc_school_discharge_report_2015_2018(
#'     limit = 2,
#'     filters = list(geography = "Borough")
#'   )
#' }
#' @export
nyc_school_discharge_report_2015_2018 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  .nyc_dataset_request(
    dataset_id = "abh8-frsx",
    limit = limit,
    filters = filters,
    order = "school_year DESC",
    timeout_sec = timeout_sec
  )
}
