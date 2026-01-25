# Changelog

## nycOpenData 0.1.5

### New features and documentation

- Added a new vignette, *“Working with NYC 311 Data”*, demonstrating an
  end-to-end, reproducible workflow for accessing, filtering, and
  visualizing NYC 311 service requests using
  [`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md).
  The vignette is available on the package website and via
  [`vignette("nyc-311", package = "nycOpenData")`](https://martinezc1.github.io/nycOpenData/articles/nyc-311.html).

- Updated
  [`nyc_311()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311.md)
  to explicitly target the NYC 311 Service Requests dataset covering
  **2020–present**, aligning the function with the current primary NYC
  Open Data endpoint.

- Added a new function,
  [`nyc_311_2010_2019()`](https://martinezc1.github.io/nycOpenData/reference/nyc_311_2010_2019.md),
  providing access to historical NYC 311 service request data from
  **2010–2019**, which is maintained as a separate dataset on the NYC
  Open Data platform.

### Bug fixes and maintenance

- Continued improvements to internal request handling for reliability
  and consistency when interacting with live NYC Open Data APIs.

- Updated documentation and examples to ensure robust behavior during
  CRAN checks while preserving reproducible workflows for interactive
  use.

- No breaking changes to existing function interfaces.
