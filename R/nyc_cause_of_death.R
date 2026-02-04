#' New York City Leading Causes of Death
#'
#' Downloads New York City Leading Causes of Death data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing New York City Leading Causes of Death data.
#'
#' @details
#' The leading causes of death by sex and ethnicity in New York City in since 2007.
#' Cause of death is derived from the NYC death certificate which is issued for every death that occurs in New York City.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Health/New-York-City-Leading-Causes-of-Death/jb7j-dtam/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_cause_of_death(limit = 2)
#'   small_sample
#'
#'   nyc_cause_of_death(limit = 2, filters = list(sex = "M"))
#' }
#' @export
nyc_cause_of_death <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("jb7j-dtam")

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
