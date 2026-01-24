# nycOpenData

[![CRAN
status](https://www.r-pkg.org/badges/version/nycOpenData)](https://CRAN.R-project.org/package=nycOpenData)
[![CRAN
downloads](https://cranlogs.r-pkg.org/badges/grand-total/nycOpenData)](https://CRAN.R-project.org/package=nycOpenData)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)

`nycOpenData` provides simple, reproducible access to datasets from
the  
[NYC Open Data](https://opendata.cityofnewyork.us/) platform — directly
from R,  
with **no API keys** or manual downloads required. The package is
available on **CRAN**.

Version **0.1.4** now includes wrappers for **30+ NYC Open Data APIs**,
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

``` R
## # A tibble: 6 × 37
##   unique_key created_date    agency agency_name complaint_type descriptor
##   <chr>      <chr>           <chr>  <chr>       <chr>          <chr>     
## 1 67573446   2026-01-23T02:… NYPD   New York C… Noise - Resid… Loud Musi…
## 2 67572026   2026-01-23T02:… NYPD   New York C… Illegal Parki… Commercia…
## 3 67570616   2026-01-23T02:… NYPD   New York C… Noise - Comme… Loud Musi…
## 4 67570609   2026-01-23T02:… NYPD   New York C… Illegal Parki… Blocked H…
## 5 67574840   2026-01-23T02:… NYPD   New York C… Noise - Resid… Loud Talk…
## 6 67572050   2026-01-23T02:… NYPD   New York C… Noise - Resid… Loud Tele…
## # ℹ 31 more variables: location_type <chr>, incident_zip <chr>,
## #   incident_address <chr>, street_name <chr>, cross_street_1 <chr>,
## #   cross_street_2 <chr>, intersection_street_1 <chr>,
## #   intersection_street_2 <chr>, address_type <chr>, city <chr>,
## #   landmark <chr>, status <chr>, community_board <chr>,
## #   council_district <chr>, police_precinct <chr>, bbl <chr>,
## #   borough <chr>, x_coordinate_state_plane <chr>, …
```

------------------------------------------------------------------------

## About

`nycOpenData` makes New York City’s civic datasets accessible to
students,  
educators, analysts, and researchers through a unified and user-friendly
R interface.  
Developed to support reproducible research, open-data literacy, and
real-world analysis.

------------------------------------------------------------------------

## Author

**Christian A. Martinez**  
<c.martinez0@outlook.com>  
GitHub: <https://github.com/martinezc1>

Developed as part of  
**PSYC 7750G – Reproducible Psychological Research**  
Brooklyn College, City University of New York
