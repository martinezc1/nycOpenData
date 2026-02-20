# NYC 2015 Street Tree Census - Tree Data

Downloads 2015 Street Tree Census - Tree Data from NYC Open Data.

## Usage

``` r
nyc_tree_census_2015(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/uvpi-gqnh\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing 2015 Street Tree Census - Tree Data.

## Details

This dataset contains records from the 2015 Street Tree Census,
including species, health, and location information for each recorded
tree. Data collected by NYC Parks and volunteers.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_tree_census_2015(limit = 2)
  head(small_sample)

  nyc_tree_census_2015(limit = 2, filters = list(curb_loc = "OnCurb"))
}
```
