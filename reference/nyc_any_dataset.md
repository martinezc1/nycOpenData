# Load Any NYC Open Data Dataset

Downloads any NYC Open Data dataset given its Socrata JSON endpoint.

## Usage

``` r
nyc_any_dataset(json_link, limit = 10000)
```

## Arguments

- json_link:

  A Socrata dataset JSON endpoint URL (e.g.,
  "https://data.cityofnewyork.us/resource/abcd-1234.json").

- limit:

  Number of rows to retrieve (default = 10,000).

## Value

A tibble containing the requested dataset.

## Examples

``` r
if (FALSE) { # \dontrun{
endpoint <- "https://data.cityofnewyork.us/resource/erm2-nwe9.json"
small_sample <- nyc_any_dataset(endpoint, limit = 10)
head(small_sample)
} # }
```
