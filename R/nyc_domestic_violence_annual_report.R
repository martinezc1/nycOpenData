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
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_domestic_violence_annual_report(limit = 10)
#'   head(small_sample)
#'
#'   nyc_domestic_violence_annual_report(limit = 5000)
#'   nyc_domestic_violence_annual_report(filters = list(category = "FJC_Client_Visits"))
#' }
#' }
#' @export
nyc_domestic_violence_annual_report <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/7t9i-jsfp.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
