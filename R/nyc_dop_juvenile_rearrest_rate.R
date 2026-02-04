#' NYC DOP Juvenile Rearrest Rate (Monthly Average)
#'
#' Downloads DOP Juvenile Rearrest Rate (Monthly Average) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYC DOP Juvenile Rearrest Rate (Monthly Average) data.
#'
#' @details
#' This dataset provides the average monthly rate of juvenile rearrests
#' reported by the NYC Department of Probation (DOP). Data includes region,
#' year, and monthly averages, allowing for trend analysis across boroughs.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/c87b-2j3i>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_dop_juvenile_rearrest_rate(limit = 2)
#'   small_sample
#'
#'   nyc_dop_juvenile_rearrest_rate(limit = 2, filters = list(borough = "Citywide"))
#' }
#' @export
nyc_dop_juvenile_rearrest_rate <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("c87b-2j3i")

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
