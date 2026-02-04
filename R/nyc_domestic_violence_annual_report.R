#' Annual Report on Domestic Violence Initiatives, Indicators and Factors
#'
#' Downloads Annual Report on Domestic Violence Initiatives, Indicators and Factors data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Annual Report on Domestic Violence Initiatives, Indicators and Factors data.
#'
#' @details
#' The information in the report is required under Local Law 38 of 2019.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/Annual-Report-on-Domestic-Violence-Initiatives-Ind/7t9i-jsfp/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_domestic_violence_annual_report(limit = 2)
#'   small_sample
#'
#'   nyc_domestic_violence_annual_report(
#'     limit = 2,
#'     filters = list(category = "FJC_Client_Visits")
#'   )
#' }
#' @export
nyc_domestic_violence_annual_report <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- .nyc_endpoint("7t9i-jsfp")

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
  )

  query_list <- .nyc_add_filters(query_list, filters)

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}

