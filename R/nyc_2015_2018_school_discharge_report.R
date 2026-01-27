#' 2015-2018 School Closure Discharge Reporting
#'
#' Downloads 2015-2018 School Closure Discharge Reporting data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing School Closure Discharge Report data.
#'
#' @details
#' This dataset provides data regarding students enrolled
#' in the closed schools according to the guidelines set by Local Law 43 of 2011.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Education/2015-2018-School-Closure-Discharge-Reporting/abh8-frsx/about_data>
#'
#' @examples
#' # Quick example (fetch 2 rows)
#' small_sample <- nyc_school_discharge_report_2015_2018(limit = 2)
#' small_sample
#'
#' \donttest{
#' nyc_school_discharge_report_2015_2018(limit = 2, filters = list(geography = "Borough"))
#' }
#' @export
nyc_school_discharge_report_2015_2018 <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/abh8-frsx.json"

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
