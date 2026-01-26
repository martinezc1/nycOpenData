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
#>  1 5472685        ALMONTE,NELSON… 1           SHL UNRESTRICTED   2028-03-20T00:…
#>  2 5954585        MENDEZ,DE,JESU… 1           SHL UNRESTRICTED   2028-11-26T00:…
#>  3 6045797        SINGH,LAKHWIND… 1           SHL UNRESTRICTED   2026-11-08T00:…
#>  4 5959398        SHUBITIDZE,TEM… 1           SHL UNRESTRICTED   2026-07-22T00:…
#>  5 5807047        MAHMOUDI,ADAM,… 1           SHL UNRESTRICTED   2026-10-23T00:…
#>  6 5991422        ABREU,CARLOS,M… 1           SHL UNRESTRICTED   2028-03-25T00:…
#>  7 5927370        MAHFUZ,ABDULLA… 1           SHL UNRESTRICTED   2027-12-21T00:…
#>  8 5854135        ALVAREZ,RAFAEL  1           SHL UNRESTRICTED   2027-03-23T00:…
#>  9 6040618        MATUBBER,AKTAR  1           SHL UNRESTRICTED   2026-11-01T00:…
#> 10 6117565        SHERPA,RAJESH   1           SHL UNRESTRICTED   2028-09-12T00:…
#> # ℹ 9,990 more rows
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>
# }
```
