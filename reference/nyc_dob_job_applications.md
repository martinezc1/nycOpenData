# NYC DOB Job Application Filings

Downloads DOB Job Application Filings data from NYC Open Data.

## Usage

``` r
nyc_dob_job_applications(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/ic3t-wcy2\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing DOB Job Application Filings data.

## Details

This dataset includes job application filings submitted to the NYC
Department of Buildings (DOB). Each record represents a construction or
alteration project application, including location, work type, and
approval status.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dob_job_applications(limit = 2)
  small_sample

  nyc_dob_job_applications(limit = 2, filters = list(borough = "BROOKLYN"))
}
```
