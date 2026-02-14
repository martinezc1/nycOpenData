#' NYPD Shootings
#'
#' Downloads NYPD Shooting Incident data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYPD Shooting Incident Data (Year to Date) data.
#'
#' @details
#' This is a dataset identifies of every shooting incident that occurred in NYC since 2006.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Public-Safety/NYPD-Shootings/98wc-x49t/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_shooting_incidents(limit = 2)
#'   small_sample
#'
#'   nyc_shooting_incidents(limit = 2, filters = list(boro = "BROOKLYN"))
#' }
#' @export
nyc_shooting_incidents <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("98wc-x49t")

  query_list <- list(
    "$limit" = limit,
    "$order" = "occur_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
