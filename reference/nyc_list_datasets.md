# List datasets available in nycOpenData

Returns a catalog of datasets supported by this package.

## Usage

``` r
nyc_list_datasets()
```

## Value

A tibble of available datasets.

## Examples

``` r
nyc_list_datasets()
#> # A tibble: 38 × 8
#>    key             dataset_id title description default_order default_date_field
#>    <chr>           <chr>      <chr> <chr>       <chr>         <chr>             
#>  1 nyc_311_2010_2… 76ig-c548  NYC … Downloads … created_date… created_date      
#>  2 nyc_311         erm2-nwe9  NYC … Downloads … created_date… created_date      
#>  3 nyc_borough_co… 5awp-wfkt  NYC … Downloads … month DESC    month             
#>  4 nyc_borough_po… xywu-7bv9  New … Downloads … NA            NA                
#>  5 nyc_cause_of_d… jb7j-dtam  New … Downloads … year DESC     year              
#>  6 nyc_city_record dg92-zbpx  City… Downloads … start_date D… start_date        
#>  7 nyc_civil_serv… vx8i-nprf  NYC … Downloads … published_da… published_date    
#>  8 nyc_daily_atte… x3bb-kg5j  2018… Downloads … date DESC     date              
#>  9 nyc_detention_… 2hrw-qfsu  NYC … Downloads … calendar_yea… calendar_year     
#> 10 nyc_dhs_daily_… k46n-sa2m  NYC … Department… date_of_cens… date_of_census    
#> # ℹ 28 more rows
#> # ℹ 2 more variables: landing_page_url <chr>, topic <chr>
```
