#' @importFrom rlang .data
NULL

#' List datasets available in nycOpenData
#'
#' Retrieves the current NYC Open Data catalog and returns datasets available
#' for use with `nyc_pull_dataset()`.
#'
#' Keys are generated from dataset names using `janitor::make_clean_names()`.
#'
#' @return A tibble of available datasets, including generated `key`, dataset
#'   `uid`, and dataset `name`.
#' @examples
#' if (interactive() && curl::has_internet()) {
#'   nyc_list_datasets()
#' }
#' @export
nyc_list_datasets <- function() {
  .nyc_catalog_tbl()
}

.nyc_catalog_tbl <- function() {
  raw <- .nyc_dataset_request(
    dataset_id = "5tqd-u88y",
    limit = 50000,
    timeout_sec = 30,
    clean_names = TRUE,
    coerce_types = FALSE
  )

  raw |>
    dplyr::filter(.data$type == "dataset") |>
    dplyr::mutate(
      key = janitor::make_clean_names(.data$name)
    ) |>
    dplyr::filter(!is.na(.data$uid), nzchar(.data$uid)) |>
    dplyr::distinct(.data$uid, .keep_all = TRUE) |>
    dplyr::relocate("key", "uid", "name")
}
