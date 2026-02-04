#' NYC Violent and Disruptive Incidents
#'
#' Downloads Violent and Disruptive Incidents data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Violent and Disruptive Incidents data.
#'
#' @details
#' Incident counts and rates reported by NYC schools, broken out by incident
#' category, school, and school year. Useful for safety trend analyses and
#' comparisons across school types.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/fpci-ws56>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_violent_disruptive_school_incidents(limit = 2)
#'   small_sample
#'
#'   nyc_violent_disruptive_school_incidents(
#'     limit = 2,
#'     filters = list(school_type = "Public")
#'   )
#' }
#' @export
nyc_violent_disruptive_school_incidents <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("fpci-ws56")

  query_list <- list(
    "$limit" = limit,
    "$order" = "school_year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
