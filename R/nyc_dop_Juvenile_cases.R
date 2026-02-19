#' NYC DOP Juvenile Case Count By Type
#'
#' Downloads DOP Juvenile Case Count By Type data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing DOP Juvenile Case Count By Type data.
#'
#' @details
#' This dataset tracks the number of juvenile cases handled by the NYC Department
#' of Probation (DOP), broken down by case type and region. It provides insight
#' into trends in youth justice and probation supervision citywide.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/c49b-3kmd>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_dop_juvenile_cases(limit = 2)
#'   small_sample
#'
#'   nyc_dop_juvenile_cases(limit = 2, filters = list(borough = "Citywide"))
#' }
#' @export
nyc_dop_juvenile_cases <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  .nyc_dataset_request(
    dataset_id = "c49b-3kmd",
    limit = limit,
    filters = filters,
    order = "year DESC",
    timeout_sec = timeout_sec
  )
}
