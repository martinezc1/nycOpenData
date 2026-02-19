# tests/testthat/test-validate.R

test_that(".nyc_dataset_request validates limit", {
  expect_error(.nyc_dataset_request("erm2-nwe9", limit = "bad"), "limit.*single numeric", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", limit = NA), "limit.*non-missing", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", limit = -1), "limit.*between 0", ignore.case = TRUE)
})

test_that(".nyc_dataset_request validates timeout_sec", {
  expect_error(.nyc_dataset_request("erm2-nwe9", timeout_sec = "bad"), "timeout_sec.*single numeric", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", timeout_sec = NA), "timeout_sec.*non-missing", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", timeout_sec = 0), "timeout_sec.*> 0", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", timeout_sec = -5), "timeout_sec.*> 0", ignore.case = TRUE)
})

test_that(".nyc_dataset_request validates filters structure", {
  expect_error(.nyc_dataset_request("erm2-nwe9", filters = "not a list"), "filters.*named list", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", filters = list("QUEENS")), "filters.*named", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", filters = list(borough = NA)), "filters.*NA", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", filters = list(borough = character(0))), "filters.*empty", ignore.case = TRUE)
})

test_that(".nyc_dataset_request validates order and where", {
  expect_error(.nyc_dataset_request("erm2-nwe9", order = 1), "order.*character", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", order = ""), "order.*non-empty", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", where = 1), "where.*character", ignore.case = TRUE)
  expect_error(.nyc_dataset_request("erm2-nwe9", where = NA_character_), "where.*non-missing", ignore.case = TRUE)
})

test_that(".nyc_add_filters supports IN() for multi-value filters", {
  q <- .nyc_add_filters(list(), list(borough = c("QUEENS", "BRONX")))
  expect_true(grepl("(TRIM\\(borough\\)|borough)\\s+IN\\s*\\(", q[["$where"]]))
  expect_true(grepl("'QUEENS'", q[["$where"]]))
  expect_true(grepl("'BRONX'", q[["$where"]]))
})

test_that(".nyc_add_where combines clauses with AND", {
  q <- .nyc_add_filters(list(), list(agency = "NYPD"))
  q2 <- .nyc_add_where(q, "created_date >= '2025-02-18T00:00:00.000'")
  expect_true(grepl("agency", q2[["$where"]]))
  expect_true(grepl("created_date", q2[["$where"]]))
  expect_true(grepl("\\) AND \\(", q2[["$where"]]))
})
