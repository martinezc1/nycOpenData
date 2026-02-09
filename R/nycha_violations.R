#' Pull NYCHA Housing Maintenance Violations
#'
#' @return A tibble with NYCHA Housing Code Violations
#' @details This function downloads the dataset from NYC Open Data
#' @export
nycha_violations <- function() {
  if (!require(jsonlite)) install.packages("jsonlite")
  url <- "https://data.cityofnewyork.us/resource/im9z-53hg.json"
  data <- jsonlite::fromJSON(url)
  return(data)
}
