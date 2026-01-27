library(vcr)

# This tells vcr exactly where to find your recordings
vcr::vcr_configure(
  dir = "fixtures"
)
