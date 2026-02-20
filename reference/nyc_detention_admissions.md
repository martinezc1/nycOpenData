# NYC Detention Admissions by Community District

Downloads Detention Admissions by Community District data from NYC Open
Data.

## Usage

``` r
nyc_detention_admissions(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/2hrw-qfsu\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing NYC Detention Admissions by Community District data.

## Details

This dataset reports annual counts of detention admissions across NYC
community districts, disaggregated by borough and calendar year.
Provided by the NYC Department of Correction and Department of Youth and
Community Development.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_detention_admissions(limit = 2)
  small_sample

  nyc_detention_admissions(limit = 2, filters = list(borough = "Bronx"))
}
```
