#' Pull a NYC Open Data dataset from the NYC Open Data catalog
#'
#' Uses a dataset `key` or `uid` from `nyc_list_datasets()` to pull data
#' from NYC Open Data.
#'
#' Dataset keys are generated from dataset names using
#' `janitor::make_clean_names()`. Because keys are derived from live catalog
#' metadata, dataset UIDs are the more stable option.
#'
#' @param dataset A dataset key or UID from `nyc_list_datasets()`.
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional named list of filters. Supports vectors (translated to IN()).
#' @param date Optional single date (matches all times that day) using `date_field`.
#' @param from Optional start date (inclusive) using `date_field`.
#' @param to Optional end date (exclusive) using `date_field`.
#' @param date_field Optional date/datetime column to use with `date`, `from`, or `to`.
#'   Must be supplied when `date`, `from`, or `to` are used.
#' @param where Optional raw SoQL WHERE clause. If `date`, `from`, or `to` are
#'   provided, their conditions are AND-ed with this.
#' @param order Optional SoQL ORDER BY clause.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @param clean_names Logical; if TRUE, convert column names to snake_case (default = TRUE).
#' @param coerce_types Logical; if TRUE, attempt light type coercion (default = TRUE).
#' @return A tibble.
#'
#' @examples
#' if (interactive() && curl::has_internet()) {
#'   # Pull by key
#'   nyc_pull_dataset("311_service_requests", limit = 3)
#'
#'   # Pull by UID
#'   nyc_pull_dataset("erm2-nwe9", limit = 3)
#'
#'   # Filters
#'   nyc_pull_dataset("erm2-nwe9", limit = 3, filters = list(borough = "QUEENS"))
#'
#'   # Date filtering
#'   nyc_pull_dataset(
#'     "erm2-nwe9",
#'     from = "2023-01-01",
#'     to = "2024-01-01",
#'     date_field = "created_date",
#'     limit = 100
#'   )
#' }
#' @export
nyc_pull_dataset <- function(dataset,
                             limit = 10000,
                             filters = list(),
                             date = NULL,
                             from = NULL,
                             to = NULL,
                             date_field = NULL,
                             where = NULL,
                             order = NULL,
                             timeout_sec = 30,
                             clean_names = TRUE,
                             coerce_types = TRUE) {

  # dataset validation
  if (!is.character(dataset) || length(dataset) != 1 || is.na(dataset) || !nzchar(dataset)) {
    stop("`dataset` must be a single, non-missing character value.", call. = FALSE)
  }

  cat_tbl <- .nyc_catalog_tbl()

  # sanity checks on required columns
  req <- c("key", "uid")
  missing_req <- setdiff(req, names(cat_tbl))
  if (length(missing_req) > 0) {
    stop(
      paste0(
        "Internal error: catalog missing required column(s): ",
        paste(missing_req, collapse = ", "),
        "."
      ),
      call. = FALSE
    )
  }

  row <- cat_tbl[cat_tbl$key == dataset | cat_tbl$uid == dataset, , drop = FALSE]

  if (nrow(row) == 0) {
    stop(
      paste0(
        "Unknown dataset: '", dataset, "'. ",
        "Use `nyc_list_datasets()` to see available keys and UIDs."
      ),
      call. = FALSE
    )
  }

  if (nrow(row) > 1) {
    stop(
      paste0(
        "Multiple catalog matches found for '", dataset, "'. ",
        "Please use the dataset UID instead."
      ),
      call. = FALSE
    )
  }

  uid <- row$uid[[1]]

  # require date_field if user supplies date filters
  if ((!is.null(date) || !is.null(from) || !is.null(to)) &&
      (is.null(date_field) || !is.character(date_field) || length(date_field) != 1 || !nzchar(date_field))) {
    .nyc_abort(
      "If `date`, `from`, or `to` are supplied, you must also provide a single non-empty `date_field`."
    )
  }

  date_where <- .nyc_build_date_where(
    date_field = date_field,
    date = date,
    from = from,
    to = to
  )

  where_final <- where
  if (!is.null(date_where)) {
    if (is.null(where_final) || !nzchar(where_final)) {
      where_final <- date_where
    } else {
      where_final <- paste0("(", where_final, ") AND (", date_where, ")")
    }
  }

  .nyc_dataset_request(
    dataset_id = uid,
    limit = limit,
    filters = filters,
    order = order,
    where = where_final,
    timeout_sec = timeout_sec,
    clean_names = clean_names,
    coerce_types = coerce_types
  )
}
