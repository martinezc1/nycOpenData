#' NYC Climate Projections: Extreme Events and Sea Level Rise
#'
#' Downloads NYC Climate Projections data on extreme events (heatwaves, degree days) 
#' and sea level rise.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing climate projection extreme events and sea level rise data.
#'
#' @details
#' This dataset reports projected extreme climate events and sea level rise for New York City. 
#' Each row corresponds to a climate period (e.g., "Baseline", "2030s (10th Percentile)") 
#' and includes metrics such as number of heatwaves per year, cooling/heating degree days, 
#' and projected sea level rise. Researchers can use this data to analyze future climate 
#' risks and trends in NYC.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/38ps-fnsg>
#'
#' @examples
#' \donttest{
#' if (curl::has_internet()) {
#'   small_sample <- nyc_events_sealevel(limit = 5)
#'   small_sample
#' }
#' }
#' @export
nyc_events_sealevel <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/38ps-fnsg.json"
  
  query_list <- list(`$limit` = limit)
  
  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }
  
  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
