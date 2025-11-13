#' NYC For-Hire Vehicles (FHV) - Active
#'
#' Downloads For-Hire Vehicles (FHV) - Active data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing For-Hire Vehicles (FHV) - Active data.
#'
#' @details
#' This dataset includes all active For-Hire Vehicle (FHV) licenses in NYC,
#' such as taxis, limousines, and app-based services (e.g., Uber, Lyft).
#' Maintained by the NYC Taxi and Limousine Commission (TLC).
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/8wbx-tsch>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_for_hire_vehicles(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_for_hire_vehicles(limit = 5000)
#' nyc_for_hire_vehicles(filters = list(active = "YES"))
#' }
#' @export
nyc_for_hire_vehicles <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/8wbx-tsch.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "last_date_updated DESC"
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
