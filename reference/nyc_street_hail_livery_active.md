# Street Hail Livery (SHL) Drivers - Active

Downloads Street Hail Livery (SHL) Drivers - Active data from NYC Open
Data.

## Usage

``` r
nyc_street_hail_livery_active(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Street-Hail-Livery-SHL-Drivers-Active/5tub-eh45/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Street Hail Livery (SHL) Drivers - Active data.

## Details

NYC TLC licensed drivers that are currently active, in good standing and
authorized to operate Street Hail Livery (SHL) vehicles. This list is
accurate to the date and time represented in the Last Date Updated and
Last Time Updated fields

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_street_hail_livery_active(limit = 10)
head(small_sample)
#> # A tibble: 6 × 7
#>   license_number name             status_code status_description expiration_date
#>   <chr>          <chr>            <chr>       <chr>              <chr>          
#> 1 6068262        SINGH,KHUSHDEEP  1           SHL UNRESTRICTED   2027-04-01T00:…
#> 2 5338417        SAHAKYAN,ARTUR   3           SHL WAV ONLY       2026-08-06T00:…
#> 3 5920942        MARTINEZ,CHRIS   1           SHL UNRESTRICTED   2027-10-04T00:…
#> 4 6117757        GABINOLOPEZ,WAS… 1           SHL UNRESTRICTED   2028-10-28T00:…
#> 5 5517995        NABIYEV,DJAMSHED 1           SHL UNRESTRICTED   2026-02-24T00:…
#> 6 5772515        CHOEPHEL,KALSANG 1           SHL UNRESTRICTED   2026-06-19T00:…
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>

# \donttest{
nyc_street_hail_livery_active(limit = 5000)
#> # A tibble: 5,000 × 7
#>    license_number name            status_code status_description expiration_date
#>    <chr>          <chr>           <chr>       <chr>              <chr>          
#>  1 6068262        SINGH,KHUSHDEEP 1           SHL UNRESTRICTED   2027-04-01T00:…
#>  2 5338417        SAHAKYAN,ARTUR  3           SHL WAV ONLY       2026-08-06T00:…
#>  3 5920942        MARTINEZ,CHRIS  1           SHL UNRESTRICTED   2027-10-04T00:…
#>  4 6117757        GABINOLOPEZ,WA… 1           SHL UNRESTRICTED   2028-10-28T00:…
#>  5 5517995        NABIYEV,DJAMSH… 1           SHL UNRESTRICTED   2026-02-24T00:…
#>  6 5772515        CHOEPHEL,KALSA… 1           SHL UNRESTRICTED   2026-06-19T00:…
#>  7 6112159        VARGAS,REYMI    1           SHL UNRESTRICTED   2028-09-10T00:…
#>  8 6013991        OKAGBARE,CHRIS… 1           SHL UNRESTRICTED   2026-01-17T00:…
#>  9 5883650        KENNEH,AYOUBA   1           SHL UNRESTRICTED   2027-08-06T00:…
#> 10 5984693        NOZADZE,GIA     1           SHL UNRESTRICTED   2027-12-14T00:…
#> # ℹ 4,990 more rows
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>
nyc_street_hail_livery_active(filters = list(status_description = "SHL UNRESTRICTED"))
#> # A tibble: 10,000 × 7
#>    license_number name            status_code status_description expiration_date
#>    <chr>          <chr>           <chr>       <chr>              <chr>          
#>  1 6068262        SINGH,KHUSHDEEP 1           SHL UNRESTRICTED   2027-04-01T00:…
#>  2 5920942        MARTINEZ,CHRIS  1           SHL UNRESTRICTED   2027-10-04T00:…
#>  3 6117757        GABINOLOPEZ,WA… 1           SHL UNRESTRICTED   2028-10-28T00:…
#>  4 5517995        NABIYEV,DJAMSH… 1           SHL UNRESTRICTED   2026-02-24T00:…
#>  5 5772515        CHOEPHEL,KALSA… 1           SHL UNRESTRICTED   2026-06-19T00:…
#>  6 6112159        VARGAS,REYMI    1           SHL UNRESTRICTED   2028-09-10T00:…
#>  7 6013991        OKAGBARE,CHRIS… 1           SHL UNRESTRICTED   2026-01-17T00:…
#>  8 5883650        KENNEH,AYOUBA   1           SHL UNRESTRICTED   2027-08-06T00:…
#>  9 5984693        NOZADZE,GIA     1           SHL UNRESTRICTED   2027-12-14T00:…
#> 10 5396400        NATH,LITON,KUM… 1           SHL UNRESTRICTED   2028-08-02T00:…
#> # ℹ 9,990 more rows
#> # ℹ 2 more variables: last_update_date <chr>, last_update_time <chr>
# }
```
