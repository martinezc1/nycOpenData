#' NYC Homeless Population By Year
#'
#' Directory Of Homeless Population By Year
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Directory Of Homeless Population By Year data.
#'
#' @details
#' Table of homeless population by Year (for years 2009 through 2012)
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/Directory-Of-Homeless-Population-By-Year/5t4n-d72c/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_homeless_population_by_year(limit = 10)
#'   head(small_sample)
#'
#'   nyc_homeless_population_by_year(limit = 5000)
#'   nyc_homeless_population_by_year(filters = list(area = "Subways"))
#' }
#' }
#' @export
nyc_homeless_population_by_year <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/5t4n-d72c.json"

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
