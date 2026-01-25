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
#>    license_number name               type      expiration_date last_updated_date
#>    <chr>          <chr>              <chr>     <chr>           <chr>            
#>  1 491135         SINGH,MOHINDER     MEDALLIO… 2026-11-29T00:… 2026-01-24T00:00…
#>  2 6125437        SAIDOV,AMINJON     MEDALLIO… 2029-01-13T00:… 2026-01-24T00:00…
#>  3 5123384        IKANI,ABDERRAHIM   MEDALLIO… 2028-12-04T00:… 2026-01-24T00:00…
#>  4 6068011        ALAWLAQI,ABDULAZIZ MEDALLIO… 2027-03-21T00:… 2026-01-24T00:00…
#>  5 5933877        ANANDJEE,SANJIV    MEDALLIO… 2028-04-08T00:… 2026-01-24T00:00…
#>  6 5883468        JABBOROV,ABDURASUL MEDALLIO… 2027-07-05T00:… 2026-01-24T00:00…
#>  7 6085259        ROSA,JESUS         MEDALLIO… 2028-01-13T00:… 2026-01-24T00:00…
#>  8 5939606        HOSSAIN,MD,SABBIR  MEDALLIO… 2028-05-07T00:… 2026-01-24T00:00…
#>  9 5215651        CEVALLOS,WILSON,I  MEDALLIO… 2026-12-29T00:… 2026-01-24T00:00…
#> 10 5857150        RODRIGUEZ, ERIKA   MEDALLIO… 2027-04-24T00:… 2026-01-24T00:00…
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: last_updated_time <chr>
# }
```
