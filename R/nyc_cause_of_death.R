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
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_cause_of_death(limit = 10)
#'   head(small_sample)
#'
#'   nyc_cause_of_death(limit = 5000)
#'   nyc_cause_of_death(filters = list(sex = "M"))
#' }
#' }
#' @export
nyc_cause_of_death <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/jb7j-dtam.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
