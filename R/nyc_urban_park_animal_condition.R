#' NYC Urban Park Ranger Animal Condition Response
#'
#' Downloads Urban Park Ranger Animal Condition Response data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
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
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_urban_park_animal_condition(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_urban_park_animal_condition(limit = 5000)
#' nyc_urban_park_animal_condition(filters = list(age = "Infant"))
#' }
#'
#' @export
nyc_urban_park_animal_condition <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/fuhs-xmg2.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "date_and_time_of_initial DESC"
  )

  if (length(filters) > 0) {
    vals <- vapply(filters, function(x) gsub("'", "''", x, fixed = TRUE), character(1))
    where_clauses <- paste0(names(filters), " = '", vals, "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  resp <- httr::GET(endpoint, query = query_list)
  httr::stop_for_status(resp)
  data <- jsonlite::fromJSON(httr::content(resp, as = "text"), flatten = TRUE)
  tibble::as_tibble(data)
}
