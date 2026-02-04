#' NYC Pets in Shelter Report
#'
#' Local Law 97 of 2021 - Pets in Shelter Report from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Local Law 97 of 2021 - Pets in Shelter Report data.
#'
#' @details
#' This quarterly report provides survey response data about the types of pets whose owners enter homeless shelters.
#' Data is aggregated at the quarterly level (ie: 2024 Q3).
#' The unit of analysis is a fiscal year quarter: Quarter 1 (Q1): July - September; Quarter 2 (Q2): October - December; Quarter 3 (Q3): January - March; Quarter 4 (Q4): April - June.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/Local-Law-97-of-2021-Pets-in-Shelter-Report/5nux-zfmw/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_pets_in_shelters(limit = 2)
#'   small_sample
#'
#'   nyc_pets_in_shelters(limit = 2, filters = list(date_quarter = "Qtr 1"))
#' }
#' @export
nyc_pets_in_shelters <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("5nux-zfmw")

  query_list <- list(
    "$limit" = limit,
    "$order" = "date_year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
