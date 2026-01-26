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
#>  1 5466368        HERRERA,LOUIS   1           SHL UNRESTRICTED   2027-02-01T00:…
#>  2 6108405        ISHFAQ,FNU      1           SHL UNRESTRICTED   2028-05-05T00:…
#>  3 5888185        HUSSAIN,MD,BEL… 1           SHL UNRESTRICTED   2027-10-02T00:…
#>  4 464076         ROY,PRADIP      1           SHL UNRESTRICTED   2028-09-18T00:…
#>  5 5323193        BARRY,ALPHA,B   1           SHL UNRESTRICTED   2027-02-23T00:…
#>  6 5870045        RAKHMATULLAEV,… 1           SHL UNRESTRICTED   2027-06-21T00:…
#>  7 5991538        RAHAT,ABED      1           SHL UNRESTRICTED   2028-04-01T00:…
#>  8 6126503        TAGMATOV,DUSTM… 1           SHL UNRESTRICTED   2028-12-24T00:…
#>  9 467313         ASHOUR,KHALED,I 1           SHL UNRESTRICTED   2027-01-04T00:…
#> 10 5855982        GARCIADELORBE,J 1           SHL UNRESTRICTED   2027-03-20T00:…
#> # ℹ 9,990 more rows
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>
# }
```
