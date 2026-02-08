# Local Law 97 of 2021 - Pets in Shelter Report

Downloads Local Law 97 of 2021 - Pets in Shelter Report data from NYC
Open Data.

## Usage

``` r
nyc_locallaw97_shelter_pets(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Social-Services/Local-Law-97-of-2021-Pets-in-Shelter-Report/5nux-zfmw/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Local Law 97 of 2021 - Pets in Shelter Report data.

## Details

This dataset contains quarterly survey response data on the types of
pets whose owners entered New York City homeless shelters. Each row
represents combined survey responses for one fiscal year quarter, which
can be used by researchers to examine trends in pet ownership among
shelter entrants and inform policy or resource planning.

## Examples

``` r
# Examples that hit the live NYC Open Data API are guarded so CRAN checks
# do not fail when the network is unavailable or slow.
if (interactive() && curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_locallaw97_shelter_pets(limit = 2)
  small_sample

  # Example with a filter (replace with real fields/values if desired)
  # nyc_locallaw97_shelter_pets(limit = 2, filters = list(date_quarter = "Qtr 1"))
}
```
