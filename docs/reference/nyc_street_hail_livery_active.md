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
  # Quick example (fetch 10 rows)
  small_sample <- nyc_street_hail_livery_active(limit = 10)
  head(small_sample)

  nyc_street_hail_livery_active(limit = 5000)
  nyc_street_hail_livery_active(filters = list(status_description = "SHL UNRESTRICTED"))
}
#> # A tibble: 10,000 × 7
#>    license_number name            status_code status_description expiration_date
#>    <chr>          <chr>           <chr>       <chr>              <chr>          
#>  1 5743561        ROSS,GLEN,E     1           SHL UNRESTRICTED   2029-01-12T00:…
#>  2 5660644        DIALLO,MOUSSA   1           SHL UNRESTRICTED   2028-12-29T00:…
#>  3 5722717        GARCIA,FEDERIC… 1           SHL UNRESTRICTED   2028-11-21T00:…
#>  4 5521314        CRUZ,YRIS,M     1           SHL UNRESTRICTED   2029-03-03T00:…
#>  5 5844009        ATIVIE,TONY     1           SHL UNRESTRICTED   2027-02-28T00:…
#>  6 5805453        BAH,MOHAMED     1           SHL UNRESTRICTED   2026-09-11T00:…
#>  7 5586275        RIJO,GERALD     1           SHL UNRESTRICTED   2028-03-12T00:…
#>  8 656016         HILAS,JEAN,D    1           SHL UNRESTRICTED   2028-09-13T00:…
#>  9 5270026        OSORIA,JOSE     1           SHL UNRESTRICTED   2028-08-21T00:…
#> 10 458461         MIAH,MOHAMMAD   1           SHL UNRESTRICTED   2027-01-03T00:…
#> # ℹ 9,990 more rows
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>
# }
```
