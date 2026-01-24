# City Record Online

Downloads City Record Online data from NYC Open Data.

## Usage

``` r
nyc_city_record(limit = 10000, filters = list())
```

## Source

NYC Open Data:
\<https://data.cityofnewyork.us/City-Government/City-Record-Online/dg92-zbpx/about_data\>

## Arguments

- limit:

  Number of rows to retrieve (default = 10,000).

- filters:

  Optional list of field-value pairs to filter results.

## Value

A tibble containing City Record Online data.

## Details

The City Record Online (CROL) is a fully searchable database of notices
published in the City Record newspaper, including, but not limited to:
public hearings and meetings, public auctions and sales, solicitations
and awards and official rules proposed and adopted by city agencies.

## Examples

``` r
# Quick example (fetch 10 rows)
small_sample <- nyc_city_record(limit = 10)
head(small_sample)
#> # A tibble: 6 × 25
#>   request_id  start_date             end_date agency_name type_of_notice_descr…¹
#>   <chr>       <chr>                  <chr>    <chr>       <chr>                 
#> 1 20260116008 2026-01-23T00:00:00.0… 2026-01… Education   Award                 
#> 2 20260121002 2026-01-23T00:00:00.0… 2026-01… Housing Au… Notice                
#> 3 20260115017 2026-01-23T00:00:00.0… 2026-01… Parks and … Public Hearings       
#> 4 20260105003 2026-01-23T00:00:00.0… 2026-01… Franchise … Meeting               
#> 5 20260114032 2026-01-23T00:00:00.0… 2026-01… Health and… Public Comment        
#> 6 20260120026 2026-01-23T00:00:00.0… 2026-01… Parks and … Solicitation          
#> # ℹ abbreviated name: ¹​type_of_notice_description
#> # ℹ 20 more variables: category_description <chr>, short_title <chr>,
#> #   selection_method_description <chr>, section_name <chr>, pin <chr>,
#> #   contact_name <chr>, contact_phone <chr>, email <chr>,
#> #   contract_amount <chr>, vendor_name <chr>, vendor_address <chr>,
#> #   additional_description_1 <chr>, event_date <chr>, street_address_1 <chr>,
#> #   street_address_2 <chr>, city <chr>, state <chr>, zip_code <chr>, …

# \donttest{
nyc_city_record(limit = 5000)
#> # A tibble: 5,000 × 29
#>    request_id  start_date            end_date agency_name type_of_notice_descr…¹
#>    <chr>       <chr>                 <chr>    <chr>       <chr>                 
#>  1 20260116008 2026-01-23T00:00:00.… 2026-01… Education   Award                 
#>  2 20260121002 2026-01-23T00:00:00.… 2026-01… Housing Au… Notice                
#>  3 20260115017 2026-01-23T00:00:00.… 2026-01… Parks and … Public Hearings       
#>  4 20260105003 2026-01-23T00:00:00.… 2026-01… Franchise … Meeting               
#>  5 20260114032 2026-01-23T00:00:00.… 2026-01… Health and… Public Comment        
#>  6 20260120026 2026-01-23T00:00:00.… 2026-01… Parks and … Solicitation          
#>  7 20260116014 2026-01-23T00:00:00.… 2026-01… Citywide A… Award                 
#>  8 20260116006 2026-01-23T00:00:00.… 2026-01… Dept. of S… Award                 
#>  9 20260116013 2026-01-23T00:00:00.… 2026-01… Law Depart… Award                 
#> 10 20260116003 2026-01-23T00:00:00.… 2026-01… Homeless S… Intent to Award       
#> # ℹ 4,990 more rows
#> # ℹ abbreviated name: ¹​type_of_notice_description
#> # ℹ 24 more variables: category_description <chr>, short_title <chr>,
#> #   selection_method_description <chr>, section_name <chr>, pin <chr>,
#> #   contact_name <chr>, contact_phone <chr>, email <chr>,
#> #   contract_amount <chr>, vendor_name <chr>, vendor_address <chr>,
#> #   additional_description_1 <chr>, event_date <chr>, street_address_1 <chr>, …
nyc_city_record(filters = list(short_title = "APPOINTED"))
#> # A tibble: 10,000 × 7
#>    request_id start_date           end_date agency_name short_title section_name
#>    <chr>      <chr>                <chr>    <chr>       <chr>       <chr>       
#>  1 952751     2025-11-07T00:00:00… 2025-10… BOARD OF E… APPOINTED   Changes in …
#>  2 952782     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  3 952907     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  4 952788     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  5 952921     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  6 952975     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  7 952871     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  8 952858     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  9 952687     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#> 10 952703     2025-11-07T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: additional_description_1 <chr>
# }
```
