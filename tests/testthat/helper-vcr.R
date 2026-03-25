# tests/testthat/helper-vcr.R

if (requireNamespace("vcr", quietly = TRUE)) {
  vcr::vcr_configure(dir = "fixtures")
}

if (requireNamespace("webmockr", quietly = TRUE)) {
  webmockr::enable()
}

skip_if_no_cassette <- function(name) {
  cassette_file <- file.path("fixtures", paste0(name, ".yml"))
  record_mode <- Sys.getenv("VCR_RECORD", unset = "none")

  if (identical(record_mode, "none") && !file.exists(cassette_file)) {
    testthat::skip(paste0(
      "Cassette not recorded yet for '", name,
      "'. Run with VCR_RECORD=once to create it."
    ))
  }
}

options(testthat.snapshot.enabled = FALSE)
