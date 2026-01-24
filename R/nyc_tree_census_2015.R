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
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_tree_census_2015(limit = 10)
#'   head(small_sample)
#'
#'   nyc_tree_census_2015(limit = 5000)
#'   nyc_tree_census_2015(filters = list(curb_loc = "OnCurb"))
#' }
#' }
#' @export
nyc_tree_census_2015 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/uvpi-gqnh.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "created_at DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
