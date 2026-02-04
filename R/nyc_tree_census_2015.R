#' NYC 2015 Street Tree Census - Tree Data
#'
#' Downloads 2015 Street Tree Census - Tree Data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing 2015 Street Tree Census - Tree Data.
#'
#' @details
#' This dataset contains records from the 2015 Street Tree Census,
#' including species, health, and location information for each recorded tree.
#' Data collected by NYC Parks and volunteers.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/uvpi-gqnh>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_tree_census_2015(limit = 2)
#'   head(small_sample)
#'
#'   nyc_tree_census_2015(limit = 2, filters = list(curb_loc = "OnCurb"))
#' }
#' @export
nyc_tree_census_2015 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("uvpi-gqnh")

  query_list <- list(
    "$limit" = limit,
    "$order" = "created_at DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
