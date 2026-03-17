library(readr)
library(dplyr)
library(usethis)

.nyc_catalog <- read_csv("data-raw/nyc_catalog.csv", show_col_types = FALSE)

usethis::use_data(.nyc_catalog, internal = TRUE, overwrite = TRUE)
