# Medallion Vehicles - Authorized

Downloads Medallion Vehicles - Authorized data from NYC Open Data.

## Usage

``` r
nyc_medallion_drivers_authorized(
  limit = 10000,
  filters = list(),
  timeout_sec = 30
)
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Medallion-Vehicles-Authorized/rhe8-mgbb/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing Medallion Vehicles - Authorized data.

## Details

This dataset, which includes all TLC licensed medallion vehicles which
are in good standing and able to drive, is updated every day in the
evening between 4–7pm. Please check the 'Last Update Date' field to make
sure the list has updated successfully. 'Last Update Date' should show
either today or yesterday's date, depending on the time of day.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_medallion_drivers_authorized(limit = 2)
  small_sample

  nyc_medallion_drivers_authorized(filters = list(current_status = "CUR"))
}
#> # A tibble: 10,000 × 15
#>    license_number name               type  current_status dmv_license_plate_nu…¹
#>    <chr>          <chr>              <chr> <chr>          <chr>                 
#>  1 9L56           9L56 & 9L57 ACQUI… 05/3… CUR            Y206688C              
#>  2 8V70           PUMO TAXI INC.     05/3… CUR            Y203934C              
#>  3 6J78           NAMBA CAB CORP     05/3… CUR            Y208983C              
#>  4 6K65           YASIA TAXI CORP    05/3… CUR            Y205559C              
#>  5 9L82           7H93 & 9L82 ACQUI… 05/3… CUR            Y209929C              
#>  6 8T39           WHEELER TAXI 20 L… 05/3… CUR            Y210329C              
#>  7 3E43           ADAMCZYK,ZBIGNIEW  05/3… CUR            3E43B                 
#>  8 9J75           9J75 & 9J76 ACQUI… 05/3… CUR            Y206684C              
#>  9 1C93           LY, DAN            05/3… CUR            1C93A                 
#> 10 4Y20           BUDD TAXI CORP     05/3… CUR            4Y20H                 
#> # ℹ 9,990 more rows
#> # ℹ abbreviated name: ¹​dmv_license_plate_number
#> # ℹ 10 more variables: vehicle_vin_number <chr>, vehicle_type <chr>,
#> #   model_year <chr>, medallion_type <chr>, agent_number <chr>,
#> #   agent_name <chr>, agent_telephone_number <chr>, agent_address <chr>,
#> #   last_updated_date <chr>, last_updated_time <chr>
# }
```
