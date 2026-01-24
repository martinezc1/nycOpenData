#' NYC DOP Juvenile Rearrest Rate (Monthly Average)
#'
#' Downloads DOP Juvenile Rearrest Rate (Monthly Average) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYC DOP Juvenile Rearrest Rate (Monthly Average) data.
#'
#' @details
#' This dataset provides the average monthly rate of juvenile rearrests
#' reported by the NYC Department of Probation (DOP). Data includes region,
#' year, and monthly averages, allowing for trend analysis across boroughs.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/c87b-2j3i>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_dop_juvenile_rearrest_rate(limit = 10)
#'   head(small_sample)
#'
#'   nyc_dop_juvenile_rearrest_rate(limit = 5000)
#'   nyc_dop_juvenile_rearrest_rate(filters = list(borough = "Citywide"))
#' }
#' }
#' @export
nyc_dop_juvenile_rearrest_rate <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/c87b-2j3i.json"

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
