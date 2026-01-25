# Street Hail Livery (SHL) Drivers - Active

Downloads Street Hail Livery (SHL) Drivers - Active data from NYC Open
Data.

## Usage

``` r
nyc_street_hail_livery_active(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Street-Hail-Livery-SHL-Drivers-Active/5tub-eh45/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Street Hail Livery (SHL) Drivers - Active data.

## Details

NYC TLC licensed drivers that are currently active, in good standing and
authorized to operate Street Hail Livery (SHL) vehicles. This list is
accurate to the date and time represented in the Last Date Updated and
Last Time Updated fields.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_street_hail_livery_active(limit = 2)
  small_sample

  nyc_street_hail_livery_active(filters = list(status_description = "SHL UNRESTRICTED"))
}
#> # A tibble: 10,000 × 7
#>    license_number name            status_code status_description expiration_date
#>    <chr>          <chr>           <chr>       <chr>              <chr>          
#>  1 5723930        HUANG,DAMON     1           SHL UNRESTRICTED   2028-11-17T00:…
#>  2 5872582        LEONARDO,DE,QU… 1           SHL UNRESTRICTED   2027-06-19T00:…
#>  3 5974133        SOULAMA,BAKOI   1           SHL UNRESTRICTED   2027-08-05T00:…
#>  4 6061621        RODRIGUEZ,YANC… 1           SHL UNRESTRICTED   2027-01-04T00:…
#>  5 6023822        DE GUZMAN,JUAN… 1           SHL UNRESTRICTED   2026-05-01T00:…
#>  6 5578032        PEREZ,FAUSTO    1           SHL UNRESTRICTED   2026-11-18T00:…
#>  7 6017201        MEKHRISHVILI,D… 1           SHL UNRESTRICTED   2026-03-10T00:…
#>  8 5978322        HOSSAIN,MD,MAM… 1           SHL UNRESTRICTED   2027-11-10T00:…
#>  9 5460237        SINGH,NARINDER  1           SHL UNRESTRICTED   2028-02-12T00:…
#> 10 5855507        ROMULUS,RICKY,… 1           SHL UNRESTRICTED   2027-05-30T00:…
#> # ℹ 9,990 more rows
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>
# }
```
