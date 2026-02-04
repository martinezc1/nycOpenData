#' NYC School Discharge Reporting (Local Law 42)
#'
#' Downloads School Discharge Reporting (Local Law 42) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing School Discharge Reporting (Local Law 42) data.
#'
#' @details
#' This dataset reports student discharges from NYC public schools,
#' as required under Local Law 42. It includes counts and percentages of
#' students discharged by category, such as transfer, dropout, or other reasons.
#' Data are aggregated by school and year, supporting analysis of
#' student outcomes across the city.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/a2gn-nyzs>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_school_discharge(limit = 2)
#'   small_sample
#'
#'   nyc_school_discharge(
#'     limit = 2,
#'     filters = list(school_level = "High School")
#'   )
#' }
#' @export
nyc_school_discharge <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("a2gn-nyzs")

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
