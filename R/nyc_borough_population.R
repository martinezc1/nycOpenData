#' New York City Population by Borough, 1950 - 2040
#'
#' Downloads historical and projected NYC population data by borough from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing City Record Online data.
#'
#' @details
#' This dataset contains population figures for New York City's five boroughs
#' from 1940 to 2040. It includes both historical census data and population
#' projections, allowing analysis of demographic trends across Brooklyn, Bronx,
#' Manhattan, Queens, and Staten Island over a 90-year period.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/City-Government/New-York-City-Population-by-Borough-1940-2040/xywu-7bv9>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_borough_population(limit = 2)
#'   small_sample
#'
#'   nyc_borough_population(limit = 2, filters = list(borough = "Bronx"))
#' }
#' @export
nyc_borough_population <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("xywu-7bv9")

  query_list <- list(
    "$limit" = limit
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}

