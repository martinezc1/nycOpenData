#' List datasets available in nycOpenData
#'
#' Returns a catalog of datasets supported by this package.
#'
#' @return A tibble of available datasets.
#' @examples
#' nyc_list_datasets()
#' @export
nyc_list_datasets <- function() {
  tibble::as_tibble(.nyc_catalog)
}
