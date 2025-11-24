# NYC TLC New Driver Application Status

Downloads TLC New Driver Application Status data from NYC Open Data.

## Usage

``` r
nyc_tlc_new_driver_app_status(limit = 10000, filters = list())
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/dpec-ucu7\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing TLC New Driver Application Status data.

## Details

This dataset provides the application status for individuals applying
for a New York City Taxi and Limousine Commission (TLC) driver's
license. It includes details such as application date, drug test status,
defensive driving completion, and final approval outcome.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_tlc_new_driver_app_status(limit = 10)
head(small_sample)
#> # A tibble: 6 × 12
#>   app_no  type  app_date      status fru_interview_schedu…¹ drug_test wav_course
#>   <chr>   <chr> <chr>         <chr>  <chr>                  <chr>     <chr>     
#> 1 6126443 HDR   2025-11-23T0… Incom… Not Applicable         Needed    Needed    
#> 2 6126433 HDR   2025-11-23T0… Incom… Not Applicable         Needed    Needed    
#> 3 6126450 HDR   2025-11-23T0… Incom… Not Applicable         Needed    Needed    
#> 4 6126438 HDR   2025-11-23T0… Incom… Not Applicable         Needed    Needed    
#> 5 6126439 HDR   2025-11-23T0… Incom… Not Applicable         Needed    Needed    
#> 6 6126455 HDR   2025-11-23T0… Incom… Not Applicable         Needed    Needed    
#> # ℹ abbreviated name: ¹​fru_interview_scheduled
#> # ℹ 5 more variables: defensive_driving <chr>, driver_exam <chr>,
#> #   medical_clearance_form <chr>, other_requirements <chr>, lastupdate <chr>

# \donttest{
nyc_tlc_new_driver_app_status(limit = 5000)
#> # A tibble: 5,000 × 12
#>    app_no  type  app_date     status fru_interview_schedu…¹ drug_test wav_course
#>    <chr>   <chr> <chr>        <chr>  <chr>                  <chr>     <chr>     
#>  1 6126443 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  2 6126433 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  3 6126450 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  4 6126438 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  5 6126439 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  6 6126455 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  7 6126436 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  8 6126456 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#>  9 6126445 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#> 10 6126442 HDR   2025-11-23T… Incom… Not Applicable         Needed    Needed    
#> # ℹ 4,990 more rows
#> # ℹ abbreviated name: ¹​fru_interview_scheduled
#> # ℹ 5 more variables: defensive_driving <chr>, driver_exam <chr>,
#> #   medical_clearance_form <chr>, other_requirements <chr>, lastupdate <chr>
nyc_tlc_new_driver_app_status(filters = list(drug_test = "NEEDED"))
#> # A tibble: 0 × 0
# }
```
