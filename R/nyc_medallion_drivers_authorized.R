#' Medallion Vehicles - Authorized
#'
#' Downloads Medallion Vehicles - Authorized data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Medallion Vehicles - Authorized data.
#'
#' @details
#' This dataset, which includes all TLC licensed medallion vehicles which are in good standing and able to drive,
#' is updated every day in the evening between 4–7pm.
#' Please check the 'Last Update Date' field to make sure the list has updated successfully.
#' 'Last Update Date' should show either today or yesterday's date, depending on the time of day.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Transportation/Medallion-Vehicles-Authorized/rhe8-mgbb/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_medallion_drivers_authorized(limit = 2)
#'   small_sample
#'
#'   nyc_medallion_drivers_authorized(limit = 2, filters = list(current_status = "CUR"))
#' }
#' @export
nyc_medallion_drivers_authorized <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  .nyc_dataset_request(
    dataset_id = "rhe8-mgbb",
    limit = limit,
    filters = filters,
    order = "last_updated_date DESC",
    timeout_sec = timeout_sec
  )
}
