# Medallion Drivers - Active

Downloads Medallion Drivers - Active data from NYC Open Data.

## Usage

``` r
nyc_medallion_drivers_active(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Medallion-Drivers-Active/jb3k-j3gp/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Medallion Drivers - Active data.

## Details

This is a list of drivers with a current TLC Driver License, which
authorizes drivers to operate NYC TLC licensed yellow and green taxicabs
and for-hire vehicles (FHVs). This list is accurate as of the date and
time shown in the Last Date Updated and Last Time Updated fields.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_medallion_drivers_active(limit = 10)
head(small_sample)
#> # A tibble: 6 × 6
#>   license_number name  type  expiration_date last_updated_date last_updated_time
#>   <chr>          <chr> <chr> <chr>           <chr>             <chr>            
#> 1 481587         DAGO… MEDA… 2028-03-08T00:… 2025-12-14T00:00… 13:20            
#> 2 6032854        MUKU… MEDA… 2026-09-12T00:… 2025-12-14T00:00… 13:20            
#> 3 6076706        SARO… MEDA… 2027-07-22T00:… 2025-12-14T00:00… 13:20            
#> 4 5994491        REYE… MEDA… 2028-05-13T00:… 2025-12-14T00:00… 13:20            
#> 5 898804         SEKE… MEDA… 2026-06-13T00:… 2025-12-14T00:00… 13:20            
#> 6 5712770        GAO,… MEDA… 2028-09-21T00:… 2025-12-14T00:00… 13:20            

# \donttest{
nyc_medallion_drivers_active(limit = 5000)
#> # A tibble: 5,000 × 6
#>    license_number name                   type  expiration_date last_updated_date
#>    <chr>          <chr>                  <chr> <chr>           <chr>            
#>  1 481587         DAGOBERT,JACQUES,J     MEDA… 2028-03-08T00:… 2025-12-14T00:00…
#>  2 6032854        MUKUMOV,SHEKHROZ       MEDA… 2026-09-12T00:… 2025-12-14T00:00…
#>  3 6076706        SAROYA,INDERJIT        MEDA… 2027-07-22T00:… 2025-12-14T00:00…
#>  4 5994491        REYES,JENERI           MEDA… 2028-05-13T00:… 2025-12-14T00:00…
#>  5 898804         SEKEEN,SAMIR,H         MEDA… 2026-06-13T00:… 2025-12-14T00:00…
#>  6 5712770        GAO,GUIXU              MEDA… 2028-09-21T00:… 2025-12-14T00:00…
#>  7 5980176        ADAMES GUZMAN,LUIS,AR… MEDA… 2027-10-27T00:… 2025-12-14T00:00…
#>  8 5909249        GILLANI,TAHIR          MEDA… 2027-09-06T00:… 2025-12-14T00:00…
#>  9 6106669        SINGH,RAJVEER          MEDA… 2028-04-03T00:… 2025-12-14T00:00…
#> 10 5999625        ABREU,JUAN,ANTONIO     MEDA… 2028-10-20T00:… 2025-12-14T00:00…
#> # ℹ 4,990 more rows
#> # ℹ 1 more variable: last_updated_time <chr>
nyc_medallion_drivers_active(filters = list(type = "MEDALLION TAXI DRIVER"))
#> # A tibble: 10,000 × 6
#>    license_number name                   type  expiration_date last_updated_date
#>    <chr>          <chr>                  <chr> <chr>           <chr>            
#>  1 481587         DAGOBERT,JACQUES,J     MEDA… 2028-03-08T00:… 2025-12-14T00:00…
#>  2 6032854        MUKUMOV,SHEKHROZ       MEDA… 2026-09-12T00:… 2025-12-14T00:00…
#>  3 6076706        SAROYA,INDERJIT        MEDA… 2027-07-22T00:… 2025-12-14T00:00…
#>  4 5994491        REYES,JENERI           MEDA… 2028-05-13T00:… 2025-12-14T00:00…
#>  5 898804         SEKEEN,SAMIR,H         MEDA… 2026-06-13T00:… 2025-12-14T00:00…
#>  6 5712770        GAO,GUIXU              MEDA… 2028-09-21T00:… 2025-12-14T00:00…
#>  7 5980176        ADAMES GUZMAN,LUIS,AR… MEDA… 2027-10-27T00:… 2025-12-14T00:00…
#>  8 5909249        GILLANI,TAHIR          MEDA… 2027-09-06T00:… 2025-12-14T00:00…
#>  9 6106669        SINGH,RAJVEER          MEDA… 2028-04-03T00:… 2025-12-14T00:00…
#> 10 5999625        ABREU,JUAN,ANTONIO     MEDA… 2028-10-20T00:… 2025-12-14T00:00…
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: last_updated_time <chr>
# }
```
