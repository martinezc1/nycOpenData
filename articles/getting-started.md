# Getting Started with nycOpenData

``` r
knitr::opts_chunk$set(warning = FALSE, message = FALSE)
library(nycOpenData)
library(ggplot2)
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
R](https://martinezc1-textbook--reproducible-research-using-r.share.connect.posit.cloud),
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
#> # A tibble: 3 × 24
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67603407   2026-01-25T02:47:41.0… DOT    Department… Street Condit… Pothole   
#> 2 67602402   2026-01-25T02:46:50.0… DOT    Department… Street Condit… Pothole   
#> 3 67596744   2026-01-25T02:45:12.0… DOT    Department… Street Condit… Pothole   
#> # ℹ 18 more variables: incident_zip <chr>, incident_address <chr>,
#> #   street_name <chr>, cross_street_1 <chr>, cross_street_2 <chr>,
#> #   address_type <chr>, city <chr>, facility_type <chr>, status <chr>,
#> #   resolution_description <chr>, resolution_action_updated_date <chr>,
#> #   community_board <chr>, police_precinct <chr>, borough <chr>,
#> #   open_data_channel_type <chr>, park_facility_name <chr>, park_borough <chr>,
#> #   closed_date <chr>

# Seeing what columns are in the dataset
colnames(small_sample)
#>  [1] "unique_key"                     "created_date"                  
#>  [3] "agency"                         "agency_name"                   
#>  [5] "complaint_type"                 "descriptor"                    
#>  [7] "incident_zip"                   "incident_address"              
#>  [9] "street_name"                    "cross_street_1"                
#> [11] "cross_street_2"                 "address_type"                  
#> [13] "city"                           "facility_type"                 
#> [15] "status"                         "resolution_description"        
#> [17] "resolution_action_updated_date" "community_board"               
#> [19] "police_precinct"                "borough"                       
#> [21] "open_data_channel_type"         "park_facility_name"            
#> [23] "park_borough"                   "closed_date"
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
#> # A tibble: 3 × 32
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67596881   2026-01-25T02:04:27.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> 2 67601964   2026-01-25T02:04:12.0… NYPD   New York C… Noise - Stree… Loud Musi…
#> 3 67596867   2026-01-25T02:03:40.0… NYPD   New York C… Noise - Comme… Loud Musi…
#> # ℹ 26 more variables: location_type <chr>, incident_zip <chr>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <chr>, police_precinct <chr>, bbl <chr>, borough <chr>,
#> #   x_coordinate_state_plane <chr>, y_coordinate_state_plane <chr>, …

# Checking to see the filtering worked
unique(brooklyn_311$borough)
#> [1] "BROOKLYN"
```

Success! From calling the `brooklyn_311` dataset we see there are only 3
rows of data, and from the
[`unique()`](https://rdrr.io/r/base/unique.html) call we see the only
borough featured in our dataset is BROOKLYN.

One of the strongest qualities this function has is its ability to
filter based off of multiple columns. Let’s put everything together and
get a dataset of the last *50* 311 requests from the New York Police
Department in Brooklyn.

``` r
# Creating the dataset
brooklyn_nypd <- nyc_311(limit = 50, filters = list(agency = "NYPD", borough = "BROOKLYN"))

# Calling head of our new dataset
head(brooklyn_nypd)
#> # A tibble: 6 × 36
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67596881   2026-01-25T02:04:27.0… NYPD   New York C… Noise - Resid… Loud Musi…
#> 2 67601964   2026-01-25T02:04:12.0… NYPD   New York C… Noise - Stree… Loud Musi…
#> 3 67596867   2026-01-25T02:03:40.0… NYPD   New York C… Noise - Comme… Loud Musi…
#> 4 67595131   2026-01-25T02:03:13.0… NYPD   New York C… Blocked Drive… Partial A…
#> 5 67600240   2026-01-25T02:00:47.0… NYPD   New York C… Noise - Resid… Banging/P…
#> 6 67600279   2026-01-25T01:58:32.0… NYPD   New York C… Illegal Parki… Parking P…
#> # ℹ 30 more variables: location_type <chr>, incident_zip <chr>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <chr>, police_precinct <chr>, bbl <chr>, borough <chr>,
#> #   x_coordinate_state_plane <chr>, y_coordinate_state_plane <chr>, …

# Quick check to make sure our filtering worked
nrow(brooklyn_nypd)
#> [1] 50
unique(brooklyn_nypd$agency)
#> [1] "NYPD"
unique(brooklyn_nypd$borough)
#> [1] "BROOKLYN"
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
ggplot(brooklyn_nypd, aes(y = reorder(complaint_type, complaint_type, length))) +
  geom_bar(fill = "steelblue") +
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
Endpoints. R package version 0.1.4,
<https://martinezc1.github.io/nycOpenData/>.
