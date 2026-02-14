# Analyzing NYCHA Housing Maintenance Code Violations

## Introduction

The NYCHA Housing Maintenance Code Violations dataset provides
information about maintenance violations in public housing developments
across New York City.

This dataset is important because it helps researchers, policymakers,
and residents understand housing conditions and identify patterns in
maintenance issues.

## data

``` r
data <- nyc_ha_violations()

head(data)
```

    ## # A tibble: 6 × 35
    ##   viol_seq_no bldg_id boro  boro_nm  phn   low_hus_no high_hus_no str_nm   zip  
    ##   <chr>       <chr>   <chr> <chr>    <chr> <chr>      <chr>       <chr>    <chr>
    ## 1 18641047    671394  4     QUEENS   69-01 69-01      69-15       KISSENA… 11367
    ## 2 18641048    671394  4     QUEENS   69-01 69-01      69-15       KISSENA… 11367
    ## 3 18641286    807996  3     BROOKLYN 35    35         53          DWIGHT … 11231
    ## 4 18641287    807996  3     BROOKLYN 35    35         53          DWIGHT … 11231
    ## 5 18641288    807996  3     BROOKLYN 35    35         53          DWIGHT … 11231
    ## 6 18641289    807996  3     BROOKLYN 35    35         53          DWIGHT … 11231
    ## # ℹ 26 more variables: development_name <chr>, tds_no <chr>,
    ## #   stairhall_no <chr>, sctn_boro <chr>, sctn_boro_nm <chr>, sctn_hus_no <chr>,
    ## #   sctn_str_nm <chr>, sctn_zip <chr>, actl_unit_insp <chr>, actl_stry <chr>,
    ## #   blk <chr>, lot <chr>, viol_desc <chr>, hzrd_clas <chr>, insp_dt <chr>,
    ## #   viol_appr_dt <chr>, viol_typ_ordr_no <chr>, issued_in_err <chr>,
    ## #   latitude <chr>, longitude <chr>, community_board <chr>,
    ## #   council_district <chr>, bin <chr>, bbl <chr>, census_tract <chr>, …

## Count violations by borough

``` r
data %>%
  count(boro_nm)
```

    ## # A tibble: 5 × 2
    ##   boro_nm           n
    ##   <chr>         <int>
    ## 1 BRONX           244
    ## 2 BROOKLYN        721
    ## 3 MANHATTAN       941
    ## 4 QUEENS          225
    ## 5 STATEN ISLAND    24

## Visual

``` r
data %>%
  count(boro_nm) %>%
  ggplot(aes(x = boro_nm, y = n)) +
  geom_col() +
  labs(
    title = "Number of NYCHA Violations by Borough",
    x = "Borough",
    y = "Number of Violations"
  )
```

![](nyc_ha_violations_files/figure-html/unnamed-chunk-3-1.png)
