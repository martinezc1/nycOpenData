# New York City Population by Borough 1950 - 2040

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
library(tidyr)
```

## Introduction

New York City is made up of five boroughs: the Bronx, Brooklyn,
Manhattan, Queens, and Staten Island. The population of each of these
boroughs has varied throughout the past century.

The
[`nyc_borough_population()`](https://martinezc1.github.io/nycOpenData/reference/nyc_borough_population.md)
function provides access to historical census data and population
projections from 1950 to 2040, allowing one to analyze demographic
trends across Brooklyn, Bronx, Manhattan, Queens, and Staten Island.

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal. It is currently utilized as a primary tool for
teaching data acquisition in [Reproducible Research Using
R](https://martinezc1-textbook--reproducible-research-using-r.share.connect.posit.cloud),
helping students bridge the gap between raw city APIs and tidy data
analysis.

## Pulling a Small Sample

Let’s start by pulling a small sample to see the structure:

``` r
small_sample <- nyc_borough_population(limit = 5)
small_sample
#> # A tibble: 5 × 22
#>   age_group        borough        `_1950` _1950_boro_share_of_nyc_tota…¹ `_1960`
#>   <chr>            <chr>          <chr>   <chr>                          <chr>  
#> 1 Total Population "NYC Total"    7891957 100.00                         7781984
#> 2 Total Population "   Bronx"     1451277 18.39                          1424815
#> 3 Total Population "   Brooklyn"  2738175 34.70                          2627319
#> 4 Total Population "   Manhattan" 1960101 24.84                          1698281
#> 5 Total Population "   Queens"    1550849 19.65                          1809578
#> # ℹ abbreviated name: ¹​`_1950_boro_share_of_nyc_total`
#> # ℹ 17 more variables: `_1960_boro_share_of_nyc_total` <chr>, `_1970` <chr>,
#> #   `_1970_boro_share_of_nyc_total` <chr>, `_1980` <chr>,
#> #   `_1980_boro_share_of_nyc_total` <chr>, `_1990` <chr>,
#> #   `_1990_boro_share_of_nyc_total` <chr>, `_2000` <chr>,
#> #   `_2000_boro_share_of_nyc_total` <chr>, `_2010` <chr>,
#> #   `_2010_boro_share_of_nyc_total` <chr>, `_2020` <chr>, …

# Seeing what columns are in the dataset
colnames(small_sample)
#>  [1] "age_group"                     "borough"                      
#>  [3] "_1950"                         "_1950_boro_share_of_nyc_total"
#>  [5] "_1960"                         "_1960_boro_share_of_nyc_total"
#>  [7] "_1970"                         "_1970_boro_share_of_nyc_total"
#>  [9] "_1980"                         "_1980_boro_share_of_nyc_total"
#> [11] "_1990"                         "_1990_boro_share_of_nyc_total"
#> [13] "_2000"                         "_2000_boro_share_of_nyc_total"
#> [15] "_2010"                         "_2010_boro_share_of_nyc_total"
#> [17] "_2020"                         "_2020_boro_share_of_nyc_total"
#> [19] "_2030"                         "_2030_boro_share_of_nyc_total"
#> [21] "_2040"                         "_2040_boro_share_of_nyc_total"
```

## Pulling Full Dataset

Now let’s pull the complete dataset to work with:

``` r
population_data <- nyc_borough_population()
head(population_data)
#> # A tibble: 6 × 22
#>   age_group        borough            `_1950` _1950_boro_share_of_nyc_…¹ `_1960`
#>   <chr>            <chr>              <chr>   <chr>                      <chr>  
#> 1 Total Population "NYC Total"        7891957 100.00                     7781984
#> 2 Total Population "   Bronx"         1451277 18.39                      1424815
#> 3 Total Population "   Brooklyn"      2738175 34.70                      2627319
#> 4 Total Population "   Manhattan"     1960101 24.84                      1698281
#> 5 Total Population "   Queens"        1550849 19.65                      1809578
#> 6 Total Population "   Staten Island" 191555  2.43                       221991 
#> # ℹ abbreviated name: ¹​`_1950_boro_share_of_nyc_total`
#> # ℹ 17 more variables: `_1960_boro_share_of_nyc_total` <chr>, `_1970` <chr>,
#> #   `_1970_boro_share_of_nyc_total` <chr>, `_1980` <chr>,
#> #   `_1980_boro_share_of_nyc_total` <chr>, `_1990` <chr>,
#> #   `_1990_boro_share_of_nyc_total` <chr>, `_2000` <chr>,
#> #   `_2000_boro_share_of_nyc_total` <chr>, `_2010` <chr>,
#> #   `_2010_boro_share_of_nyc_total` <chr>, `_2020` <chr>, …
```

## Filtering by Borough

We can filter for a specific borough. Let’s look at Brooklyn’s
population over time:

``` r
brooklyn_pop <- nyc_borough_population(filters = list(borough = "   Brooklyn"))
brooklyn_pop
#> # A tibble: 1 × 22
#>   age_group        borough       `_1950` `_1950_boro_share_of_nyc_total` `_1960`
#>   <chr>            <chr>         <chr>   <chr>                           <chr>  
#> 1 Total Population "   Brooklyn" 2738175 34.70                           2627319
#> # ℹ 17 more variables: `_1960_boro_share_of_nyc_total` <chr>, `_1970` <chr>,
#> #   `_1970_boro_share_of_nyc_total` <chr>, `_1980` <chr>,
#> #   `_1980_boro_share_of_nyc_total` <chr>, `_1990` <chr>,
#> #   `_1990_boro_share_of_nyc_total` <chr>, `_2000` <chr>,
#> #   `_2000_boro_share_of_nyc_total` <chr>, `_2010` <chr>,
#> #   `_2010_boro_share_of_nyc_total` <chr>, `_2020` <chr>,
#> #   `_2020_boro_share_of_nyc_total` <chr>, `_2030` <chr>, …
```

## Mini analysis

Let’s visualize population trends across boroughs. First, we need to
reshape the data from wide to long format: \## Mini analysis

Let’s visualize population trends across boroughs. First, we need to
reshape the data from wide to long format:

``` r

# Get full dataset and filter for Total Population rows only
population_data <- nyc_borough_population()

# Clean borough names and filter to get individual boroughs (exclude NYC Total)
borough_data <- population_data %>%
  mutate(borough = trimws(borough)) %>%  # Remove leading/trailing spaces
  filter(age_group == "Total Population", borough != "NYC Total")

# Reshape from wide to long format
pop_long <- borough_data %>%
  select(borough, `_1950`, `_1960`, `_1970`, `_1980`, `_1990`, `_2000`, `_2010`, `_2020`, `_2030`, `_2040`) %>%
  pivot_longer(cols = starts_with("_"), names_to = "year", values_to = "population") %>%
  mutate(
    year = as.numeric(gsub("_", "", year)),
    population = as.numeric(population)
  )

# Create line chart
ggplot(pop_long, aes(x = year, y = population, color = borough)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  scale_y_continuous(labels = scales::comma) +
  theme_minimal() +
  labs(
    title = "NYC Population by Borough: 1950-2040",
    subtitle = "Historical data and projections",
    x = "Year",
    y = "Population",
    color = "Borough"
  ) +
  theme(legend.position = "bottom")
```

![Line chart showing population trends for NYC's five boroughs from 1950
to
2040.](analyzing-nyc-borough-population_files/figure-html/population-trends-1.png)

Population trends for NYC’s five boroughs from 1950 to 2040, including
historical data and projections.

We can also look at which borough is projected to have the largest
population in 2040:

``` r
pop_long %>%
  filter(year == 2040) %>%
  arrange(desc(population))
#> # A tibble: 5 × 3
#>   borough        year population
#>   <chr>         <dbl>      <dbl>
#> 1 Brooklyn       2040    2840525
#> 2 Queens         2040    2412649
#> 3 Manhattan      2040    1691617
#> 4 Bronx          2040    1579245
#> 5 Staten Island  2040     501109
```

## Summary

The
[`nyc_borough_population()`](https://martinezc1.github.io/nycOpenData/reference/nyc_borough_population.md)
function provides easy access to demographic data for New York City
spanning from 1950-2040. This enables analysis of long-term population
trends, comparisons across boroughs, and exploration of projected future
changes.

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
