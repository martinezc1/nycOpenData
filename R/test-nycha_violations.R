# Load the function directly from your script
source("../../R/nycha_violations.R")

library(testthat)

test_that("nycha_violations returns a tibble with expected columns", {
  data <- nycha_violations()

  expect_s3_class(data, "data.frame")

  expected_cols <- c("bldg_id", "boro", "str_nm", "viol_desc", "insp_dt")
  expect_true(all(expected_cols %in% names(data)))
})
