#' City Record Online
#'
#' Downloads City Record Online data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing City Record Online data.
#'
#' @details
#' The City Record Online (CROL) is a fully searchable database of notices
#' published in the City Record newspaper, including, but not limited to:
#' public hearings and meetings, public auctions and sales, solicitations and
#' awards and official rules proposed and adopted by city agencies.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/City-Government/City-Record-Online/dg92-zbpx/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_city_record(limit = 2)
#'   small_sample
#'
#'   nyc_city_record(limit = 2, filters = list(short_title = "APPOINTED"))
#' }
#' @export
nyc_city_record <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("dg92-zbpx")

  query_list <- list(
    "$limit" = limit,
    "$order" = "start_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
