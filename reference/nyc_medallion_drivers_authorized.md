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
#>  1 8L13           H & S TRANS USA I… 05/3… CUR            Y204760C              
#>  2 5H72           REIGER TAXI 21 LLC 05/3… CUR            Y201147C              
#>  3 1N14           ROGER CAB CORP     05/3… CUR            Y201001C              
#>  4 8A99           SINGH CAB LLC      05/3… CUR            Y205505C              
#>  5 6J10           ARWIN TRANS LLC    05/3… CUR            Y206726C              
#>  6 4E27           PURI CAB LLC       05/3… CUR            Y200165C              
#>  7 4M36           ZOGRAFOU LLC       05/3… CUR            Y209018C              
#>  8 2F32           GUIRAND, LOUIS     05/3… CUR            Y102276C              
#>  9 1L21           XENO CAB LLC       05/3… CUR            Y104116C              
#> 10 2P71           LEFJOHN TAXI CORP  05/3… CUR            Y208642C              
#> # ℹ 9,990 more rows
#> # ℹ abbreviated name: ¹​dmv_license_plate_number
#> # ℹ 10 more variables: vehicle_vin_number <chr>, vehicle_type <chr>,
#> #   model_year <chr>, medallion_type <chr>, last_updated_date <chr>,
#> #   last_updated_time <chr>, agent_number <chr>, agent_name <chr>,
#> #   agent_telephone_number <chr>, agent_address <chr>
# }
```
