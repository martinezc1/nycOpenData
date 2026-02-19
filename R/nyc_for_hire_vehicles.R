#' NYC For-Hire Vehicles (FHV) - Active
#'
#' Downloads For-Hire Vehicles (FHV) - Active data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing For-Hire Vehicles (FHV) - Active data.
#'
#' @details
#' This dataset includes all active For-Hire Vehicle (FHV) licenses in NYC,
#' such as taxis, limousines, and app-based services (e.g., Uber, Lyft).
#' Maintained by the NYC Taxi and Limousine Commission (TLC).
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/8wbx-tsch>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_for_hire_vehicles(limit = 2)
#'   small_sample
#'
#'   nyc_for_hire_vehicles(limit = 2, filters = list(active = "YES"))
#' }
#' @export
nyc_for_hire_vehicles <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  .nyc_dataset_request(
    dataset_id = "8wbx-tsch",
    limit = limit,
    filters = filters,
    order = "last_date_updated DESC",
    timeout_sec = timeout_sec
  )
}
