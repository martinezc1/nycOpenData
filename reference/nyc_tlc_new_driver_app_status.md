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
#> 1 6131208 HDR   2026-01-24T0… Incom… Not Applicable         Needed    Needed    
#> 2 6131209 HDR   2026-01-24T0… Incom… Not Applicable         Needed    Needed    
#> 3 6131210 HDR   2026-01-24T0… Incom… Not Applicable         Needed    Needed    
#> 4 6131164 HDR   2026-01-23T0… Incom… Not Applicable         Needed    Needed    
#> 5 6131187 HDR   2026-01-23T0… Incom… Not Applicable         Needed    Needed    
#> 6 6131135 HDR   2026-01-23T0… Incom… Not Applicable         Needed    Needed    
#> # ℹ abbreviated name: ¹​fru_interview_scheduled
#> # ℹ 5 more variables: defensive_driving <chr>, driver_exam <chr>,
#> #   medical_clearance_form <chr>, other_requirements <chr>, lastupdate <chr>

# \donttest{
nyc_tlc_new_driver_app_status(limit = 5000)
#> # A tibble: 4,910 × 12
#>    app_no  type  app_date     status fru_interview_schedu…¹ drug_test wav_course
#>    <chr>   <chr> <chr>        <chr>  <chr>                  <chr>     <chr>     
#>  1 6131208 HDR   2026-01-24T… Incom… Not Applicable         Needed    Needed    
#>  2 6131209 HDR   2026-01-24T… Incom… Not Applicable         Needed    Needed    
#>  3 6131210 HDR   2026-01-24T… Incom… Not Applicable         Needed    Needed    
#>  4 6131164 HDR   2026-01-23T… Incom… Not Applicable         Needed    Needed    
#>  5 6131187 HDR   2026-01-23T… Incom… Not Applicable         Needed    Needed    
#>  6 6131135 HDR   2026-01-23T… Incom… Not Applicable         Needed    Needed    
#>  7 6131147 HDR   2026-01-23T… Incom… Not Applicable         Needed    Complete  
#>  8 6131123 HDR   2026-01-23T… Incom… Not Applicable         Needed    Needed    
#>  9 6131145 HDR   2026-01-23T… Incom… Not Applicable         Needed    Complete  
#> 10 6131171 HDR   2026-01-23T… Incom… Not Applicable         Needed    Needed    
#> # ℹ 4,900 more rows
#> # ℹ abbreviated name: ¹​fru_interview_scheduled
#> # ℹ 5 more variables: defensive_driving <chr>, driver_exam <chr>,
#> #   medical_clearance_form <chr>, other_requirements <chr>, lastupdate <chr>
nyc_tlc_new_driver_app_status(filters = list(drug_test = "NEEDED"))
#> # A tibble: 0 × 0
# }
```
