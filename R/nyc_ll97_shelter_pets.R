#' Local Law 97 of 2021 - Pets in Shelter Report
#'
#' Downloads Local Law 97 of 2021 - Pets in Shelter Report data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing Local Law 97 of 2021 - Pets in Shelter Report data.
#'
#' @details
#' This dataset contains quarterly survey response data on the types of pets whose
#' owners entered New York City homeless shelters. Each row represents combined
#' survey responses for one fiscal year quarter, which can be used by researchers
#' to examine trends in pet ownership among shelter entrants and inform policy or
#' resource planning.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/Local-Law-97-of-2021-Pets-in-Shelter-Report/5nux-zfmw/about_data>
#'
#' @examples
#' \donttest{
#' if (curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_locallaw97_shelter_pets(limit = 2)
#'   small_sample
#'
#'   # Example with a filter (Change 'column_name' and 'value' to real fields)
#'   # nyc_locallaw97_shelter_pets(limit = 2, filters = list(column_name = "value"))
#' }
#' }
#' @export
nyc_locallaw97_shelter_pets <- function(limit = 10000, filters = list(), timeout_sec = 30) {
  # Get the JSON endpoint from the 'API' button on NYC Open Data
  endpoint <- "https://data.cityofnewyork.us/resource/5nux-zfmw.json"

  query_list <- list(
    "$limit" = limit,
    "$order" = "date_year DESC, date_quarter DESC" # Choose a date column to sort by
  )

  if (length(filters) > 0) {
    where_clauses <- paste0(names(filters), " = '", unlist(filters), "'")
    query_list[["$where"]] <- paste(where_clauses, collapse = " AND ")
  }

  # This uses the internal package helper to fetch the data
  data <- .nyc_get_json(endpoint, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
