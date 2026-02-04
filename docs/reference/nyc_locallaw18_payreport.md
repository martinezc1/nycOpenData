# Local Law 18 Pay and Demographics Report - Agency Report Table

Downloads Local Law 18 Pay and Demographics Report - Agency Report Table
data from NYC Open Data.

## Usage

``` r
nyc_locallaw18_payreport(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/Local-Law-18-Pay-and-Demographics-Report-Agency-Re/423i-ukqr/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Local Law 18 Pay and Demographics Report - Agency
Report Table data.

## Details

In accordance with Local Law 18 0f 2019, this dataset displays pay and
workforce demographics of various city agencies. This dataset is useful
for researchers wishing to explore ethnicity, salary, and gender within
city agencies. Each row represents a group of employees with a common
agency, EEO-4 Job Category, pay band, employee status and demographic
attributes, which include race, ethnicity and gender.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_locallaw18_payreport(limit = 2)
  small_sample

  # Example with a filter (replace with real fields/values if desired)
  # nyc_locallaw18_payreport(limit = 2, filters = list(race = "White"))
}
```
