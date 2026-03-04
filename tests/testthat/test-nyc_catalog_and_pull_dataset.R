test_that("nyc_list_datasets returns a catalog tibble with expected columns", {
  cat <- nyc_list_datasets()
  expect_s3_class(cat, "tbl_df")
  expect_true(nrow(cat) >= 1)

  expected_cols <- c(
    "key", "dataset_id", "title", "description",
    "default_order", "default_date_field",
    "landing_page_url", "topic"
  )

  # Allow extra columns; require at least these
  expect_true(all(expected_cols %in% names(cat)))
})

test_that("nyc_pull_dataset returns a tibble, respects limits, supports filters + date/from/to (catalog-driven)", {
  skip_if_not_installed("vcr")
  skip_if_not_installed("curl")

  # pick a stable, known key (update if your catalog key differs)
  key <- "nyc_311_2010_2019"

  vcr::use_cassette("nyc_pull_dataset_robust", {
    # base
    base <- nyc_pull_dataset(key = key, limit = 2)
    expect_s3_class(base, "tbl_df")
    expect_true(nrow(base) >= 0 && nrow(base) <= 2)
    expect_true(ncol(base) > 0)

    # r16: snake_case output names (no dots) when clean_names default TRUE
    expect_true(all(!grepl("\\.", names(base))))

    # filters: equality
    f1 <- nyc_pull_dataset(key = key, limit = 2, filters = list(agency = "NYPD"))
    expect_s3_class(f1, "tbl_df")
    expect_true(nrow(f1) >= 0 && nrow(f1) <= 2)

    # filters: IN (...)
    f2 <- nyc_pull_dataset(key = key, limit = 2, filters = list(agency = c("NYPD", "DOT")))
    expect_s3_class(f2, "tbl_df")
    expect_true(nrow(f2) >= 0 && nrow(f2) <= 2)

    # date branch (only works if catalog default_date_field is set for this key)
    d1 <- nyc_pull_dataset(key = key, date = "2025-03-01", limit = 2)
    expect_s3_class(d1, "tbl_df")
    expect_true(nrow(d1) >= 0 && nrow(d1) <= 2)

    # from/to range branch
    d2 <- nyc_pull_dataset(key = key, from = "2025-03-01", to = "2025-03-02", limit = 2)
    expect_s3_class(d2, "tbl_df")
    expect_true(nrow(d2) >= 0 && nrow(d2) <= 2)

    # from only
    d3 <- nyc_pull_dataset(key = key, from = "2025-03-01", limit = 2)
    expect_s3_class(d3, "tbl_df")
    expect_true(nrow(d3) >= 0 && nrow(d3) <= 2)

    # to only
    d4 <- nyc_pull_dataset(key = key, to = "2025-03-02", limit = 2)
    expect_s3_class(d4, "tbl_df")
    expect_true(nrow(d4) >= 0 && nrow(d4) <= 2)
  })
})

test_that("nyc_pull_dataset input validation errors", {
  # key validation
  expect_error(nyc_pull_dataset(key = NA_character_), "`key` must be")
  expect_error(nyc_pull_dataset(key = ""), "`key` must be")

  # unknown key
  expect_error(
    nyc_pull_dataset(key = "not_a_real_key", limit = 1),
    "Unknown `key`"
  )

  # date XOR from/to guard
  expect_error(
    nyc_pull_dataset(key = "nyc_311_2010_2019", date = "2025-03-01", from = "2025-03-01"),
    "either `date` OR `from`/`to`"
  )

  # date format validation
  expect_error(
    nyc_pull_dataset(key = "nyc_311_2010_2019", date = "03/01/2025", limit = 1),
    "YYYY-MM-DD"
  )

  # limit validation
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", limit = "a string"), "`limit` must be")
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", limit = NA), "`limit` must be")
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", limit = -1), "between 0 and Inf")
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", limit = 1.2), "integer")

  # filters validation
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", filters = "not a list"), "`filters` must be")
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", filters = list("NYPD")), "named")
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", filters = list(agency = character(0))), "cannot be empty")
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", filters = list(agency = NA_character_)), "cannot contain NA")

  # timeout validation
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", timeout_sec = 0), "`timeout_sec` must be > 0")
  expect_error(nyc_pull_dataset(key = "nyc_311_2010_2019", timeout_sec = "fast"), "`timeout_sec` must be")
})

test_that("nyc_pull_dataset errors on date args when catalog has no default_date_field (if such a dataset exists)", {
  cat <- nyc_list_datasets()

  # Find a key with missing/blank default_date_field
  no_date <- cat[is.na(cat$default_date_field) | !nzchar(cat$default_date_field), , drop = FALSE]

  if (nrow(no_date) == 0) {
    skip("No catalog rows without default_date_field; skipping this test.")
  }

  key0 <- no_date$key[[1]]

  expect_error(
    nyc_pull_dataset(key = key0, from = "2025-03-01", limit = 1),
    "default_date_field"
  )
})

test_that("nyc_pull_dataset supports clean_names/coerce_types toggles", {
  skip_if_not_installed("vcr")
  skip_if_not_installed("webmockr")
  skip_if_not_installed("curl")

  cassette <- "nyc_pull_dataset_toggles"
  cassette_file <- file.path("tests", "testthat", "fixtures", paste0(cassette, ".yml"))

  record_mode <- Sys.getenv("VCR_RECORD", unset = "none")

  # Only skip when we are NOT recording
  if (record_mode == "none" && !file.exists(cassette_file)) {
    skip("Cassette not recorded yet; run with VCR_RECORD=once to create it, then commit fixtures.")
  }

  key <- "nyc_311_2010_2019"

  # IMPORTANT: do NOT force record = "none" here, or it can’t create the cassette
  vcr::use_cassette(cassette, {
    a <- nyc_pull_dataset(key = key, limit = 2)
    expect_s3_class(a, "tbl_df")
    expect_true(nrow(a) <= 2)

    b <- nyc_pull_dataset(key = key, limit = 2, clean_names = FALSE)
    expect_s3_class(b, "tbl_df")
    expect_true(nrow(b) <= 2)

    c <- nyc_pull_dataset(key = key, limit = 2, coerce_types = FALSE)
    expect_s3_class(c, "tbl_df")
    expect_true(nrow(c) <= 2)

    d <- nyc_pull_dataset(key = key, limit = 2, clean_names = FALSE, coerce_types = FALSE)
    expect_s3_class(d, "tbl_df")
    expect_true(nrow(d) <= 2)

    if (ncol(a) > 0 && ncol(b) > 0) {
      expect_false(identical(names(a), names(b)))
    }
  })
})
