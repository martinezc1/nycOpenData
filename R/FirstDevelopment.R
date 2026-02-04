#' Local Law 18 Pay and Demographics Report - Agency Report Table
#'
#' Downloads Local Law 18 Pay and Demographics Report - Agency Report Table data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Local Law 18 Pay and Demographics Report - Agency Report Table data.
#'
#' @details
#' In accordance with Local Law 18 0f 2019, this dataset displays pay and workforce demographics
#' of various city agencies. This dataset is useful for researchers wishing to explore
#' ethnicity, salary, and gender within city agencies. Each row represents a group of employees
#' with a common agency, EEO-4 Job Category, pay band, employee status and demographic attributes,
#' which include race, ethnicity and gender.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/423i-ukqr.json

#' @examples
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_locallaw18_payreport(limit = 2)
#'   small_sample
#'
#'   # Example with a filter (Change 'column_name' and 'value' to real fields)
#'   # nyc_locallaw18_payreport(limit = 2, filters = list(column_name = "value"))
#' }
#' }
#' @export
nyc_locallaw18_payreport <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  # Get the JSON endpoint from the 'API' button on NYC Open Data
endpoint <- "https://data.cityofnewyork.us/resource/423i-ukqr.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "data_year DESC" # Choose a date column to sort by
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  # This uses the internal package helper to fetch the data
  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}


