#' Medallion Drivers - Active
#'
#' Downloads Medallion Drivers - Active data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Medallion Drivers - Active data.
#'
#' @details
#' This is a list of drivers with a current TLC Driver License, which authorizes drivers
#' to operate NYC TLC licensed yellow and green taxicabs and for-hire vehicles (FHVs).
#' This list is accurate as of the date and time shown in the Last Date Updated and
#' Last Time Updated fields.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Transportation/Medallion-Drivers-Active/jb3k-j3gp/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_medallion_drivers_active(limit = 2)
#'   small_sample
#'
#'   nyc_medallion_drivers_active(
#'     limit = 2,
#'     filters = list(type = "MEDALLION TAXI DRIVER")
#'   )
#' }
#' @export
nyc_medallion_drivers_active <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("jb3k-j3gp")

  query_list <- list(
    "$limit" = limit,
    "$order" = "last_updated_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
