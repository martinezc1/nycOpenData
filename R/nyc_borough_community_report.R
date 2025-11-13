#' NYC Borough/Community District Report
#'
#' Downloads Borough/Community District Report data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
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
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_borough_community_report(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_borough_community_report(limit = 5000)
#' nyc_borough_community_report(filters = list(borough = "Bronx"))
#' }
#' @export
nyc_borough_community_report <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/5awp-wfkt.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "month DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", filters, "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  resp <- httr::GET(endpoint, query = query_list)
  httr::stop_for_status(resp)
  data <- jsonlite::fromJSON(httr::content(resp, as = "text"), flatten = TRUE)
  tibble::as_tibble(data)
}
