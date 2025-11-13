#' NYC Violent and Disruptive Incidents
#'
#' Downloads Violent and Disruptive Incidents data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing Violent and Disruptive Incidents data.
#'
#' @details
#' Incident counts and rates reported by NYC schools, broken out by incident
#' category, school, and school year. Useful for safety trend analyses and
#' comparisons across school types.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/fpci-ws56>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_violent_disruptive_school_incidents(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_violent_disruptive_school_incidents(limit = 5000)
#' nyc_violent_disruptive_school_incidents(filters = list(school_type = "Public"))
#' }
#' @export
nyc_violent_disruptive_school_incidents <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/fpci-ws56.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "school_year DESC"
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
