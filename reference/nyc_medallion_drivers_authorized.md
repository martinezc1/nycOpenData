# Medallion Vehicles - Authorized

Downloads Medallion Vehicles - Authorized data from NYC Open Data.

## Usage

``` r
nyc_medallion_drivers_authorized(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Transportation/Medallion-Vehicles-Authorized/rhe8-mgbb/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Medallion Vehicles - Authorized data.

## Details

This dataset, which includes all TLC licensed medallion vehicles which
are in good standing and able to drive, is updated every day in the
evening between 4-7pm. Please check the 'Last Update Date' field to make
sure the list has updated successfully. 'Last Update Date' should show
either today or yesterday's date, depending on the time of day.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_medallion_drivers_authorized(limit = 10)
head(small_sample)
#> # A tibble: 6 × 15
#>   license_number name                type  current_status dmv_license_plate_nu…¹
#>   <chr>          <chr>               <chr> <chr>          <chr>                 
#> 1 4W44           AXIZ MANAGEMENT IN… 05/3… CUR            Y205218C              
#> 2 4P65           GMEN3 LLC           05/3… CUR            Y206201C              
#> 3 9F46           MILON,SHEIKH        05/3… CUR            Y209013C              
#> 4 8B92           ROYAL RADIANCE CAR… 05/3… CUR            Y209362C              
#> 5 9K49           YUVI SINGH LLC      05/3… CUR            Y208512C              
#> 6 1K99           BARGAIN TRANSIT LLC 05/3… CUR            Y208805C              
#> # ℹ abbreviated name: ¹​dmv_license_plate_number
#> # ℹ 10 more variables: vehicle_vin_number <chr>, vehicle_type <chr>,
#> #   model_year <chr>, medallion_type <chr>, last_updated_date <chr>,
#> #   last_updated_time <chr>, agent_number <chr>, agent_name <chr>,
#> #   agent_telephone_number <chr>, agent_address <chr>

# \donttest{
nyc_medallion_drivers_authorized(limit = 5000)
#> # A tibble: 5,000 × 15
#>    license_number name               type  current_status dmv_license_plate_nu…¹
#>    <chr>          <chr>              <chr> <chr>          <chr>                 
#>  1 4W44           AXIZ MANAGEMENT I… 05/3… CUR            Y205218C              
#>  2 4P65           GMEN3 LLC          05/3… CUR            Y206201C              
#>  3 9F46           MILON,SHEIKH       05/3… CUR            Y209013C              
#>  4 8B92           ROYAL RADIANCE CA… 05/3… CUR            Y209362C              
#>  5 9K49           YUVI SINGH LLC     05/3… CUR            Y208512C              
#>  6 1K99           BARGAIN TRANSIT L… 05/3… CUR            Y208805C              
#>  7 9K33           RESERVOIR HACKING… 05/3… CUR            9K33C                 
#>  8 2C47           KERZHNER, FELIX    05/3… CUR            2C47H                 
#>  9 1N52           COURT TRANS INC    05/3… CUR            Y209341C              
#> 10 7M91           ARABY SERVICE CORP 05/3… CUR            Y210166C              
#> # ℹ 4,990 more rows
#> # ℹ abbreviated name: ¹​dmv_license_plate_number
#> # ℹ 10 more variables: vehicle_vin_number <chr>, vehicle_type <chr>,
#> #   model_year <chr>, medallion_type <chr>, last_updated_date <chr>,
#> #   last_updated_time <chr>, agent_number <chr>, agent_name <chr>,
#> #   agent_telephone_number <chr>, agent_address <chr>
nyc_medallion_drivers_authorized(filters = list(current_status = "CUR"))
#> # A tibble: 10,000 × 15
#>    license_number name               type  current_status dmv_license_plate_nu…¹
#>    <chr>          <chr>              <chr> <chr>          <chr>                 
#>  1 4W44           AXIZ MANAGEMENT I… 05/3… CUR            Y205218C              
#>  2 4P65           GMEN3 LLC          05/3… CUR            Y206201C              
#>  3 9F46           MILON,SHEIKH       05/3… CUR            Y209013C              
#>  4 8B92           ROYAL RADIANCE CA… 05/3… CUR            Y209362C              
#>  5 9K49           YUVI SINGH LLC     05/3… CUR            Y208512C              
#>  6 1K99           BARGAIN TRANSIT L… 05/3… CUR            Y208805C              
#>  7 9K33           RESERVOIR HACKING… 05/3… CUR            9K33C                 
#>  8 2C47           KERZHNER, FELIX    05/3… CUR            2C47H                 
#>  9 1N52           COURT TRANS INC    05/3… CUR            Y209341C              
#> 10 7M91           ARABY SERVICE CORP 05/3… CUR            Y210166C              
#> # ℹ 9,990 more rows
#> # ℹ abbreviated name: ¹​dmv_license_plate_number
#> # ℹ 10 more variables: vehicle_vin_number <chr>, vehicle_type <chr>,
#> #   model_year <chr>, medallion_type <chr>, last_updated_date <chr>,
#> #   last_updated_time <chr>, agent_number <chr>, agent_name <chr>,
#> #   agent_telephone_number <chr>, agent_address <chr>
# }
```
