# Investigating Inmate Incidents

## Introduction

This dataset contains information regarding the [Inmate Incidents -
Slashing and
Stabbing](https://data.cityofnewyork.us/Public-Safety/Inmate-Incidents-Slashing-and-Stabbing/gakf-suji/about_data)
dataset on the NYC Open Data portal. Each row provides the incident ID,
the date the incident was reported, the incident type, and the facility
where it occurred. A researcher might want to use this dataset to
investigate the kind of crimes inmates commit while they are
incarcerated.

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal. It is currently utilized as a primary tool for
teaching data acquisition in [Reproducible Research Using
R](https://martinezc1-reproducible-research-using-r.share.connect.posit.cloud/),
helping students bridge the gap between raw city APIs and tidy data
analysis.

## Let’s take a look at the dataset.

To start, let’s pull a small sample to see what the data looks like. By
default, the function pulls in the *10,000 most recent* requests,
however, let’s change that to only see the latest 3 requests. To do
this, we can set `limit = 3`.

``` r
small_sample <- nyc_pull_dataset(dataset = "gakf-suji", limit = 3)
small_sample
#> # A tibble: 3 × 3
#>   incident_id reported_dt         incident_type
#>         <dbl> <dttm>              <chr>        
#> 1       76075 2016-01-31 21:17:00 Slashing     
#> 2       76130 2016-02-02 09:43:00 Slashing     
#> 3       76177 2016-02-03 15:56:00 Slashing

# Seeing what columns are in the dataset
names(small_sample)
#> [1] "incident_id"   "reported_dt"   "incident_type"
```

We can filter based on any of the columns in the dataset. To filter, we
add `filters = list()` and put whatever filters we would like inside.
From our [`names()`](https://rdrr.io/r/base/names.html) call before, we
know that there is a column called “incident_type” which we can use to
accomplish this.

``` r

incident_slash_stab <- nyc_pull_dataset("gakf-suji", limit = 3, filters = list(incident_type = "Stabbing"))
head(incident_slash_stab)
#> # A tibble: 3 × 3
#>   incident_id reported_dt         incident_type
#>         <dbl> <dttm>              <chr>        
#> 1       76348 2016-02-10 02:49:00 Stabbing     
#> 2       78554 2016-04-23 12:54:00 Stabbing     
#> 3       79040 2016-05-08 23:18:00 Stabbing

# Checking to see the filtering worked
incident_slash_stab |>
  distinct(incident_type)
#> # A tibble: 1 × 1
#>   incident_type
#>   <chr>        
#> 1 Stabbing
```

## Further investigation.

This section was meant to look into the most recurring incident types
among inmates and take note of their severity. But for future inquiries:

``` r
# Creating the datasets
slash <- nyc_pull_dataset("gakf-suji", limit = 50, filters = list(facility = "AMKC", incident_type = "Slashing"))

stab <- nyc_pull_dataset("gakf-suji", limit = 50, filters = list(facility = "AMKC", incident_type = "Stabbing"))

# Calling head of our new dataset
slash |>
  slice_head(n = 6)
#> # A tibble: 6 × 4
#>   incident_id reported_dt         incident_type facility
#>         <dbl> <dttm>              <chr>         <chr>   
#> 1      150379 2021-04-30 12:11:00 Slashing      AMKC    
#> 2       96849 2017-10-02 04:18:00 Slashing      AMKC    
#> 3       97197 2017-10-11 08:27:00 Slashing      AMKC    
#> 4       99471 2017-12-08 00:57:00 Slashing      AMKC    
#> 5      102244 2018-02-14 01:30:00 Slashing      AMKC    
#> 6      103827 2018-03-27 11:34:00 Slashing      AMKC

stab |>
  slice_head(n = 6)
#> # A tibble: 6 × 4
#>   incident_id reported_dt         incident_type facility
#>         <dbl> <dttm>              <chr>         <chr>   
#> 1       98323 2017-11-09 22:45:00 Stabbing      AMKC    
#> 2      101638 2018-01-30 09:26:00 Stabbing      AMKC    
#> 3      122579 2019-07-16 21:02:00 Stabbing      AMKC    
#> 4      122747 2019-07-20 14:17:00 Stabbing      AMKC    
#> 5      127101 2019-10-29 20:17:00 Stabbing      AMKC    
#> 6      134023 2020-04-06 19:42:00 Stabbing      AMKC

# Quick check to make sure our filtering worked
slash |>
  summarize(rows = n())
#> # A tibble: 1 × 1
#>    rows
#>   <int>
#> 1    50

stab |>
  summarize(rows = n())
#> # A tibble: 1 × 1
#>    rows
#>   <int>
#> 1    50
```

This code should allow us to see how slashing and stabbing incidents
vary by facilities.

## Mini analysis

As an example of how this dataset can be used for exploratory analysis,
the code below groups incidents by facility and incident type, then
visualizes the resulting counts. This approach offers a straightforward
way to compare patterns of violence across locations.

``` r
data <- nyc_pull_dataset("gakf-suji", limit = 100) |>
  filter(incident_type %in% c("Slashing", "Stabbing")) |>
  count(incident_type, name = "count")

ggplot(data, aes(x = incident_type, y = count)) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(
    title = "Slashing vs Stabbing Incidents by Facility",
    x = "Incident Type",
    y = "Number of Incidents",
    fill = "Facility"
  )
```

![This figure shows incident types by
facility.](investigating-inmate-incidents_files/figure-html/unnamed-chunk-2-1.png)

This figure shows incident types by facility.

## Summary

The `nycOpenData` package serves as a robust interface for the NYC Open
Data portal, streamlining the path from raw city APIs to actionable
insights. By abstracting the complexities of data acquisition—such as
pagination, type-casting, and complex filtering—it allows users to focus
on analysis rather than data engineering.

## How to Cite

If you use this package for research or educational purposes, please
cite it as follows:

Martinez C (2026). nycOpenData: Convenient Access to NYC Open Data API
Endpoints. R package version 0.1.6,
<https://martinezc1.github.io/nycOpenData/>.
