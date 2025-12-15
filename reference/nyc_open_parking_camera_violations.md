# Open Parking and Camera Violations

Downloads Open Parking and Camera Violations data from NYC Open Data.

## Usage

``` r
nyc_open_parking_camera_violations(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/Open-Parking-and-Camera-Violations/nc67-uf89/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing Open Parking and Camera Violations data.

## Details

The Open Parking and Camera Violations dataset was initially loaded with
all violations contained in the mainframe database as of May 2016.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_open_parking_camera_violations(limit = 10)
head(small_sample)
#> # A tibble: 6 × 18
#>   plate   state license_type summons_number violation_time violation fine_amount
#>   <chr>   <chr> <chr>        <chr>          <chr>          <chr>     <chr>      
#> 1 HPK2083 NY    PAS          1420103131     00:00A         INSP. ST… 65         
#> 2 FFZ7198 NY    PAS          1405797526     06:49A         OBSTRUCT… 95         
#> 3 BLANKP… 99    999          1405210989     NA             NO PARKI… 45         
#> 4 BLANKP… 99    999          1271713305     00:00A         MISCELLA… 0          
#> 5 BLANKP… 99    999          8541784496     NA             NA        0          
#> 6 BLANKP… 99    999          1434159012     00:00P         MISCELLA… 0          
#> # ℹ 11 more variables: penalty_amount <chr>, interest_amount <chr>,
#> #   reduction_amount <chr>, payment_amount <chr>, amount_due <chr>,
#> #   precinct <chr>, issuing_agency <chr>, county <chr>, violation_status <chr>,
#> #   summons_image.url <chr>, summons_image.description <chr>

# \donttest{
nyc_open_parking_camera_violations(limit = 5000)
#> # A tibble: 5,000 × 20
#>    plate  state license_type summons_number violation_time violation fine_amount
#>    <chr>  <chr> <chr>        <chr>          <chr>          <chr>     <chr>      
#>  1 HPK20… NY    PAS          1420103131     00:00A         INSP. ST… 65         
#>  2 FFZ71… NY    PAS          1405797526     06:49A         OBSTRUCT… 95         
#>  3 BLANK… 99    999          1405210989     NA             NO PARKI… 45         
#>  4 BLANK… 99    999          1271713305     00:00A         MISCELLA… 0          
#>  5 BLANK… 99    999          8541784496     NA             NA        0          
#>  6 BLANK… 99    999          1434159012     00:00P         MISCELLA… 0          
#>  7 BLANK… 99    999          1373139043     11:25A         NO STAND… 115        
#>  8 BLANK… 99    999          1384820061     00:00A         NO PARKI… 45         
#>  9 GNH25… NY    PAS          1345442774     08:05A         NO STAND… 95         
#> 10 BLANK… 99    999          1398441624     09:17A         NO PARKI… 65         
#> # ℹ 4,990 more rows
#> # ℹ 13 more variables: penalty_amount <chr>, interest_amount <chr>,
#> #   reduction_amount <chr>, payment_amount <chr>, amount_due <chr>,
#> #   precinct <chr>, issuing_agency <chr>, county <chr>, violation_status <chr>,
#> #   issue_date <chr>, judgment_entry_date <chr>, summons_image.url <chr>,
#> #   summons_image.description <chr>
nyc_open_parking_camera_violations(filters = list(state = "NJ"))
#> # A tibble: 10,000 × 20
#>    plate   state license_type summons_number issue_date violation_time violation
#>    <chr>   <chr> <chr>        <chr>          <chr>      <chr>          <chr>    
#>  1 2DY75G  NJ    PAS          1362720975     51/71/2004 NA             NA       
#>  2 RHE42L  NJ    PAS          1323616410     41/17/2011 NA             NA       
#>  3 367727N NJ    PAS          1355370176     29/06/2014 NA             NA       
#>  4 XBGC58  NJ    PAS          9122563489     2024-05-0… 11:57A         NO STAND…
#>  5 C87LTZ  NJ    PAS          9124700990     2024-05-0… 02:33P         NO STAND…
#>  6 W19RTA  NJ    PAS          9124926164     2024-04-3… 08:55A         NO STAND…
#>  7 XNHC17  NJ    PAS          9124745418     2024-04-3… 09:46A         NO STAND…
#>  8 D19RLK  NJ    PAS          9122101846     2024-04-2… 02:23P         MISUSE P…
#>  9 E24UBR  NJ    PAS          9126550234     2024-04-2… 03:45P         FRAUDULE…
#> 10 W51SAF  NJ    PAS          9120614263     2024-04-2… 09:47A         FRAUDULE…
#> # ℹ 9,990 more rows
#> # ℹ 13 more variables: fine_amount <chr>, penalty_amount <chr>,
#> #   interest_amount <chr>, reduction_amount <chr>, payment_amount <chr>,
#> #   amount_due <chr>, precinct <chr>, county <chr>, issuing_agency <chr>,
#> #   violation_status <chr>, judgment_entry_date <chr>, summons_image.url <chr>,
#> #   summons_image.description <chr>
# }
```
