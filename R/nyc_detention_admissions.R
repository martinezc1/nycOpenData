#' NYC Detention Admissions by Community District
#'
#' Downloads Detention Admissions by Community District data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYC Detention Admissions by Community District data.
#'
#' @details
#' This dataset reports annual counts of detention admissions across NYC community
#' districts, disaggregated by borough and calendar year. Provided by the NYC
#' Department of Correction and Department of Youth and Community Development.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/2hrw-qfsu>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_detention_admissions(limit = 10)
#'   head(small_sample)
#'
#'   nyc_detention_admissions(limit = 5000)
#'   nyc_detention_admissions(filters = list(borough = "Bronx"))
#' }
#' }
#' @export
nyc_detention_admissions <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/2hrw-qfsu.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "calendar_year DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
