#' NYC NYPD Hate Crimes
#'
#' Downloads NYPD Hate Crimes data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYC NYPD Hate Crimes data.
#'
#' @details
#' This dataset contains records of hate crime incidents reported by the NYPD.
#' Each entry includes the bias motivation, offense category, and borough,
#' providing insight into hate crime trends across New York City.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/bqiq-cu78>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_nypd_hate_crimes(limit = 2)
#'   small_sample
#'
#'   nyc_nypd_hate_crimes(limit = 2, filters = list(county = "KINGS"))
#' }
#' @export
nyc_nypd_hate_crimes <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("bqiq-cu78")

  query_list <- list(
    "$limit" = limit,
    "$order" = "record_create_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
