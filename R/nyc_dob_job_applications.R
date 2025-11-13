#' NYC DOB Job Application Filings
#'
#' Downloads DOB Job Application Filings data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing DOB Job Application Filings data.
#'
#' @details
#' This dataset includes job application filings submitted to the NYC Department
#' of Buildings (DOB). Each record represents a construction or alteration
#' project application, including location, work type, and approval status.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/ic3t-wcy2>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_dob_job_applications(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_dob_job_applications(limit = 10)
#' }

#' @export
nyc_dob_job_applications <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/ic3t-wcy2.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "latest_action_date DESC"
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", filters, "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  resp <- httr::GET(endpoint, query = query_list)
  httr::stop_for_status(resp)
  data <- jsonlite::fromJSON(httr::content(resp, as = "text"), flatten = TRUE)
  tibble::as_tibble(data)
}
