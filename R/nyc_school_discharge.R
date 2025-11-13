#' NYC School Discharge Reporting (Local Law 42)
#'
#' Downloads School Discharge Reporting (Local Law 42) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing School Discharge Reporting (Local Law 42) data.
#'
#' @details
#' This dataset reports student discharges from NYC public schools,
#' as required under Local Law 42. It includes counts and percentages of
#' students discharged by category, such as transfer, dropout, or other reasons.
#' Data are aggregated by school and year, supporting analysis of
#' student outcomes across the city.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/a2gn-nyzs>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_school_discharge(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_school_discharge(limit = 5000)
#' nyc_school_discharge(filters = list(school_level = "High School"))
#' }
#' @export
nyc_school_discharge <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/a2gn-nyzs.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
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
