#' Inmate Incidents - Slashing and Stabbing
#'
#' Downloads Inmate Incidents - Slashing and Stabbing data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Inmate Incidents - Slashing and Stabbing data.
#'
#' @details
#' This dataset contains information about the kind of violent incident that happens among inmates
#' in prison. There is row that provide the incidents' ID, the data they were reported, the kind
#' of incident they were, and in what facilities those incidents occurred.A researcher might
#' want to use this dataset to investigate the kind of crimes inmates commit while they are
#' incarcerated.
#'
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Public-Safety/Inmate-Incidents-Slashing-and-Stabbing/gakf-suji/about_data>
#'
#' @examples
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_slash_stab(limit = 2)
#'   small_sample
#'
#'   # Example with a filter (Change 'column_name' and 'value' to real fields)
#'   # nyc_slash_stab(limit = 2, filters = list(column_name = "value"))
#' }
#' }
#' @export
nyc_slash_stab <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  # Get the JSON endpoint from the 'API' button on NYC Open Data
  endpoint <- .nyc_endpoint("gakf-suji")

  query_list <- list(
    "$limit" = limit,
    "$order" = "incident_type DESC" # Choose a date column to sort by
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}

