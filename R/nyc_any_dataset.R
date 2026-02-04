#' Load Any NYC Open Data Dataset
#'
#' Downloads any NYC Open Data dataset given its Socrata JSON endpoint.
#'
#' @param json_link A Socrata dataset JSON endpoint URL (e.g., "https://data.cityofnewyork.us/resource/abcd-1234.json").
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing the requested dataset.
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   endpoint <- "https://data.cityofnewyork.us/resource/erm2-nwe9.json"
#'   out <- try(nyc_any_dataset(endpoint, limit = 3), silent = TRUE)
#'   if (!inherits(out, "try-error")) {
#'     head(out)
#'   }
#' }
#' @export
nyc_any_dataset <- function(json_link, limit = 10000, timeout_sec = 30) {
  if (!is.character(json_link) || length(json_link) != 1 || is.na(json_link)) {
    stop("`json_link` must be a single, non-missing character URL.", call. = FALSE)
  }
  if (!grepl("\\.json($|\\?)", json_link)) {
    stop("`json_link` must be a Socrata JSON endpoint ending in .json.", call. = FALSE)
  }

  query_list <- list("$limit" = as.integer(limit))

  data <- .nyc_get_json(json_link, query_list, timeout_sec = timeout_sec)
  tibble::as_tibble(data)
}
