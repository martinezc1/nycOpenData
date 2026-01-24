#' 2013-2015 School Closure Discharge Reporting
#'
#' Downloads 2013-2015 School Closure Discharge Reporting data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing School Closure Discharge data.
#'
#' @details
#' This report provides data regarding students enrolled in the closed schools
#' according to the guidelines set by Local Law 43 of 2011.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Education/2013-2015-School-Closure-Discharge-Reporting/r773-ytwa/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_school_discharge_report_2013_2015(limit = 10)
#'   head(small_sample)
#'
#'   nyc_school_discharge_report_2013_2015(limit = 5000)
#'   nyc_school_discharge_report_2013_2015(filters = list(geography = "Citywide"))
#' }
#' }
#' @export
nyc_school_discharge_report_2013_2015 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/r773-ytwa.json"

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
