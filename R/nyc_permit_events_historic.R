#' NYC Permitted Event Information - Historical
#'
#' Downloads historical permitted event data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 60).
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
#' \donttest{
#' if (curl::has_internet()) {
#'   small_sample <- try(
#'     nyc_permit_events_historic(limit = 2, timeout_sec = 10),
#'     silent = TRUE
#'   )
#'   if (!inherits(small_sample, "try-error")) print(small_sample)
#'
#'   filtered <- try(
#'     nyc_permit_events_historic(
#'       limit = 2,
#'       filters = list(event_type = "Construction"),
#'       timeout_sec = 10
#'     ),
#'     silent = TRUE
#'   )
#'   if (!inherits(filtered, "try-error")) print(filtered)
#' }
#' }
#'
#' @export
nyc_permit_events_historic <- function(limit = 10000, filters = list(), timeout_sec = 60) {
  endpoint <- "https://data.cityofnewyork.us/resource/bkfu-528j.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "start_date_time DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
