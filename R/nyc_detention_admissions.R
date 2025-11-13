#' NYC Detention Admissions by Community District
#'
#' Downloads Detention Admissions by Community District data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing NYC Detention Admissions by Community District data.
#'
#' @details
#' This dataset reports annual counts of detention admissions across NYC community
#' districts, disaggregated by borough and calendar year. Provided by the NYC
#' Department of Correction and Department of Youth and Community Development.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/2hrw-qfsu>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_detention_admissions(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_detention_admissions(limit = 5000)
#' nyc_detention_admissions(filters = list(borough = "Bronx"))
#' }
#' @export
nyc_detention_admissions <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/2hrw-qfsu.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "calendar_year DESC"
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
