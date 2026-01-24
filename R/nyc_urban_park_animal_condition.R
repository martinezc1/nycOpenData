#' NYC Urban Park Ranger Animal Condition Response
#'
#' Downloads Urban Park Ranger Animal Condition Response data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Urban Park Ranger Animal Condition Response data.
#'
#' @details
#' This dataset records responses by NYC Urban Park Rangers to animal-related
#' incidents across the five boroughs. It includes information on species,
#' condition, location, and outcome, helping to monitor urban wildlife trends
#' and public safety interactions.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/fuhs-xmg2>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_urban_park_animal_condition(limit = 10)
#'   head(small_sample)
#'
#'   nyc_urban_park_animal_condition(limit = 5000)
#'   nyc_urban_park_animal_condition(filters = list(age = "Infant"))
#' }
#' }
#'
#' @export
nyc_urban_park_animal_condition <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/fuhs-xmg2.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "date_and_time_of_initial DESC"
  )

  if (length(filters) > 0) {
    # Escape single quotes defensively for Socrata WHERE clause
    vals <- vapply(filters, function(x) gsub("'", "''", x, fixed = TRUE), character(1))
    where_clauses <- paste0(names(filters), " = '", vals, "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
