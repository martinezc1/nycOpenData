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
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_urban_park_animal_condition(limit = 2)
#'   small_sample
#'
#'   nyc_urban_park_animal_condition(limit = 2, filters = list(age = "Infant"))
#' }
#'
#' @export
nyc_urban_park_animal_condition <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("fuhs-xmg2")

  query_list <- list(
    "$limit" = limit,
    "$order" = "date_and_time_of_initial DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}

