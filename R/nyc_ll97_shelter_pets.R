#' Local Law 97 of 2021 - Pets in Shelter Report
#'
#' Downloads Local Law 97 of 2021 - Pets in Shelter Report data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Local Law 97 of 2021 - Pets in Shelter Report data.
#'
#' @details
#' This dataset contains quarterly survey response data on the types of pets whose
#' owners entered New York City homeless shelters. Each row represents combined
#' survey responses for one fiscal year quarter, which can be used by researchers
#' to examine trends in pet ownership among shelter entrants and inform policy or
#' resource planning.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/Local-Law-97-of-2021-Pets-in-Shelter-Report/5nux-zfmw/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_locallaw97_shelter_pets(limit = 2)
#'   small_sample
#'
#'   nyc_locallaw97_shelter_pets(limit = 2, filters = list(date_quarter = "Qtr 1"))
#' }
#' @export
nyc_locallaw97_shelter_pets <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("5nux-zfmw")

  query_list <- list(
    "$limit" = limit,
    "$order" = "date_year DESC, date_quarter DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
