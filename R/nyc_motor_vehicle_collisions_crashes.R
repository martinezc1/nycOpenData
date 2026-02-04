#' Motor Vehicle Collisions - Crashes
#'
#' Downloads Motor Vehicle Collisions - Crashes data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Motor Vehicle Collisions - Crashes data.
#'
#' @details
#' The Motor Vehicle Collisions crash table contains details on the crash event.
#' Each row represents a crash event. The Motor Vehicle Collisions data tables contain information from all police reported motor vehicle collisions in NYC.
#' The police report (MV104-AN) is required to be filled out for collisions where someone is injured or killed, or where there is at least $1000 worth of damage (https://www.nhtsa.gov/sites/nhtsa.dot.gov/files/documents/ny_overlay_mv-104an_rev05_2004.pdf).
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_motor_vehicle_collisions_crashes(limit = 2)
#'   small_sample
#'
#'   nyc_motor_vehicle_collisions_crashes(limit = 2, filters = list(borough = "BROOKLYN"))
#' }
#' @export
nyc_motor_vehicle_collisions_crashes <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("h9gi-nx95")

  query_list <- list(
    "$limit" = limit,
    "$order" = "crash_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
