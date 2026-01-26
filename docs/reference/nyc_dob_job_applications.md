# NYC DOB Job Application Filings

Downloads DOB Job Application Filings data from NYC Open Data.

## Usage

``` r
nyc_dob_job_applications(limit = 10000, filters = list(), timeout_sec = 30)
```

## Source

NYC Open Data: \<https://data.cityofnewyork.us/resource/ic3t-wcy2\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

- timeout_sec:

  Request timeout in seconds (default = 30).

## Value

A tibble containing DOB Job Application Filings data.

## Details

This dataset includes job application filings submitted to the NYC
Department of Buildings (DOB). Each record represents a construction or
alteration project application, including location, work type, and
approval status.

## Examples

``` r
# Examples that hit the live NYC Open Data API are wrapped so CRAN checks
# do not fail when the network is unavailable or slow.
# \donttest{
if (curl::has_internet()) {
  # Quick example (fetch 2 rows)
  small_sample <- nyc_dob_job_applications(limit = 2)
  small_sample

  nyc_dob_job_applications(filters = list(borough = "BROOKLYN"))
}
#> # A tibble: 10,000 × 96
#>    job__ doc__ borough house__ street_name block lot   bin__ job_type job_status
#>    <chr> <chr> <chr>   <chr>   <chr>       <chr> <chr> <chr> <chr>    <chr>     
#>  1 3220… 01    BROOKL… 5224    3RD AVENUE  00805 00049 3332… A1       A         
#>  2 3220… 01    BROOKL… 750     56TH STREET 00842 00027 3015… A2       A         
#>  3 3001… 05    BROOKL… 1852    58 STREET   05505 00028 3131… A1       P         
#>  4 3211… 04    BROOKL… 36      GUNNISON C… 08800 00083 3247… NB       P         
#>  5 3404… 02    BROOKL… 1519    52ND STREET 05465 00070 3129… A2       P         
#>  6 3202… 02    BROOKL… 2812    BRIGHTON  … 07260 00054 3196… PA       P         
#>  7 3214… 02    BROOKL… 235     SUMPTER ST  01520 00070 3041… A2       P         
#>  8 3211… 05    BROOKL… 113     CONGRESS S… 00295 00038 3003… A1       P         
#>  9 3218… 01    BROOKL… 775     39 STREET   00903 00043 3017… A2       A         
#> 10 3210… 01    BROOKL… 1718 G… 53 STREET   05479 00015 3408… A2       A         
#> # ℹ 9,990 more rows
#> # ℹ 86 more variables: job_status_descrp <chr>, latest_action_date <chr>,
#> #   building_type <chr>, community___board <chr>, cluster <chr>,
#> #   landmarked <chr>, adult_estab <chr>, loft_board <chr>, little_e <chr>,
#> #   efiling_filed <chr>, other <chr>, other_description <chr>,
#> #   applicant_s_first_name <chr>, applicant_s_last_name <chr>,
#> #   applicant_professional_title <chr>, applicant_license__ <chr>, …
# }
```
