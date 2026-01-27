test_that("nyc_school_discharge returns a tibble and respects limits", {
  # This 'cassette' will be saved in tests/fixtures/nyc_311_test.yml
  vcr::use_cassette("nyc_school_discharge_test", {

    # We use a small limit (2) to keep the recording file small
    results <- nyc_school_discharge(limit = 2)

    # Assertions: What should be true?
    expect_s3_class(results, "tbl_df")
    expect_equal(nrow(results), 2)
  })
})
