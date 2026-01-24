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
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_daily_attendance_2018_2019(limit = 10)
#'   head(small_sample)
#'
#'   nyc_daily_attendance_2018_2019(limit = 5000)
#'   nyc_daily_attendance_2018_2019(filters = list(school_dbn = "01M015"))
#' }
#' }
#' @export
nyc_daily_attendance_2018_2019 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/x3bb-kg5j.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
