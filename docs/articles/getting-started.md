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
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67976911   2026-02-13T02:05:17.0… NYPD   New York C… Illegal Parki… Blocked H…
#> 2 67975725   2026-02-13T02:04:00.0… DOHMH  Department… Rodent         Condition…
#> 3 67969953   2026-02-13T02:03:59.0… DOHMH  Department… Rodent         Rat Sight…
#> # ℹ 27 more variables: location_type <chr>, incident_zip <chr>,
#> #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
#> #   cross_street_2 <chr>, intersection_street_1 <chr>,
#> #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
#> #   landmark <chr>, status <chr>, community_board <chr>,
#> #   council_district <chr>, police_precinct <chr>, borough <chr>,
#> #   x_coordinate_state_plane <chr>, y_coordinate_state_plane <chr>, …

# Seeing what columns are in the dataset
colnames(small_sample)
#>  [1] "unique_key"               "created_date"            
#>  [3] "agency"                   "agency_name"             
#>  [5] "complaint_type"           "descriptor"              
#>  [7] "location_type"            "incident_zip"            
#>  [9] "incident_address"         "street_name"             
#> [11] "cross_street_1"           "cross_street_2"          
#> [13] "intersection_street_1"    "intersection_street_2"   
#> [15] "address_type"             "city"                    
#> [17] "landmark"                 "status"                  
#> [19] "community_board"          "council_district"        
#> [21] "police_precinct"          "borough"                 
#> [23] "x_coordinate_state_plane" "y_coordinate_state_plane"
#> [25] "open_data_channel_type"   "park_facility_name"      
#> [27] "park_borough"             "latitude"                
#> [29] "longitude"                "descriptor_2"            
#> [31] "bbl"                      "location.type"           
#> [33] "location.coordinates"
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
#> # A tibble: 3 × 33
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67975725   2026-02-13T02:04:00.0… DOHMH  Department… Rodent         Condition…
#> 2 67969706   2026-02-13T02:03:34.0… NYPD   New York C… Noise - Resid… Banging/P…
#> 3 67975470   2026-02-13T02:02:46.0… NYPD   New York C… Illegal Parki… Blocked S…
#> # ℹ 27 more variables: descriptor_2 <chr>, location_type <chr>,
#> #   incident_zip <chr>, incident_address <chr>, street_name <chr>,
#> #   cross_street_1 <chr>, cross_street_2 <chr>, intersection_street_1 <chr>,
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
#> # A tibble: 6 × 37
#>   unique_key created_date           agency agency_name complaint_type descriptor
#>   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
#> 1 67969706   2026-02-13T02:03:34.0… NYPD   New York C… Noise - Resid… Banging/P…
#> 2 67975470   2026-02-13T02:02:46.0… NYPD   New York C… Illegal Parki… Blocked S…
#> 3 67971119   2026-02-13T02:00:31.0… NYPD   New York C… Illegal Parki… Blocked H…
#> 4 67972570   2026-02-13T01:58:37.0… NYPD   New York C… Noise - Comme… Loud Musi…
#> 5 67978314   2026-02-13T01:55:47.0… NYPD   New York C… Blocked Drive… Partial A…
#> 6 67978376   2026-02-13T01:55:29.0… NYPD   New York C… Illegal Parki… Blocked H…
#> # ℹ 31 more variables: location_type <chr>, incident_zip <chr>,
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
Endpoints. R package version 0.1.6,
<https://martinezc1.github.io/nycOpenData/>.
