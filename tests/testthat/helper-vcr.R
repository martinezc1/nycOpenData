library(vcr)

# This tells vcr exactly where to find your recordings
vcr::vcr_configure(
  dir = "fixtures"
)

# tests/testthat/helper-vcr.R

if (requireNamespace("vcr", quietly = TRUE)) {

  vcr::vcr_configure(
    # Keep fixtures inside tests/testthat/fixtures
    dir = file.path("fixtures")
  )

  # Optional but helpful: ensure webmocking is enabled when available
  if (requireNamespace("webmockr", quietly = TRUE)) {
    webmockr::enable()
  }
}
