#' NYC Borough/Community District Report
#'
#' Downloads Borough/Community District Report data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Borough/Community District Report data.
#'
#' @details
#' This dataset provides monthly reports by borough and community district,
#' covering metrics such as service requests, inspections, and community outreach.
#' It’s published by NYC Department of Social Services for transparency and analysis.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/5awp-wfkt>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_borough_community_report(limit = 10)
#'   head(small_sample)
#'
#'   nyc_borough_community_report(limit = 5000)
#'   nyc_borough_community_report(filters = list(borough = "Bronx"))
#' }
#' }
#' @export
nyc_borough_community_report <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/5awp-wfkt.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "month DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
