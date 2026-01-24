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
#' # Examples that hit the live NYC Open Data API are wrapped so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 10 rows)
#'   small_sample <- nyc_dop_Juvenile_cases(limit = 10)
#'   head(small_sample)
#'
#'   nyc_dop_Juvenile_cases(limit = 5000)
#'   nyc_dop_Juvenile_cases(filters = list(borough = "Citywide"))
#' }
#' }
#' @export
nyc_dop_Juvenile_cases <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  endpoint <- "https://data.cityofnewyork.us/resource/c49b-3kmd.json"

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
