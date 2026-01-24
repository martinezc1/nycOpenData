# Medallion Drivers - Active

Downloads Medallion Drivers - Active data from NYC Open Data.

## Usage

``` r
nyc_medallion_drivers_active(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Medallion-Drivers-Active/jb3k-j3gp/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Medallion Drivers - Active data.

## Details

This is a list of drivers with a current TLC Driver License, which
authorizes drivers to operate NYC TLC licensed yellow and green taxicabs
and for-hire vehicles (FHVs). This list is accurate as of the date and
time shown in the Last Date Updated and Last Time Updated fields.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 10 rows)
  small_sample <- nyc_medallion_drivers_active(limit = 10)
  head(small_sample)

  nyc_medallion_drivers_active(limit = 5000)
  nyc_medallion_drivers_active(filters = list(type = "MEDALLION TAXI DRIVER"))
}
#> # A tibble: 10,000 × 6
#>    license_number name                   type  expiration_date last_updated_date
#>    <chr>          <chr>                  <chr> <chr>           <chr>            
#>  1 5794718        ILYADI,RAMIN           MEDA… 2026-08-25T00:… 2026-01-23T00:00…
#>  2 6124536        K C,RAJAN              MEDA… 2028-12-23T00:… 2026-01-23T00:00…
#>  3 6065238        VALENZUELA,ADALGISA    MEDA… 2027-02-01T00:… 2026-01-23T00:00…
#>  4 5709189        KAMBARA,NORIKI         MEDA… 2028-08-05T00:… 2026-01-23T00:00…
#>  5 5279414        ISLAM,MD,S             MEDA… 2029-03-09T00:… 2026-01-23T00:00…
#>  6 6032845        RUDECINDO,YESENIA      MEDA… 2026-06-27T00:… 2026-01-23T00:00…
#>  7 6062422        KAREEM,RUTH,EBUN       MEDA… 2027-01-02T00:… 2026-01-23T00:00…
#>  8 5981487        WU,RUILIAN             MEDA… 2027-10-08T00:… 2026-01-23T00:00…
#>  9 6109938        IFTIKHAR,IMRAN         MEDA… 2028-06-02T00:… 2026-01-23T00:00…
#> 10 6063058        MUNOZ GUZMAN,RAYMOND,… MEDA… 2027-01-17T00:… 2026-01-23T00:00…
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: last_updated_time <chr>
# }
```
