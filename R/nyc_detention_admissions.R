#' NYC Detention Admissions by Community District
#'
#' Downloads Detention Admissions by Community District data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYC Detention Admissions by Community District data.
#'
#' @details
#' This dataset reports annual counts of detention admissions across NYC community
#' districts, disaggregated by borough and calendar year. Provided by the NYC
#' Department of Correction and Department of Youth and Community Development.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/2hrw-qfsu>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_detention_admissions(limit = 2)
#'   small_sample
#'
#'   nyc_detention_admissions(limit = 2, filters = list(borough = "Bronx"))
#' }
#' @export
nyc_detention_admissions <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("2hrw-qfsu")

  query_list <- list(
    "$limit" = limit,
    "$order" = "calendar_year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
