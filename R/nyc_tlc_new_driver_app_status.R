#' NYC TLC New Driver Application Status
#'
#' Downloads TLC New Driver Application Status data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
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
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_tlc_new_driver_app_status(limit = 10)
#'   head(small_sample)
#'
#'   nyc_tlc_new_driver_app_status(limit = 5000)
#'   nyc_tlc_new_driver_app_status(filters = list(drug_test = "NEEDED"))
#' }
#' }
#' @export
nyc_tlc_new_driver_app_status <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/dpec-ucu7.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "app_date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
