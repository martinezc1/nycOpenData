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
#>    license_number name             type    current_status dmv_license_plate_nu…¹
#>    <chr>          <chr>            <chr>   <chr>          <chr>                 
#>  1 4D13           SARRAN,BICKHAM   05/31/… CUR            4D13B                 
#>  2 7N59           SSSA TAXI LLC    05/31/… CUR            Y210079C              
#>  3 7D77           AMARDARSHAN CORP 05/31/… CUR            Y210296C              
#>  4 7B37           ORTIZ,TELMO,E    05/31/… CUR            Y208518C              
#>  5 9A22           MIAH TRANS LLC   05/31/… CUR            Y208343C              
#>  6 3T23           NAAN CAB LLC     05/31/… CUR            Y102539C              
#>  7 2A91           GROSMAN, JOSEPH  05/31/… CUR            Y204177C              
#>  8 4Y76           KEROIL INC       05/31/… CUR            Y201831C              
#>  9 9P11           TOPS CAB CORP    05/31/… CUR            Y205404C              
#> 10 1M25           MENG5 LLC        05/31/… CUR            Y210565C              
#> # ℹ 9,990 more rows
#> # ℹ abbreviated name: ¹​dmv_license_plate_number
#> # ℹ 10 more variables: vehicle_vin_number <chr>, vehicle_type <chr>,
#> #   model_year <chr>, medallion_type <chr>, agent_number <chr>,
#> #   last_updated_date <chr>, last_updated_time <chr>, agent_name <chr>,
#> #   agent_telephone_number <chr>, agent_address <chr>
# }
```
