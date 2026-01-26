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
  # Quick example (fetch 2 rows)
  small_sample <- nyc_medallion_drivers_active(limit = 2)
  small_sample

  nyc_medallion_drivers_active(filters = list(type = "MEDALLION TAXI DRIVER"))
}
#> # A tibble: 10,000 × 6
#>    license_number name                   type  expiration_date last_updated_date
#>    <chr>          <chr>                  <chr> <chr>           <chr>            
#>  1 6009613        ARMATO,JAMES,JOSEPH    MEDA… 2028-11-22T00:… 2026-01-25T00:00…
#>  2 6122846        MARTINEZ MOTA,YANEIBY  MEDA… 2029-01-09T00:… 2026-01-25T00:00…
#>  3 5962852        UDDIN,MOHAMMED,JAMAL   MEDA… 2027-02-26T00:… 2026-01-25T00:00…
#>  4 5571785        BERTHE,OUSMANE         MEDA… 2026-11-20T00:… 2026-01-25T00:00…
#>  5 5038642        BATCHI,NASSIROU,M      MEDA… 2028-05-04T00:… 2026-01-25T00:00…
#>  6 5584913        ALGHAITHY,NAFA,A       MEDA… 2027-01-15T00:… 2026-01-25T00:00…
#>  7 6071734        DIAGOURAGA,SEKOU       MEDA… 2027-06-11T00:… 2026-01-25T00:00…
#>  8 5043677        AGUILAR-MARTINEZ,A,E   MEDA… 2028-05-30T00:… 2026-01-25T00:00…
#>  9 5878285        SOLANO,DE,LA,CRUZ,YOE… MEDA… 2027-08-29T00:… 2026-01-25T00:00…
#> 10 463385         SAKHA,GABY             MEDA… 2026-07-14T00:… 2026-01-25T00:00…
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: last_updated_time <chr>
# }
```
