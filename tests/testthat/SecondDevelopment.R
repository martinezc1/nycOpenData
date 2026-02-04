test_that("nyc_locallaw18_payreport returns a tibble and respects limits", {
  # This 'cassette' will be saved in tests/fixtures/nyc_311_test.yml
  vcr::use_cassette("nyc_nyc_locallaw18_payreport_test", {

    # We use a small limit (2) to keep the recording file small
    results <- nyc_locallaw18_payreport(limit = 2)

    # Assertions: What should be true?
    expect_s3_class(results, "tbl_df")
    expect_equal(nrow(results), 2)
  })
})

test_that("nyc_locallaw18_payreport throws errors for bad inputs", {
  # This touches the new 'stop' lines you just added
  expect_error(nyc_locallaw18_payreport(limit = "a string"))
  expect_error(nyc_locallaw18_payreport(filters = "not a list"))
})




