#' NYC 311 Service Requests
#'
#' Downloads NYC 311 Service Request data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing 311 Service Request data.
#'
#' @details
#' This dataset contains all service requests made to NYC 311 since 2012.
#' Data is updated daily and includes agency, complaint type, location, and resolution.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2020-to-Present/erm2-nwe9/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_311(limit = 2)
#'   small_sample
#'
#'   nyc_311(limit = 2, filters = list(agency = "NYPD", city = "BROOKLYN"))
#' }
#' @export
nyc_311 <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("erm2-nwe9")

  query_list <- list(
    "$limit" = limit,
    "$order" = "created_date DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}

