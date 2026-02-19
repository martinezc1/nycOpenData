#' NYC 311 Service Requests 2010 to 2019
#'
#' Downloads NYC 311 Service Request from 2010 to 2019 data from NYC Open Data.
#'
#' @param limit Number of rows to retrieve (default = 10,000).
#' @param filters Optional list of field-value pairs to filter results (e.g., `list(agency = "NYPD")`).
#' @param date Optional single date for `created_date` (matches all times on that day). Can be a Date or "YYYY-MM-DD" string.
#' @param from Optional start date for `created_date` (inclusive). Can be a Date or "YYYY-MM-DD" string.
#' @param to Optional end date for `created_date` (exclusive). Can be a Date or "YYYY-MM-DD" string.
#' @param timeout_sec Request timeout in seconds (default = 30).
#' @return A tibble containing 311 Service Request 2010 to 2019 data.
#'
#' @details
#' This dataset contains all service requests made to NYC 311 from 2010 to 2019.
#' Data is updated daily and includes agency, complaint type, location, and resolution.
#'
#' @source NYC Open Data: <https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2010-to-2019/76ig-c548/about_data>
#'
#' @examples
#' # Examples that hit the live NYC Open Data API are guarded so CRAN checks
#' # do not fail when the network is unavailable or slow.
#' if (interactive() && curl::has_internet()) {
#'   # Quick example (fetch 2 rows)
#'   small_sample <- nyc_311_2010_2019(limit = 2)
#'   small_sample
#'
#'   nyc_311_2010_2019(limit = 2, filters = list(agency = "NYPD", city = "BROOKLYN"))
#' }
#' @export
nyc_311_2010_2019 <- function(limit = 10000,
                              filters = list(),
                              date = NULL,
                              from = NULL,
                              to = NULL,
                              timeout_sec = 30) {

  if (!is.null(date) && (!is.null(from) || !is.null(to))) {
    .nyc_abort("Use either `date` OR `from`/`to`, not both.")
  }

  # Helper for Floating Timestamp strings (no tz shifting)
  to_float_ts <- function(d) {
    d <- as.Date(d)
    if (is.na(d)) .nyc_abort("Dates must be coercible to Date (e.g., 'YYYY-MM-DD').")
    paste0(format(d, "%Y-%m-%d"), "T00:00:00.000")
  }

  # Optional sanity check if both are provided
  if (!is.null(from) && !is.null(to)) {
    if (as.Date(from) > as.Date(to)) {
      .nyc_abort("`from` must be on or before `to`.")
    }
  }

  where_parts <- character(0)

  if (!is.null(date)) {
    start <- to_float_ts(date)
    end   <- to_float_ts(as.Date(date) + 1)

    where_parts <- c(
      where_parts,
      paste0("created_date >= '", start, "'"),
      paste0("created_date < '", end, "'")
    )
  } else {
    if (!is.null(from)) {
      where_parts <- c(where_parts, paste0("created_date >= '", to_float_ts(from), "'"))
    }
    if (!is.null(to)) {
      where_parts <- c(where_parts, paste0("created_date < '", to_float_ts(to), "'"))
    }
  }

  where <- if (length(where_parts)) paste(where_parts, collapse = " AND ") else NULL

  .nyc_dataset_request(
    dataset_id = "76ig-c548",
    limit = limit,
    filters = filters,
    order = "created_date DESC",
    where = where,
    timeout_sec = timeout_sec
  )
}
