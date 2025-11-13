#' NYC DOP Juvenile Rearrest Rate (Monthly Average)
#'
#' Downloads DOP Juvenile Rearrest Rate (Monthly Average) data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @return A tibble containing NYC DOP Juvenile Rearrest Rate (Monthly Average) data.
#'
#' @details
#' This dataset provides the average monthly rate of juvenile rearrests
#' reported by the NYC Department of Probation (DOP). Data includes region,
#' year, and monthly averages, allowing for trend analysis across boroughs.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/resource/c87b-2j3i>
#'
#' @examples
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_dop_juvenile_rearrest_rate(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_dop_juvenile_rearrest_rate(limit = 5000)
#' nyc_dop_juvenile_rearrest_rate(filters = list(borough = "Citywide"))
#' }
#' @export
nyc_dop_juvenile_rearrest_rate <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/c87b-2j3i.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "year DESC"
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
