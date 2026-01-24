#' MUSEUM
#'
#' Downloads Locations of New York City Museums from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Locations of New York City Museums data.
#'
#' @details
#' Locations of New York City Museums
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Recreation/MUSEUM/fn6f-htvy/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_museum_locations(limit = 10)
#'   head(small_sample)
#'
#'   nyc_museum_locations(limit = 5000)
#'   nyc_museum_locations(filters = list(city = "New York"))
#' }
#' }
#' @export
nyc_museum_locations <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/fn6f-htvy.json"

  query_list <- list(
    "$limit" = limit
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
