#' NYC DOP Juvenile Case Count By Type
#'
#' Downloads DOP Juvenile Case Count By Type data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
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
#' # Quick example (fetch 10 rows)
#' small_sample <- nyc_dop_Juvenile_cases(limit = 10)
#' head(small_sample)
#'
#' \donttest{
#' nyc_dop_Juvenile_cases(limit = 5000)
#' nyc_dop_Juvenile_cases(filters = list(borough = "Citywide"))
#' }
#' @export
nyc_dop_Juvenile_cases <- function(limit = 10000, filters = list()) {
  endpoint <- "https://data.cityofnewyork.us/resource/c49b-3kmd.json"

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
