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
#> # A tibble: 6 × 21
#>   request_id  start_date             end_date agency_name type_of_notice_descr…¹
#>   <chr>       <chr>                  <chr>    <chr>       <chr>                 
#> 1 20251208037 2025-12-15T00:00:00.0… 2025-12… City Unive… Solicitation          
#> 2 20251205015 2025-12-15T00:00:00.0… 2025-12… Sanitation  Public Comment        
#> 3 20251205014 2025-12-15T00:00:00.0… 2025-12… Sanitation  Public Comment        
#> 4 20251205037 2025-12-15T00:00:00.0… 2025-12… Fire Depar… Solicitation          
#> 5 20251209016 2025-12-15T00:00:00.0… 2025-12… Dept. of S… Award                 
#> 6 20251208024 2025-12-15T00:00:00.0… 2025-12… Mayor's Of… Notice                
#> # ℹ abbreviated name: ¹​type_of_notice_description
#> # ℹ 16 more variables: category_description <chr>, short_title <chr>,
#> #   selection_method_description <chr>, section_name <chr>, pin <chr>,
#> #   due_date <chr>, address_to_request <chr>, contact_name <chr>,
#> #   contact_phone <chr>, email <chr>, additional_description_1 <chr>,
#> #   other_info_1 <chr>, special_case_reason_description <chr>,
#> #   contract_amount <chr>, vendor_name <chr>, vendor_address <chr>

# \donttest{
nyc_city_record(limit = 5000)
#> # A tibble: 5,000 × 29
#>    request_id  start_date            end_date agency_name type_of_notice_descr…¹
#>    <chr>       <chr>                 <chr>    <chr>       <chr>                 
#>  1 20251208037 2025-12-15T00:00:00.… 2025-12… City Unive… Solicitation          
#>  2 20251205015 2025-12-15T00:00:00.… 2025-12… Sanitation  Public Comment        
#>  3 20251205014 2025-12-15T00:00:00.… 2025-12… Sanitation  Public Comment        
#>  4 20251205037 2025-12-15T00:00:00.… 2025-12… Fire Depar… Solicitation          
#>  5 20251209016 2025-12-15T00:00:00.… 2025-12… Dept. of S… Award                 
#>  6 20251208024 2025-12-15T00:00:00.… 2025-12… Mayor's Of… Notice                
#>  7 20251210015 2025-12-15T00:00:00.… 2025-12… Dept. of S… Intent to Award       
#>  8 20251205008 2025-12-15T00:00:00.… 2025-12… Sanitation  Public Comment        
#>  9 20251208040 2025-12-15T00:00:00.… 2025-12… Parks and … Solicitation          
#> 10 20251209015 2025-12-15T00:00:00.… 2025-12… Dept. of S… Award                 
#> # ℹ 4,990 more rows
#> # ℹ abbreviated name: ¹​type_of_notice_description
#> # ℹ 24 more variables: category_description <chr>, short_title <chr>,
#> #   selection_method_description <chr>, section_name <chr>, pin <chr>,
#> #   due_date <chr>, address_to_request <chr>, contact_name <chr>,
#> #   contact_phone <chr>, email <chr>, additional_description_1 <chr>,
#> #   other_info_1 <chr>, special_case_reason_description <chr>, …
nyc_city_record(filters = list(short_title = "APPOINTED"))
#> # A tibble: 10,000 × 7
#>    request_id start_date           end_date agency_name short_title section_name
#>    <chr>      <chr>                <chr>    <chr>       <chr>       <chr>       
#>  1 943740     2025-09-26T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  2 943570     2025-09-26T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  3 943528     2025-09-26T00:00:00… 2025-09… TAXI & LIM… APPOINTED   Changes in …
#>  4 943610     2025-09-26T00:00:00… 2025-09… TAXI & LIM… APPOINTED   Changes in …
#>  5 943580     2025-09-26T00:00:00… 2025-09… DEPARTMENT… APPOINTED   Changes in …
#>  6 943696     2025-09-26T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#>  7 943603     2025-09-26T00:00:00… 2025-09… TAXI & LIM… APPOINTED   Changes in …
#>  8 943622     2025-09-26T00:00:00… 2025-09… MAYORS OFF… APPOINTED   Changes in …
#>  9 943522     2025-09-26T00:00:00… 2025-09… DEPT OF YO… APPOINTED   Changes in …
#> 10 943651     2025-09-26T00:00:00… 2025-01… BOARD OF E… APPOINTED   Changes in …
#> # ℹ 9,990 more rows
#> # ℹ 1 more variable: additional_description_1 <chr>
# }
```
