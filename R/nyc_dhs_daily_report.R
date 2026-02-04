#' NYC Department of Homeless Services (DHS) Daily Report
#'
#' Department of Homeless Services (DHS) Daily Report
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Department of Homeless Services (DHS) Daily Report data.
#'
#' @details
#' This dataset includes the daily number of families and individuals residing in the Department of Homeless Services (DHS)
#' shelter system and the daily number of families applying to the DHS shelter system.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/DHS-Daily-Report/k46n-sa2m/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_dhs_daily_report(limit = 2)
#'   small_sample
#'
#'   nyc_dhs_daily_report(limit = 2, filters = list(total_adults_in_shelter = 55694))
#' }
#' @export
nyc_dhs_daily_report <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("k46n-sa2m")

  query_list <- list(
    "$limit" = limit,
    "$order" = "date_of_census DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}

