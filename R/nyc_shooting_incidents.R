#' NYPD Shooting Incident Data (Year To Date)
#'
#' Downloads NYPD Shooting Incident Data (Year to Date) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYPD Shooting Incident Data (Year to Date) data.
#'
#' @details
#' This is a data set that will show you every shooting incident that has occurred in New York City. It will show you the exact occur date, time, borough in which the shooting took place, location of the incident and much more. Researchers would use this dataset to find what time of day does the most shooting incidents take place or which location has the most shootings.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Year-To-Date-/5ucz-vwe8/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_shooting_incidents(limit = 2)
#'   small_sample
#'
#'   # Example with a filter (replace with real fields/values if desired)
#'   # nyc_shooting_incidents(limit = 2, filters = list(boro = "BROOKLYN"))
#' }
#' @export
nyc_shooting_incidents <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("5ucz-vwe8")

  query_list <- list(
    "$limit" = limit,
    "$order" = "occur_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
