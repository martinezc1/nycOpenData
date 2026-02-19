#' Street Hail Livery (SHL) Drivers - Active
#'
#' Downloads Street Hail Livery (SHL) Drivers - Active data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Street Hail Livery (SHL) Drivers - Active data.
#'
#' @details
#' NYC TLC licensed drivers that are currently active, in good standing and authorized to operate Street Hail Livery (SHL) vehicles.
#' This list is accurate to the date and time represented in the Last Date Updated and Last Time Updated fields.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Transportation/Street-Hail-Livery-SHL-Drivers-Active/5tub-eh45/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_street_hail_livery_active(limit = 2)
#'   small_sample
#'
#'   nyc_street_hail_livery_active(
#'     limit = 2,
#'     filters = list(status_description = "SHL UNRESTRICTED")
#'   )
#' }
#' @export
nyc_street_hail_livery_active <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  .nyc_dataset_request(
    dataset_id = "5tub-eh45",
    limit = limit,
    filters = filters,
    order = "last_update_date DESC",
    timeout_sec = timeout_sec
  )
}
