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
  # Quick example (fetch 10 rows)
  small_sample <- nyc_medallion_drivers_authorized(limit = 10)
  head(small_sample)

  nyc_medallion_drivers_authorized(limit = 5000)
  nyc_medallion_drivers_authorized(filters = list(current_status = "CUR"))
}
#> # A tibble: 10,000 × 15
#>    license_number name               type  current_status dmv_license_plate_nu…¹
#>    <chr>          <chr>              <chr> <chr>          <chr>                 
#>  1 3G12           FAYYAZ TRANSIT LLC 05/3… CUR            Y200701C              
#>  2 2N40           AC TAXI 2 LLC      05/3… CUR            Y205345C              
#>  3 7L34           HEMLOCK CAB CORP.  05/3… CUR            Y100847C              
#>  4 2B26           PARMAR,JASVIR,SIN… 05/3… CUR            Y208268C              
#>  5 4D88           RAKOS TAXI INC.    05/3… CUR            Y209822C              
#>  6 8V44           DAYTONATWO LLC     05/3… CUR            Y207953C              
#>  7 6F70           IPTE LLC           05/3… CUR            Y207776C              
#>  8 2P10           FANCY CAB CORP     05/3… CUR            Y208059C              
#>  9 1B63           HASPIA & MISKAT L… 05/3… CUR            Y103166C              
#> 10 9F28           NOVEMBRE, PAUL A.  05/3… CUR            Y202953C              
#> # ℹ 9,990 more rows
#> # ℹ abbreviated name: ¹​dmv_license_plate_number
#> # ℹ 10 more variables: vehicle_vin_number <chr>, vehicle_type <chr>,
#> #   model_year <chr>, medallion_type <chr>, last_updated_date <chr>,
#> #   last_updated_time <chr>, agent_number <chr>, agent_name <chr>,
#> #   agent_telephone_number <chr>, agent_address <chr>
# }
```
