#' NYC TLC New Driver Application Status
#'
#' Downloads TLC New Driver Application Status data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing TLC New Driver Application Status data.
#'
#' @details
#' This dataset provides the application status for individuals applying
#' for a New York City Taxi and Limousine Commission (TLC) driver's license.
#' It includes details such as application date, drug test status,
#' defensive driving completion, and final approval outcome.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/dpec-ucu7>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_tlc_new_driver_app_status(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_tlc_new_driver_app_status(limit = 5000)
#' nyc_tlc_new_driver_app_status(filters = list(drug_test = "NEEDED"))
#' }
#' @export
nyc_tlc_new_driver_app_status <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/dpec-ucu7.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "app_date DESC"
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
