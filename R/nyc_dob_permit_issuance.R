#' DOB Permit Issuance
#'
#' Downloads DOB Permit Issuance data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing DOB Permit Issuance data.
#'
#' @details
#' The Department of Buildings (DOB) issues permits for construction and demolition activities in the City of New York.
#' The construction industry must submit an application to DOB with details of the construction job they would like to complete.
#' The primary types of application, aka job type, are: New Building, Demolition, and Alterations Type 1, 2, and 3.
#' Each job type can have multiple work types, such as general construction, boiler, elevator, and plumbing.
#' Each work type will receive a separate permit. (See the DOB Job Application Filings dataset for information about each job application.)
#' Each row/record in this dataset represents the life cycle of one permit for one work type. The dataset is updated daily with new records, and each existing record will be updated as the permit application moves through the approval process to reflect the latest status of the application.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Housing-Development/DOB-Permit-Issuance/ipu4-2q9a/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_dob_permit_issuance(limit = 10)
#'   head(small_sample)
#'
#'   nyc_dob_permit_issuance(limit = 5000)
#'   nyc_dob_permit_issuance(filters = list(borough = "BROOKLYN"))
#' }
#' }
#' @export
nyc_dob_permit_issuance <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/ipu4-2q9a.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "filing_date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
