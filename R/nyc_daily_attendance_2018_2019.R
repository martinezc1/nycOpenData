#' 2018-2019 Daily Attendance
#'
#' Downloads 2018-2019 Daily Student Attendance from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing 2018–2019 NYC Daily Student Attendance data.
#'
#' @details
#' Daily listing (counts) of students registered, present, absent and released by School DBN.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Education/2018-2019-Daily-Attendance/x3bb-kg5j/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_daily_attendance_2018_2019(limit = 2)
#'   small_sample
#'
#'   nyc_daily_attendance_2018_2019(
#'     limit = 2,
#'     filters = list(school_dbn = "01M015")
#'   )
#' }
#' @export
nyc_daily_attendance_2018_2019 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("x3bb-kg5j")

  query_list <- list(
    "$limit" = limit,
    "$order" = "date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
