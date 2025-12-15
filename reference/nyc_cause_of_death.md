# New York City Leading Causes of Death

Downloads New York City Leading Causes of Death data from NYC Open Data.

## Usage

``` r
nyc_cause_of_death(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/Health/New-York-City-Leading-Causes-of-Death/jb7j-dtam/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing New York City Leading Causes of Death data.

## Details

The leading causes of death by sex and ethnicity in New York City in
since 2007. Cause of death is derived from the NYC death certificate
which is issued for every death that occurs in New York City.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_cause_of_death(limit = 10)
head(small_sample)
#> # A tibble: 6 × 7
#>   year  leading_cause                     sex   race_ethnicity deaths death_rate
#>   <chr> <chr>                             <chr> <chr>          <chr>  <chr>     
#> 1 2014  Influenza (Flu) and Pneumonia (J… M     Not Stated/Un… 14     .         
#> 2 2014  Essential Hypertension and Renal… F     Other Race/ E… .      .         
#> 3 2014  Cerebrovascular Disease (Stroke:… F     Other Race/ E… 8      .         
#> 4 2014  Mental and Behavioral Disorders … F     Not Stated/Un… 6      .         
#> 5 2014  Cerebrovascular Disease (Stroke:… F     Black Non-His… 274    26.1      
#> 6 2014  Chronic Lower Respiratory Diseas… M     Not Stated/Un… 14     .         
#> # ℹ 1 more variable: age_adjusted_death_rate <chr>

# \donttest{
nyc_cause_of_death(limit = 5000)
#> # A tibble: 1,094 × 7
#>    year  leading_cause                    sex   race_ethnicity deaths death_rate
#>    <chr> <chr>                            <chr> <chr>          <chr>  <chr>     
#>  1 2014  Influenza (Flu) and Pneumonia (… M     Not Stated/Un… 14     .         
#>  2 2014  Essential Hypertension and Rena… F     Other Race/ E… .      .         
#>  3 2014  Cerebrovascular Disease (Stroke… F     Other Race/ E… 8      .         
#>  4 2014  Mental and Behavioral Disorders… F     Not Stated/Un… 6      .         
#>  5 2014  Cerebrovascular Disease (Stroke… F     Black Non-His… 274    26.1      
#>  6 2014  Chronic Lower Respiratory Disea… M     Not Stated/Un… 14     .         
#>  7 2014  Human Immunodeficiency Virus Di… F     Not Stated/Un… 7      .         
#>  8 2014  Certain Conditions originating … F     Not Stated/Un… 10     .         
#>  9 2014  Mental and Behavioral Disorders… M     Other Race/ E… 12     .         
#> 10 2014  Diseases of Heart (I00-I09, I11… F     White Non-His… 4507   318       
#> # ℹ 1,084 more rows
#> # ℹ 1 more variable: age_adjusted_death_rate <chr>
nyc_cause_of_death(filters = list(sex = "M"))
#> # A tibble: 540 × 7
#>    year  leading_cause                    sex   race_ethnicity deaths death_rate
#>    <chr> <chr>                            <chr> <chr>          <chr>  <chr>     
#>  1 2014  Influenza (Flu) and Pneumonia (… M     Not Stated/Un… 14     .         
#>  2 2014  Chronic Lower Respiratory Disea… M     Not Stated/Un… 14     .         
#>  3 2014  Mental and Behavioral Disorders… M     Other Race/ E… 12     .         
#>  4 2014  Malignant Neoplasms (Cancer: C0… M     Asian and Pac… 657    114.5     
#>  5 2014  Human Immunodeficiency Virus Di… M     Black Non-His… 196    22.7      
#>  6 2014  Accidents Except Drug Posioning… M     Other Race/ E… 12     .         
#>  7 2014  Diabetes Mellitus (E10-E14)      M     Black Non-His… 318    36.8      
#>  8 2014  All Other Causes                 M     Hispanic       1195   100.1     
#>  9 2014  Mental and Behavioral Disorders… M     Hispanic       191    16        
#> 10 2014  Diabetes Mellitus (E10-E14)      M     Other Race/ E… 18     .         
#> # ℹ 530 more rows
#> # ℹ 1 more variable: age_adjusted_death_rate <chr>
# }
```
