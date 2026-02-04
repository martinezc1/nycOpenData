#' NYC Homeless Drop- In Centers
#'
#' Directory Of Homeless Drop- In Centers
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Directory Of Homeless Drop- In Centers data.
#'
#' @details
#' List of centers where homeless people are provided with hot meals, showers, medical help and a place to sleep
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/Directory-Of-Homeless-Drop-In-Centers/bmxf-3rd4/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_homeless_drop_in_centers(limit = 2)
#'   small_sample
#'
#'   nyc_homeless_drop_in_centers(limit = 2, filters = list(borough = "Bronx"))
#' }
#' @export
nyc_homeless_drop_in_centers <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("bmxf-3rd4")

  query_list <- list(
    "$limit" = limit
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
