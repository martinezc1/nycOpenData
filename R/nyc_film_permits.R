#' Film Permits
#'
#' Downloads Film Permits data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Film Permits data.
#'
#' @details
#' Permits are generally required when asserting the exclusive use of city property,
#' like a sidewalk, a street, or a park.
#' See http://www1.nyc.gov/site/mome/permits/when-permit-required.page
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_film_permits(limit = 10)
#'   head(small_sample)
#'
#'   nyc_film_permits(limit = 5000)
#'   nyc_film_permits(filters = list(eventtype = "Shooting Permit"))
#' }
#' }
#' @export
nyc_film_permits <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/tg4x-b46p.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "enteredon DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
