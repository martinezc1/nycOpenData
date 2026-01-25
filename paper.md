# Summary

The `nycOpenData` package provides a unified, tidy interface to the New
York City Open Data portal. By wrapping about 40 distinct municipal
datasets—ranging from 311 service requests to Department of Buildings
job applications—the package abstracts the complexities of the SODA
(Socrata Open Data API) into a consistent set of R functions. Each
function returns a standardized tibble, supporting seamless integration
into tidyverse-based data science workflows.

# Statement of Need

New York City maintains one of the most comprehensive open data portals
in the world. However, researchers and students often face barriers when
accessing this data, including navigating diverse endpoint identifiers,
managing API rate limits, and cleaning raw JSON responses. While
general-purpose Socrata wrappers exist, they require users to manually
specify API endpoints and handle domain-specific data types.

`nycOpenData` addresses these challenges by providing curated wrappers
for the most high-impact datasets used in urban research. The package is
currently a core pedagogical component of the curriculum for
‘Reproducible Research Using R’, where it serves as the primary tool for
teaching automated data acquisition. With over 500 downloads to date,
the package has demonstrated significant utility in both academic and
practitioner environments.

# Key Features

- **Curated Access:** Wrappers for 40+ datasets including TLC records,
  crime statistics, and environmental data.
- **Reproducibility:** Integrated with the `vcr` package for mocked HTTP
  testing, allowing research pipelines to be verified offline.
- **Tidy Format:** Every function ensures that date-time strings,
  numeric values, and logical flags are correctly parsed into R types
  upon arrival.

# Acknowledgements

The author thanks the NYC Open Data team for maintaining the underlying
infrastructure and the users of ‘Reproducible Research Using R’ for
their ongoing feedback and testing.
