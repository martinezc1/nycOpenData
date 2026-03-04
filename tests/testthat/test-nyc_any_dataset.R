test_that("nyc_any_dataset returns a tibble, respects limits, and supports postprocess toggles", {
  skip_if_not_installed("vcr")
  skip_if_not_installed("curl")

  endpoint <- "https://data.cityofnewyork.us/resource/erm2-nwe9.json"

  vcr::use_cassette("nyc_any_dataset_robust", {
    base <- nyc_any_dataset(endpoint, limit = 2)
    expect_s3_class(base, "tbl_df")
    expect_true(nrow(base) >= 0 && nrow(base) <= 2)
    expect_true(ncol(base) > 0)

    # clean_names TRUE default -> should have no dots
    expect_true(all(!grepl("\\.", names(base))))

    raw_names <- nyc_any_dataset(endpoint, limit = 2, clean_names = FALSE, coerce_types = FALSE)
    expect_s3_class(raw_names, "tbl_df")
    expect_true(nrow(raw_names) >= 0 && nrow(raw_names) <= 2)

    # At minimum, toggling clean_names should usually change names
    # (don't require dots, but do require "different names" when both have columns)
    if (ncol(base) > 0 && ncol(raw_names) > 0) {
      expect_false(identical(names(base), names(raw_names)))
    }
  })
})

test_that("nyc_any_dataset input validation errors", {
  expect_error(nyc_any_dataset(NA_character_), "`json_link` must be")
  expect_error(nyc_any_dataset("not a url"), "ending in .json")
  expect_error(nyc_any_dataset("https://data.cityofnewyork.us/resource/erm2-nwe9"), "ending in .json")

  expect_error(nyc_any_dataset("https://data.cityofnewyork.us/resource/erm2-nwe9.json", limit = "bad"), "`limit` must be")
  expect_error(nyc_any_dataset("https://data.cityofnewyork.us/resource/erm2-nwe9.json", timeout_sec = 0), "`timeout_sec` must be > 0")
})
