#' Housing Maintenance Code Violations NYCHA properties
#'
#' Downloads Housing Maintenance Code Violations NYCHA properties data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Housing Maintenance Code Violations NYCHA properties data.
#'
#' @details
#' This dataset displays violations of the New York City Housing Maintenance
#' Code or New York State Multiple Dwelling Law issued by Housing Inspectors
#' pursuant to inspections of NYCHA buildings at the request of the NYC Housing Court.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Housing-Development/Housing-Maintenance-Code-Violations-NYCHA-properti/im9z-53hg/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_ha_violations(limit = 2)
#'   small_sample
#'
#'   nyc_ha_violations(limit = 2, filters = list(boro_nm = "BROOKLYN"))
#' }
#'
#' @export
nyc_ha_violations <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  .nyc_dataset_request(
    dataset_id = "im9z-53hg",
    limit = limit,
    filters = filters,
    order = "insp_dt DESC",
    timeout_sec = timeout_sec
  )
}

