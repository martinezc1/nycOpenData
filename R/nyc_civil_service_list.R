#' NYC Civil Service List (Active)
#'
#' Downloads Civil Service List (Active) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing Civil Service List (Active) data.
#'
#' @details
#' This dataset provides information about active Civil Service lists,
#' including eligible candidates, examination numbers, and certification status.
#' Published by the NYC Department of Citywide Administrative Services (DCAS).
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/vx8i-nprf>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_civil_service_list(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_civil_service_list(limit = 5000)
#' nyc_civil_service_list(filters = list(last_name = "Martinez"))
#' }
#' @export
nyc_civil_service_list <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/vx8i-nprf.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "published_date DESC"
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
