#' NYC Permitted Event Information - Historical
#'
#' Downloads historical permitted event data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing NYC Permitted Event Information - Historical data.
#'
#' @details
#' This dataset includes historical information about events permitted
#' through the Office of Citywide Event Coordination and Management (CECM),
#' including parades, festivals, street fairs, and other public gatherings.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/bkfu-528j>
#'
#' @examples
#' \dontrun{
#' # Fetch a small sample
#' small_sample <- nyc_permit_events_historic(limit = 10)
#' head(small_sample)
#'
#' # Larger pull (will depend on API stability)
#' nyc_permit_events_historic(limit = 5000)
#'
#' # With a filter
#' nyc_permit_events_historic(filters = list(event_type = "Construction"))
#' }
#'
#' @export
nyc_permit_events_historic <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/bkfu-528j.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "start_date_time DESC"
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
