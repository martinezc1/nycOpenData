
# nycOpenData <img src="man/figures/nycOpenData_hex.png" alt="nycOpenData logo" width="72" align="right" />

[![CRAN status](https://www.r-pkg.org/badges/version/nycOpenData)](https://CRAN.R-project.org/package=nycOpenData)
[![CRAN downloads](https://cranlogs.r-pkg.org/badges/grand-total/nycOpenData?color=blue)](https://r-pkg.org/pkg/nycOpenData)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![Project Status: Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Codecov test coverage](https://codecov.io/gh/martinezc1/nycOpenData/graph/badge.svg)](https://app.codecov.io/gh/martinezc1/nycOpenData)

`nycOpenData` provides simple, reproducible access to datasets from
the  
[NYC Open Data](https://opendata.cityofnewyork.us/) platform — directly
from R,  
with **no API keys** or manual downloads required. The package is
available on **CRAN**.

Version **0.1.5** now includes wrappers for **30+ NYC Open Data APIs**,
covering:

- 311 Service Requests  
- For-Hire Vehicles (FHV)  
- Juvenile Justice (rearrest rates + caseloads)  
- School Discharge Reporting  
- Violent & Disruptive School Incidents  
- Detention Admissions  
- Borough/Community District Reports  
- Street Tree Census  
- Urban Park Ranger Animal Condition Responses  
- Permitted Events (Historical)  
- and more

All functions return clean **tibble** outputs and support filtering
via  
`filters = list(field = "value")`.

------------------------------------------------------------------------

## Installation

### From **CRAN**

``` r
install.packages("nycOpenData")
```

### Development version (GitHub)

``` r
devtools::install_github("martinezc1/nycOpenData")
```

------------------------------------------------------------------------

## Example

``` r
library(nycOpenData)

# Get 5,000 most recent 311 requests
data <- nyc_311(limit = 5000)

# Filter by agency and city
filtered <- nyc_311(
  limit = 2000,
  filters = list(agency = "NYPD", city = "BROOKLYN")
)

head(filtered)
```

    ## # A tibble: 6 × 37
    ##   unique_key created_date           agency agency_name complaint_type descriptor
    ##   <chr>      <chr>                  <chr>  <chr>       <chr>          <chr>     
    ## 1 67613985   2026-01-26T02:06:05.0… NYPD   New York C… Noise - Resid… Banging/P…
    ## 2 67609553   2026-01-26T02:02:09.0… NYPD   New York C… Noise - Resid… Banging/P…
    ## 3 67610990   2026-01-26T01:58:58.0… NYPD   New York C… Illegal Parki… Blocked H…
    ## 4 67615428   2026-01-26T01:56:49.0… NYPD   New York C… Noise - Resid… Banging/P…
    ## 5 67609568   2026-01-26T01:48:16.0… NYPD   New York C… Noise - Resid… Loud Musi…
    ## 6 67612476   2026-01-26T01:47:10.0… NYPD   New York C… Noise - Resid… Loud Musi…
    ## # ℹ 31 more variables: location_type <chr>, incident_zip <chr>,
    ## #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
    ## #   cross_street_2 <chr>, intersection_street_1 <chr>,
    ## #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
    ## #   landmark <chr>, status <chr>, community_board <chr>,
    ## #   council_district <chr>, police_precinct <chr>, bbl <chr>, borough <chr>,
    ## #   x_coordinate_state_plane <chr>, y_coordinate_state_plane <chr>, …

------------------------------------------------------------------------

## Learn by example

- `vignette("nyc-311", package = "nycOpenData")` – Working with NYC 311
  data end-to-end

## About

`nycOpenData` makes New York City’s civic datasets accessible to
students,  
educators, analysts, and researchers through a unified and user-friendly
R interface.  
Developed to support reproducible research, open-data literacy, and
real-world analysis.

------------------------------------------------------------------------

## Comparison to Other Software

While the [`RSocrata`](https://CRAN.R-project.org/package=RSocrata)
package provides a general interface for any Socrata-backed portal,
`nycOpenData` is specifically tailored for the New York City ecosystem.

- **Ease of Use**: No need to hunt for 4x4 dataset IDs (e.g.,
  `erm2-nwe9`); functions like `nyc_311()` map directly to the most
  popular city datasets.
- **Pre-configured Logic**: Wrappers include default sorting (e.g.,
  `created_date DESC`) and optimized limit handling specific to NYC’s
  massive data volumes.
- **Open Literacy**: Designed specifically for students and researchers
  to lower the barrier to entry for civic data analysis.

------------------------------------------------------------------------

## Contributing

We welcome contributions! If you find a bug or would like to request a
wrapper for a specific NYC dataset, please open an issue or submit a
pull request on [GitHub](https://github.com/martinezc1/nycOpenData).

------------------------------------------------------------------------

## Author

**Christian A. Martinez**  
<c.martinez0@outlook.com>  
GitHub: <https://github.com/martinezc1>

Developed as part of  
**PSYC 7750G – Reproducible Psychological Research**  
Brooklyn College, City University of New York
