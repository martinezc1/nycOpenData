#' NYC Runaway and Homeless Youth (RHY) Daily Census
#'
#' Runaway and Homeless Youth (RHY) Daily Census
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Runaway and Homeless Youth (RHY) Daily Census data.
#'
#' @details
#' This data tracks the number of beds available for runaway and homeless youth and young adults as well as the number and percent vacant.
#' Data include Crisis Shelters, Crisis Shelters HYA (Homeless Young Adults), Transitional Independent Living, and Transitional Independent Living HYA.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/Runaway-and-Homeless-Youth-RHY-Daily-Census/5rw7-99k7/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_runaway_and_homeless_youth_daily_census(limit = 10)
#'   head(small_sample)
#'
#'   nyc_runaway_and_homeless_youth_daily_census(limit = 5000)
#'   nyc_runaway_and_homeless_youth_daily_census(filters = list(program_type = "Crisis Shelters"))
#' }
#' }
#' @export
nyc_runaway_and_homeless_youth_daily_census <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/5rw7-99k7.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
