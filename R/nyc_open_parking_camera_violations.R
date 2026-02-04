#' Open Parking and Camera Violations
#'
#' Downloads Open Parking and Camera Violations data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Open Parking and Camera Violations data.
#'
#' @details
#' The Open Parking and Camera Violations dataset was initially loaded with all violations contained in the mainframe database as of May 2016.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/City-Government/Open-Parking-and-Camera-Violations/nc67-uf89/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_open_parking_camera_violations(limit = 2)
#'   small_sample
#'
#'   nyc_open_parking_camera_violations(limit = 2, filters = list(state = "NJ"))
#' }
#' @export
nyc_open_parking_camera_violations <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("nc67-uf89")

  query_list <- list(
    "$limit" = limit,
    "$order" = "issue_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
