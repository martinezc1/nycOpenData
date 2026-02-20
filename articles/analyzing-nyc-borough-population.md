# New York City Population by Borough 1950 - 2040

## Introduction

New York City is made up of five boroughs: the Bronx, Brooklyn,
Manhattan, Queens, and Staten Island. The population of each of these
boroughs has varied throughout the past century. On the NYC Open Data
portal, the [New York City Population by Borough, 1950 -
2040](https://data.cityofnewyork.us/City-Government/New-York-City-Population-by-Borough-1940-2040/xywu-7bv9)
dataset hosts population estimates and projections.

The
[`nyc_borough_population()`](https://martinezc1.github.io/nycOpenData/reference/nyc_borough_population.md)
function provides access to historical census data and population
projections from 1950 to 2040, allowing one to analyze demographic
trends across Brooklyn, Bronx, Manhattan, Queens, and Staten Island.

The `nycOpenData` package provides a streamlined interface for accessing
New York City’s vast open data resources. It connects directly to the
NYC Open Data Portal. It is currently utilized as a primary tool for
teaching data acquisition in [Reproducible Research Using
R](https://martinezc1-reproducible-research-using-r.share.connect.posit.cloud/),
helping students bridge the gap between raw city APIs and tidy data
analysis.

## Pulling a Small Sample

Let’s start by pulling a small sample to see the structure:

``` r
small_sample <- nyc_borough_population(limit = 5)
small_sample
#> # A tibble: 5 × 22
#>   age_group  borough  x1950 x1950_boro_share_of_…¹  x1960 x1960_boro_share_of_…²
#>   <chr>      <chr>    <dbl>                  <dbl>  <dbl>                  <dbl>
#> 1 Total Pop… "NYC T… 7.89e6                  100   7.78e6                  100  
#> 2 Total Pop… "   Br… 1.45e6                   18.4 1.42e6                   18.3
#> 3 Total Pop… "   Br… 2.74e6                   34.7 2.63e6                   33.8
#> 4 Total Pop… "   Ma… 1.96e6                   24.8 1.70e6                   21.8
#> 5 Total Pop… "   Qu… 1.55e6                   19.6 1.81e6                   23.2
#> # ℹ abbreviated names: ¹​x1950_boro_share_of_nyc_total,
#> #   ²​x1960_boro_share_of_nyc_total
#> # ℹ 16 more variables: x1970 <dbl>, x1970_boro_share_of_nyc_total <dbl>,
#> #   x1980 <dbl>, x1980_boro_share_of_nyc_total <dbl>, x1990 <dbl>,
#> #   x1990_boro_share_of_nyc_total <dbl>, x2000 <dbl>,
#> #   x2000_boro_share_of_nyc_total <dbl>, x2010 <dbl>,
#> #   x2010_boro_share_of_nyc_total <dbl>, x2020 <dbl>, …

# Seeing what columns are in the dataset
names(small_sample)
#>  [1] "age_group"                     "borough"                      
#>  [3] "x1950"                         "x1950_boro_share_of_nyc_total"
#>  [5] "x1960"                         "x1960_boro_share_of_nyc_total"
#>  [7] "x1970"                         "x1970_boro_share_of_nyc_total"
#>  [9] "x1980"                         "x1980_boro_share_of_nyc_total"
#> [11] "x1990"                         "x1990_boro_share_of_nyc_total"
#> [13] "x2000"                         "x2000_boro_share_of_nyc_total"
#> [15] "x2010"                         "x2010_boro_share_of_nyc_total"
#> [17] "x2020"                         "x2020_boro_share_of_nyc_total"
#> [19] "x2030"                         "x2030_boro_share_of_nyc_total"
#> [21] "x2040"                         "x2040_boro_share_of_nyc_total"
```

## Pulling Full Dataset

Now let’s pull the complete dataset to work with:

``` r
population_data <- nyc_borough_population()

population_data |>
  slice_head(n = 6)
#> # A tibble: 6 × 22
#>   age_group  borough  x1950 x1950_boro_share_of_…¹  x1960 x1960_boro_share_of_…²
#>   <chr>      <chr>    <dbl>                  <dbl>  <dbl>                  <dbl>
#> 1 Total Pop… "NYC T… 7.89e6                 100    7.78e6                 100   
#> 2 Total Pop… "   Br… 1.45e6                  18.4  1.42e6                  18.3 
#> 3 Total Pop… "   Br… 2.74e6                  34.7  2.63e6                  33.8 
#> 4 Total Pop… "   Ma… 1.96e6                  24.8  1.70e6                  21.8 
#> 5 Total Pop… "   Qu… 1.55e6                  19.6  1.81e6                  23.2 
#> 6 Total Pop… "   St… 1.92e5                   2.43 2.22e5                   2.85
#> # ℹ abbreviated names: ¹​x1950_boro_share_of_nyc_total,
#> #   ²​x1960_boro_share_of_nyc_total
#> # ℹ 16 more variables: x1970 <dbl>, x1970_boro_share_of_nyc_total <dbl>,
#> #   x1980 <dbl>, x1980_boro_share_of_nyc_total <dbl>, x1990 <dbl>,
#> #   x1990_boro_share_of_nyc_total <dbl>, x2000 <dbl>,
#> #   x2000_boro_share_of_nyc_total <dbl>, x2010 <dbl>,
#> #   x2010_boro_share_of_nyc_total <dbl>, x2020 <dbl>, …
```

## Filtering by Borough

We can filter for a specific borough. Let’s look at Brooklyn’s
population over time:

``` r
brooklyn_pop <- nyc_borough_population(filters = list(borough = "Brooklyn"))

brooklyn_pop
#> # A tibble: 1 × 22
#>   age_group  borough  x1950 x1950_boro_share_of_…¹  x1960 x1960_boro_share_of_…²
#>   <chr>      <chr>    <dbl>                  <dbl>  <dbl>                  <dbl>
#> 1 Total Pop… "   Br… 2.74e6                   34.7 2.63e6                   33.8
#> # ℹ abbreviated names: ¹​x1950_boro_share_of_nyc_total,
#> #   ²​x1960_boro_share_of_nyc_total
#> # ℹ 16 more variables: x1970 <dbl>, x1970_boro_share_of_nyc_total <dbl>,
#> #   x1980 <dbl>, x1980_boro_share_of_nyc_total <dbl>, x1990 <dbl>,
#> #   x1990_boro_share_of_nyc_total <dbl>, x2000 <dbl>,
#> #   x2000_boro_share_of_nyc_total <dbl>, x2010 <dbl>,
#> #   x2010_boro_share_of_nyc_total <dbl>, x2020 <dbl>, …
```

## Mini analysis

Let’s visualize population trends across boroughs. First, we need to
reshape the data from wide to long format.

``` r

# Get full dataset and filter for Total Population rows only
population_data <- nyc_borough_population()

# Clean borough names and filter to get individual boroughs (exclude NYC Total)
borough_data <- population_data |>
  mutate(borough = trimws(borough)) |>  # Remove leading/trailing spaces
  filter(age_group == "Total Population", borough != "NYC Total")

# Reshape from wide to long format
pop_long <- borough_data |>
  select(borough, `x1950`, `x1960`, `x1970`, `x1980`, `x1990`, `x2000`, `x2010`, `x2020`, `x2030`, `x2040`) |>
  pivot_longer(cols = starts_with("x"), names_to = "year", values_to = "population") |>
  mutate(
    year = as.numeric(gsub("x", "", year)),
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
pop_long |>
  filter(year == 2040) |>
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
