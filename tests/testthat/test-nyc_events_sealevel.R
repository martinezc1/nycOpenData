test_that("nyc_events_sealevel returns a tibble and respects limits", {
  vcr::use_cassette("nyc_events_sealevel_test", {
    results <- nyc_events_sealevel(limit = 5)
    
    expect_s3_class(results, "tbl_df")
    expect_equal(nrow(results), 5)
  })
})

test_that("nyc_events_sealevel throws errors for bad inputs", {
  expect_error(nyc_events_sealevel(limit = "a string"))
  expect_error(nyc_events_sealevel(filters = "not a list"))
})
