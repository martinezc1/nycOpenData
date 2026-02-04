#' Statistical Summary Period Attendance Reporting (PAR)
#'
#' Downloads Statistical Summary Period Attendance Reporting (PAR) from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Period Attendance data.
#'
#' @details
#' Statistical report on attendance by borough, grade.
#' Alternate views of same data by grade level and enrollment (register).
#' All students including YABC, adults, LYFE babies and charters, home instruction, home/hospital, CBO UPK.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Education/Statistical-Summary-Period-Attendance-Reporting-PA/hrsu-3w2q/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_period_attendance_reporting(limit = 2)
#'   small_sample
#'
#'   nyc_period_attendance_reporting(limit = 2, filters = list(boro = "X"))
#' }
#' @export
nyc_period_attendance_reporting <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("hrsu-3w2q")

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
