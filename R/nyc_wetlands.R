#' NYC Wetlands
#'
#' Downloads NYC Wetlands data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing NYC Wetlands data.
#'
#' @details
#' This dataset includes verified and unverified wetland features that exist in New York City and
#' their respective locations. The columns include the wetland class of each feature, the year it
#' was verified (if applicable), and the feature's location, size, and shape using geospatial tools.
#' This dataset would be particularly useful for researchers looking to visualize NYC's wetlands
#' on a map, or to count the total number of features in each wetland class.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/dataset/NYC-Wetlands/p48c-iqtu/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_wetlands(limit = 2)
#'   small_sample
#'
#'   nyc_wetlands(limit = 2, filters = list(classname = "Forested"))
#' }
#' @export
nyc_wetlands <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("p48c-iqtu")

  query_list <- list(
    "$limit" = limit,
    "$order" = "verificationstatusyear DESC NULL LAST"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
