# Annual Report on Domestic Violence Initiatives, Indicators and Factors

Downloads Annual Report on Domestic Violence Initiatives, Indicators and
Factors data from NYC Open Data.

## Usage

``` r
nyc_domestic_violence_annual_report(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/Annual-Report-on-Domestic-Violence-Initiatives-Ind/7t9i-jsfp/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Annual Report on Domestic Violence Initiatives,
Indicators and Factors data.

## Details

The information in the report is required under Local Law 38 of 2019.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_domestic_violence_annual_report(limit = 2)
  small_sample

  nyc_domestic_violence_annual_report(
    limit = 2,
    filters = list(category = "FJC_Client_Visits")
  )
}
```
