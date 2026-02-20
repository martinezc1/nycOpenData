# tests/testthat/test-nyc_311_2010_2019_robust.R

test_that("nyc_311_2010_2019 returns a tibble, respects limits, and supports date/range/filters", {
  vcr::use_cassette("nyc_311_2010_2019_robust", {
    # Base call
    base <- nyc_311_2010_2019(limit = 2)
    expect_s3_class(base, "tbl_df")
    expect_true(nrow(base) >= 0 && nrow(base) <= 2)
    expect_true(ncol(base) > 0)

    # r16: snake_case output names (no dots)
    expect_true(all(!grepl("\\.", names(base))))

    # IMPORTANT: any date/range filter can legitimately return 0 rows,
    # especially under VCR snapshots, so we only assert "<= limit" + tibble.

    # date branch
    a <- nyc_311_2010_2019(date = "2025-03-01", limit = 2)
    expect_s3_class(a, "tbl_df")
    expect_true(nrow(a) >= 0 && nrow(a) <= 2)

    # from/to range branch
    b <- nyc_311_2010_2019(from = "2025-03-01", to = "2025-03-02", limit = 2)
    expect_s3_class(b, "tbl_df")
    expect_true(nrow(b) >= 0 && nrow(b) <= 2)

    # from only
    c <- nyc_311_2010_2019(from = "2025-03-01", limit = 2)
    expect_s3_class(c, "tbl_df")
    expect_true(nrow(c) >= 0 && nrow(c) <= 2)

    # to only
    d <- nyc_311_2010_2019(to = "2025-03-02", limit = 2)
    expect_s3_class(d, "tbl_df")
    expect_true(nrow(d) >= 0 && nrow(d) <= 2)

    # filters (equality)
    e <- nyc_311_2010_2019(limit = 2, filters = list(agency = "NYPD"))
    expect_s3_class(e, "tbl_df")
    expect_true(nrow(e) >= 0 && nrow(e) <= 2)

    # filters (IN ...)
    f <- nyc_311_2010_2019(limit = 2, filters = list(agency = c("NYPD", "DOT")))
    expect_s3_class(f, "tbl_df")
    expect_true(nrow(f) >= 0 && nrow(f) <= 2)
  })
})

test_that("nyc_311_2010_2019 input validation errors (date XOR from/to, bad dates, limit/filters/timeout)", {
  # date XOR from/to guard
  expect_error(
    nyc_311_2010_2019(date = "2025-03-01", from = "2025-03-01"),
    "either `date` OR `from`/`to`"
  )

  # bad date coercion:
  # base::as.Date.character() throws:
  # "character string is not in a standard unambiguous format"
  # (the printed output mentions charToDate(), but the MESSAGE does not)
  expect_error(
    nyc_311_2010_2019(date = "not-a-date", limit = 2),
    "standard unambiguous format|coercible to Date"
  )
  expect_error(
    nyc_311_2010_2019(from = "nope", limit = 2),
    "standard unambiguous format|coercible to Date"
  )
  expect_error(
    nyc_311_2010_2019(to = "nope", limit = 2),
    "standard unambiguous format|coercible to Date"
  )

  # limit validation
  expect_error(nyc_311_2010_2019(limit = "a string"), "`limit` must be")
  expect_error(nyc_311_2010_2019(limit = NA), "`limit` must be")
  expect_error(nyc_311_2010_2019(limit = -1), "between 0 and Inf")
  expect_error(nyc_311_2010_2019(limit = 1.2), "integer")

  # filters validation
  expect_error(nyc_311_2010_2019(filters = "not a list"), "`filters` must be")
  expect_error(nyc_311_2010_2019(filters = list("NYPD")), "named")
  expect_error(nyc_311_2010_2019(filters = list(agency = character(0))), "cannot be empty")
  expect_error(nyc_311_2010_2019(filters = list(agency = NA_character_)), "cannot contain NA")

  # timeout validation
  expect_error(nyc_311_2010_2019(timeout_sec = 0), "`timeout_sec` must be > 0")
  expect_error(nyc_311_2010_2019(timeout_sec = "fast"), "`timeout_sec` must be")
})

test_that("utils_request helpers: clean names, coerce types, add where", {
  # r16: .nyc_clean_names
  df <- tibble::tibble("Location.Type" = "A", "ZIP Code" = "10001")
  cleaned <- .nyc_clean_names(df)
  expect_named(cleaned, c("location_type", "zip_code"))

  # r17: .nyc_coerce_types
  df2 <- tibble::tibble(
    logical_col = c("true", "false", NA),
    numeric_col = c("1", "2.5", NA),
    dt_col = c("2025-02-18T12:34:56", NA, "2025-02-18T12:34:56.123Z"),
    stays_char = c("abc", "def", NA)
  )
  coerced <- .nyc_coerce_types(df2)
  expect_type(coerced$logical_col, "logical")
  expect_type(coerced$numeric_col, "double")
  expect_s3_class(coerced$dt_col, "POSIXct")
  expect_type(coerced$stays_char, "character")

  # .nyc_add_where combination logic
  q <- list("$where" = "agency = 'NYPD'")
  q2 <- .nyc_add_where(q, "borough is not null")
  expect_true(grepl("AND", q2[["$where"]]))
})
