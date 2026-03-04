#' Pull a NYC Open Data dataset from the nycOpenData catalog
#'
#' Uses a dataset `key` (from `nyc_list_datasets()`) to pull data from NYC Open Data
#' with sensible defaults (dataset id, default ordering, optional default date field).
#'
#' @param key A dataset key from `nyc_list_datasets()` (e.g., "nyc_311_2010_2019").
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional named list of filters. Supports vectors (translated to IN()).
#' @param date Optional single date (matches all times that day) using the catalog `default_date_field`.
#' @param from Optional start date (inclusive) using the catalog `default_date_field`.
#' @param to Optional end date (exclusive) using the catalog `default_date_field`.
#' @param where Optional raw SoQL WHERE clause. If date/from/to are provided, they are AND-ed with this.
#' @param order Optional SoQL order override. If NULL, uses catalog `default_order` if present.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @param clean_names Logical; if TRUE, convert column names to snake_case (default = TRUE).
#' @param coerce_types Logical; if TRUE, attempt light type coercion (default = TRUE).
#' @return A tibble.
#'
#' @examples
#' if (interactive() && curl::has_internet()) {
#'   # Pull by key
#'   nyc_pull_dataset("nyc_311_2010_2019", limit = 3)
#'
#'   # Filters
#'   nyc_pull_dataset("nyc_311_2010_2019", limit = 3, filters = list(borough = "QUEENS"))
#' }
#' @export
nyc_pull_dataset <- function(key,
                             limit = 10000,
                             filters = list(),
                             date = NULL,
                             from = NULL,
                             to = NULL,
                             where = NULL,
                             order = NULL,
                             timeout_sec = 30,
                             clean_names = TRUE,
                             coerce_types = TRUE) {

  # key validation
  if (!is.character(key) || length(key) != 1 || is.na(key) || !nzchar(key)) {
    stop("`key` must be a single, non-missing character value.", call. = FALSE)
  }

  cat_tbl <- tibble::as_tibble(.nyc_catalog)

  # sanity checks on required columns
  req <- c("key", "dataset_id")
  missing_req <- setdiff(req, names(cat_tbl))
  if (length(missing_req) > 0) {
    stop(
      paste0("Internal error: catalog missing required column(s): ",
             paste(missing_req, collapse = ", "), "."),
      call. = FALSE
    )
  }

  row <- cat_tbl[cat_tbl$key == key, , drop = FALSE]
  if (nrow(row) == 0) {
    stop(
      paste0(
        "Unknown `key`: '", key, "'. ",
        "Use `nyc_list_datasets()` to see available keys."
      ),
      call. = FALSE
    )
  }
  if (nrow(row) > 1) {
    stop(paste0("Internal error: duplicate catalog key: '", key, "'."), call. = FALSE)
  }

  dataset_id <- row$dataset_id[[1]]

  # order: user override > catalog default_order > NULL
  order_final <- order
  if (is.null(order_final) && "default_order" %in% names(row)) {
    oo <- row$default_order[[1]]
    if (!is.na(oo) && nzchar(oo)) order_final <- oo
  }

  # date where: only if catalog provides default_date_field
  date_field <- NULL
  if ("default_date_field" %in% names(row)) {
    df <- row$default_date_field[[1]]
    if (!is.na(df) && nzchar(df)) date_field <- df
  }

  date_where <- .nyc_build_date_where(date_field, date = date, from = from, to = to)

  where_final <- where
  if (!is.null(date_where)) {
    if (is.null(where_final) || !nzchar(where_final)) {
      where_final <- date_where
    } else {
      where_final <- paste0("(", where_final, ") AND (", date_where, ")")
    }
  } else {
    # If user asked for dates but catalog doesn't define a date field, error early
    if (!is.null(date) || !is.null(from) || !is.null(to)) {
      .nyc_abort(
        paste0(
          "This dataset does not define `default_date_field` in the catalog, ",
          "so `date`, `from`, and `to` are not supported for key: '", key, "'."
        )
      )
    }
  }

  .nyc_dataset_request(
    dataset_id = dataset_id,
    limit = limit,
    filters = filters,
    order = order_final,
    where = where_final,
    timeout_sec = timeout_sec,
    clean_names = clean_names,
    coerce_types = coerce_types
  )
}
