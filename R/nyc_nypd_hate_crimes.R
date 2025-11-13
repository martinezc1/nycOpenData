#' NYC NYPD Hate Crimes
#'
#' Downloads NYPD Hate Crimes data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing NYC NYPD Hate Crimes data.
#'
#' @details
#' This dataset contains records of hate crime incidents reported by the NYPD.
#' Each entry includes the bias motivation, offense category, and borough,
#' providing insight into hate crime trends across New York City.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/bqiq-cu78>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_nypd_hate_crimes(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_nypd_hate_crimes(limit = 5000)
#' nyc_nypd_hate_crimes(filters = list(county = "KINGS"))
#' }
#' @export
nyc_nypd_hate_crimes <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/bqiq-cu78.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "record_create_date DESC"
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
