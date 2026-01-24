#' NYC Civil Service List (Active)
#'
#' Downloads Civil Service List (Active) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Civil Service List (Active) data.
#'
#' @details
#' This dataset provides information about active Civil Service lists,
#' including eligible candidates, examination numbers, and certification status.
#' Published by the NYC Department of Citywide Administrative Services (DCAS).
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/vx8i-nprf>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_civil_service_list(limit = 10)
#'   head(small_sample)
#'
#'   nyc_civil_service_list(limit = 5000)
#'   nyc_civil_service_list(filters = list(last_name = "Martinez"))
#' }
#' }
#' @export
nyc_civil_service_list <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/vx8i-nprf.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "published_date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
