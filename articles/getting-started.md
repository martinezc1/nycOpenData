# Getting Started with nycOpenData

``` r
knitr::opts_chunk$set(warning = FALSE, message = FALSE)
library(nycOpenData)
library(ggplot2)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

## Introduction

NYC has a population of almost 8.5 million people. By calling 311,
residents are able to make comments, inquiries, complaints, and requests
to the city agencies. All 311 service requests are contained in the
dataset, [found
here](https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2020-to-Present/erm2-nwe9/about_data).
In R, the `nycOpenData` package can be used to pull this data directly.

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal. It is currently utilized as a primary tool for
teaching data acquisition in [Reproducible Research Using
R](https://martinezc1-reproducible-research-using-r.share.connect.posit.cloud/),
helping students bridge the gap between raw city APIs and tidy data
analysis.

By using the
[`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
function, we can gather the most recent 311 calls in New York City, and
filter based upon any of the columns inside the dataset.

> Note:
> [`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
> automatically sorts in descending order based on the created_date
> column.

## Pulling a Small Sample

To start, let’s pull a small sample to see what the data looks like. By
default, the function pulls in the *10,000 most recent* requests,
however, let’s change that to only see the latest 3 requests. To do
this, we can set `limit = 3`.

``` r
small_sample <- nyc_311(limit = 3)
small_sample
#> # A tibble: 3 × 33
#>   unique_key created_date        closed_date         agency agency_name         
#>        <dbl> <dttm>              <dttm>              <chr>  <chr>               
#> 1   68021786 2026-02-18 02:25:16 2026-02-18 02:25:16 DOT    Department of Trans…
#> 2   68022342 2026-02-18 02:24:06 NA                  DOT    Department of Trans…
#> 3   68021787 2026-02-18 02:23:25 2026-02-18 02:23:25 DOT    Department of Trans…
#> # ℹ 28 more variables: complaint_type <chr>, descriptor <chr>,
#> #   incident_zip <dbl>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   facility_type <chr>, status <chr>, resolution_description <chr>,
#> #   resolution_action_updated_date <dttm>, community_board <chr>,
#> #   council_district <dbl>, police_precinct <chr>, borough <chr>,
#> #   x_coordinate_state_plane <dbl>, y_coordinate_state_plane <dbl>, …

# Seeing what columns are in the dataset
names(small_sample)
#>  [1] "unique_key"                     "created_date"                  
#>  [3] "closed_date"                    "agency"                        
#>  [5] "agency_name"                    "complaint_type"                
#>  [7] "descriptor"                     "incident_zip"                  
#>  [9] "intersection_street_1"          "intersection_street_2"         
#> [11] "address_type"                   "city"                          
#> [13] "facility_type"                  "status"                        
#> [15] "resolution_description"         "resolution_action_updated_date"
#> [17] "community_board"                "council_district"              
#> [19] "police_precinct"                "borough"                       
#> [21] "x_coordinate_state_plane"       "y_coordinate_state_plane"      
#> [23] "open_data_channel_type"         "park_facility_name"            
#> [25] "park_borough"                   "latitude"                      
#> [27] "longitude"                      "incident_address"              
#> [29] "street_name"                    "cross_street_1"                
#> [31] "cross_street_2"                 "location_type"                 
#> [33] "location_coordinates"
```

Fantastic! We successfully pulled 311 data from the NYC Open Data
Portal.

Let’s now take an example of the last 3 requests from the borough
Brooklyn. The
[`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
function can filter based off any of the columns in the dataset. To
filter, we add `filters = list()` and put whatever filters we would like
inside. From our `colnames` call before, we know that there is a column
called “borough” which we can use to accomplish this.

``` r

brooklyn_311 <- nyc_311(limit = 3, filters = list(borough = "BROOKLYN"))
brooklyn_311
#> # A tibble: 3 × 35
#>   unique_key created_date        agency agency_name    complaint_type descriptor
#>        <dbl> <dttm>              <chr>  <chr>          <chr>          <chr>     
#> 1   68018489 2026-02-18 02:02:46 NYPD   New York City… Noise - Resid… Loud Musi…
#> 2   68023887 2026-02-18 02:02:01 NYPD   New York City… Noise - Stree… Loud Musi…
#> 3   68024562 2026-02-18 02:01:01 NYPD   New York City… Noise - Park   Loud Musi…
#> # ℹ 29 more variables: location_type <chr>, incident_zip <dbl>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <dbl>, police_precinct <chr>, bbl <dbl>, borough <chr>,
#> #   x_coordinate_state_plane <dbl>, y_coordinate_state_plane <dbl>, …

# Checking to see the filtering worked
brooklyn_311 |>
  distinct(borough)
#> # A tibble: 1 × 1
#>   borough 
#>   <chr>   
#> 1 BROOKLYN
```

Success! From calling the `brooklyn_311` dataset we see there are only 3
rows of data, and from the
[`distinct()`](https://dplyr.tidyverse.org/reference/distinct.html) call
we see the only borough featured in our dataset is BROOKLYN.

One of the strongest qualities this function has is its ability to
filter based off of multiple columns. Let’s put everything together and
get a dataset of the last *50* 311 requests from the New York Police
Department in Brooklyn.

``` r
# Creating the dataset
brooklyn_nypd <- nyc_311(limit = 50, filters = list(agency = "NYPD", borough = "BROOKLYN"))

# Calling head of our new dataset
brooklyn_nypd |>
  slice_head(n = 6)
#> # A tibble: 6 × 36
#>   unique_key created_date        agency agency_name    complaint_type descriptor
#>        <dbl> <dttm>              <chr>  <chr>          <chr>          <chr>     
#> 1   68018489 2026-02-18 02:02:46 NYPD   New York City… Noise - Resid… Loud Musi…
#> 2   68023887 2026-02-18 02:02:01 NYPD   New York City… Noise - Stree… Loud Musi…
#> 3   68024562 2026-02-18 02:01:01 NYPD   New York City… Noise - Park   Loud Musi…
#> 4   68019809 2026-02-18 01:58:18 NYPD   New York City… Illegal Parki… Blocked H…
#> 5   68022483 2026-02-18 01:57:05 NYPD   New York City… Noise - Comme… Banging/P…
#> 6   68025262 2026-02-18 01:56:45 NYPD   New York City… Illegal Parki… Blocked H…
#> # ℹ 30 more variables: location_type <chr>, incident_zip <dbl>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <dbl>, police_precinct <chr>, bbl <dbl>, borough <chr>,
#> #   x_coordinate_state_plane <dbl>, y_coordinate_state_plane <dbl>, …

# Quick check to make sure our filtering worked
brooklyn_nypd |>
  summarize(rows = n())
#> # A tibble: 1 × 1
#>    rows
#>   <int>
#> 1    50

brooklyn_nypd |>
  distinct(agency)
#> # A tibble: 1 × 1
#>   agency
#>   <chr> 
#> 1 NYPD

brooklyn_nypd |>
  distinct(borough)
#> # A tibble: 1 × 1
#>   borough 
#>   <chr>   
#> 1 BROOKLYN
```

We successfully created our dataset that contains the 50 most recent
requests regarding the NYPD in the borough Brooklyn.

## Mini analysis

Now that we have successfully pulled the data and have it in R, let’s do
a mini analysis on using the `complaint_type` column, to figure out what
NYC residents in Brooklyn are complaining about to the NYPD.

To do this, we will create a bar graph of the complaint types.

``` r
# Visualizing the distribution, ordered by frequency
brooklyn_nypd |>
  count(complaint_type) |>
  ggplot(aes(
    x = n,
    y = reorder(complaint_type, n)
  )) +
  geom_col(fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "Most Recent NYPD 311 Complaints (Brooklyn)",
    subtitle = "Top 50 service requests",
    x = "Number of Complaints",
    y = "Type of Complaint"
  )
```

![Bar chart showing the frequency of NYPD-related 311 complaint types in
Brooklyn from the 50 most recent service
requests.](getting-started_files/figure-html/compaint-type-graph-1.png)

Bar chart showing the frequency of NYPD-related 311 complaint types in
Brooklyn from the 50 most recent service requests.

This graph shows us not only *which* complaints were made, but *how
many* of each complaint were made.

## Summary

The `nycOpenData` package serves as a robust interface for the NYC Open
Data portal, streamlining the path from raw city APIs to actionable
insights. By abstracting the complexities of data acquisition—such as
pagination, type-casting, and complex filtering—it allows users to focus
on analysis rather than data engineering.

As demonstrated in this vignette, the package provides a seamless
workflow for targeted data retrieval, automated filtering, and rapid
visualization.

## How to Cite

If you use this package for research or educational purposes, please
cite it as follows:

Martinez C (2026). nycOpenData: Convenient Access to NYC Open Data API
Endpoints. R package version 0.1.6,
<https://martinezc1.github.io/nycOpenData/>.
