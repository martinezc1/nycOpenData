# OATH Hearings Division Case Status

Downloads OATH Hearings Division Case Status data from NYC Open Data.

## Usage

``` r
nyc_oath_hearing_case_status(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/OATH-Hearings-Division-Case-Status/jz4z-kudi/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing OATH Hearings Division Case Status data.

## Details

The OATH Hearings Division Case Status dataset contains information
about alleged public safety and quality of life violations that are
filed and adjudicated through the City’s administrative law court, the
NYC Office of Administrative Trials and Hearings (OATH) and provides
information about the infraction charged, decision outcome, payments,
amounts and fees relating to the case. The summonses listed in this
dataset are issued and filed at the OATH Hearings Division by City
enforcement agencies.

## Examples

``` r
# Quick example (fetch 5 rows)
small_sample <- nyc_oath_hearing_case_status(limit = 5)
head(small_sample)
#> # A tibble: 5 × 22
#>   ticket_number violation_date          issuing_agency respondent_first_name
#>   <chr>         <chr>                   <chr>          <chr>                
#> 1 018543P       2109-10-19T00:00:00.000 TAXI_TLC       ILYAS                
#> 2 74942215A     2026-01-22T00:00:00.000 TAXI_TLC       CEDENO CEVALLOS      
#> 3 73071435A     2026-01-22T00:00:00.000 TAXI_TLC       ADEBANJO             
#> 4 74731351A     2026-01-22T00:00:00.000 TAXI_TLC       ZAHID                
#> 5 73902267A     2026-01-21T00:00:00.000 TAXI_TLC       BRUNEUS              
#> # ℹ 18 more variables: respondent_last_name <chr>,
#> #   violation_location_borough <chr>, violation_location_city <chr>,
#> #   violation_location_zip_code <chr>, respondent_address_borough <chr>,
#> #   total_violation_amount <chr>, violation_details <chr>,
#> #   penalty_imposed <chr>, paid_amount <chr>, charge_1_code <chr>,
#> #   charge_1_code_section <chr>, charge_1_infraction_amount <chr>,
#> #   charge_2_code <chr>, charge_2_code_section <chr>, …

# \donttest{
nyc_oath_hearing_case_status(limit = 5000)
#> # A tibble: 5,000 × 60
#>    ticket_number violation_date          issuing_agency respondent_first_name
#>    <chr>         <chr>                   <chr>          <chr>                
#>  1 018543P       2109-10-19T00:00:00.000 TAXI_TLC       ILYAS                
#>  2 74942215A     2026-01-22T00:00:00.000 TAXI_TLC       CEDENO CEVALLOS      
#>  3 73071435A     2026-01-22T00:00:00.000 TAXI_TLC       ADEBANJO             
#>  4 74731351A     2026-01-22T00:00:00.000 TAXI_TLC       ZAHID                
#>  5 74750860A     2026-01-21T00:00:00.000 TAXI_TLC       EGBO IBEZIM K        
#>  6 74761468A     2026-01-21T00:00:00.000 TAXI_TLC       HOSSAIN              
#>  7 73553954A     2026-01-21T00:00:00.000 TAXI_TLC       POWER TRANSIT INC    
#>  8 75261989A     2026-01-21T00:00:00.000 TAXI_TLC       CAMILO               
#>  9 74512244A     2026-01-21T00:00:00.000 TAXI_TLC       DIALLO               
#> 10 74731350A     2026-01-21T00:00:00.000 TAXI_TLC       GOURAV               
#> # ℹ 4,990 more rows
#> # ℹ 56 more variables: respondent_last_name <chr>,
#> #   violation_location_borough <chr>, violation_location_city <chr>,
#> #   violation_location_zip_code <chr>, respondent_address_borough <chr>,
#> #   total_violation_amount <chr>, violation_details <chr>,
#> #   penalty_imposed <chr>, paid_amount <chr>, charge_1_code <chr>,
#> #   charge_1_code_section <chr>, charge_1_infraction_amount <chr>, …
nyc_oath_hearing_case_status(filters = list(respondent_address_borough = "BROOKLYN"))
#> # A tibble: 10,000 × 64
#>    ticket_number violation_date          violation_time issuing_agency        
#>    <chr>         <chr>                   <chr>          <chr>                 
#>  1 0217706583    2024-12-11T00:00:00.000 18:14:00       POLICE DEPARTMENT     
#>  2 0219107094    2024-08-23T00:00:00.000 18:42:00       POLICE DEPARTMENT     
#>  3 0217152980    2024-07-15T00:00:00.000 00:00:00       POLICE DEPARTMENT     
#>  4 0217047710    2024-07-03T00:00:00.000 00:00:00       POLICE DEPARTMENT     
#>  5 0218212318    2024-06-05T00:00:00.000 22:11:00       POLICE DEPARTMENT     
#>  6 0703506540    2024-02-08T00:00:00.000 14:14:00       DEPT OF TRANSPORTATION
#>  7 0216773619    2024-01-26T00:00:00.000 12:13:00       POLICE DEPARTMENT     
#>  8 0703401820    2023-10-07T00:00:00.000 23:07:00       DEPT OF TRANSPORTATION
#>  9 0196593816    2022-05-21T00:00:00.000 18:55:00       POLICE DEPARTMENT     
#> 10 046963878R    2020-12-14T00:00:00.000 08:21:00       SANITATION RECYCLING  
#> # ℹ 9,990 more rows
#> # ℹ 60 more variables: respondent_first_name <chr>, respondent_last_name <chr>,
#> #   balance_due <chr>, violation_location_borough <chr>,
#> #   violation_location_block_no <chr>, violation_location_lot_no <chr>,
#> #   violation_location_house <chr>, violation_location_street_name <chr>,
#> #   violation_location_city <chr>, violation_location_zip_code <chr>,
#> #   violation_location_state_name <chr>, respondent_address_borough <chr>, …
# }
```
