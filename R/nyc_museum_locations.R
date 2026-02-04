#' MUSEUM
#'
#' Downloads Locations of New York City Museums from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Locations of New York City Museums data.
#'
#' @details
#' Locations of New York City Museums
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Recreation/MUSEUM/fn6f-htvy/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_museum_locations(limit = 2)
#'   small_sample
#'
#'   nyc_museum_locations(limit = 2, filters = list(city = "New York"))
#' }
#' @export
nyc_museum_locations <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("fn6f-htvy")

  query_list <- list(
    "$limit" = limit
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
