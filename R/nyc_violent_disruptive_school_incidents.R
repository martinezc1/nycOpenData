#' NYC Violent and Disruptive Incidents
#'
#' Downloads Violent and Disruptive Incidents data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
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
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_violent_disruptive_school_incidents(limit = 10)
#'   head(small_sample)
#'
#'   nyc_violent_disruptive_school_incidents(limit = 5000)
#'   nyc_violent_disruptive_school_incidents(filters = list(school_type = "Public"))
#' }
#' }
#' @export
nyc_violent_disruptive_school_incidents <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/fpci-ws56.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "school_year DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
