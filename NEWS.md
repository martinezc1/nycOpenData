# nycOpenData 0.2.2

## Major improvements

This release continues the transition to a catalog-driven workflow for accessing NYC Open Data datasets in R, emphasizing transparency, reproducibility, and streamlined API access.

- `nyc_list_datasets()` now serves as the primary entry point for discovering datasets available through the live NYC Open Data catalog.
- `nyc_pull_dataset()` provides a unified interface for downloading datasets using either human-readable catalog keys or Socrata dataset UIDs.
- Dataset keys are generated dynamically using `janitor::make_clean_names()` based on live catalog metadata.
- Expanded support for flexible dataset discovery and retrieval without requiring dedicated dataset wrapper functions.

## New features

- Added support for flexible dataset selection using either:
  - human-readable catalog keys (e.g., `"motor_vehicle_collisions_crashes"`)
  - or stable Socrata dataset UIDs (e.g., `"h9gi-nx95"`)
- Added support for date filtering using `date`, `from`, and `to` arguments with user-specified `date_field`.
- Improved filtering support with vectorized filters translated into SQL-style `IN` clauses.
- Improved support for direct Socrata endpoint access through `nyc_any_dataset()`.

## Documentation

- Substantially expanded README documentation to clarify:
  - package architecture
  - Socrata API workflows
  - SoQL usage
  - dataset keys versus UIDs
  - catalog-driven dataset retrieval
  - type coercion behavior
- Improved function documentation for:
  - `nyc_list_datasets()`
  - `nyc_pull_dataset()`
  - `nyc_any_dataset()`
- Updated examples to demonstrate:
  - realistic catalog search workflows
  - filtering
  - date-based queries
  - direct endpoint access
- Revised vignettes to align with the new catalog-driven architecture and remove outdated wrapper-function references.
- Added additional development and testing documentation for `vcr` and `webmockr`.

## Internal improvements

- Refactored internal request handling to support dynamic catalog lookup.
- Improved validation for dataset identifiers, filters, and date-filtering parameters.
- Improved handling of conservative heuristic-based type coercion.
- Reduced reliance on dedicated dataset wrapper functions in favor of a unified interface.

## Maintenance

- Updated package citation information and version consistency across package documentation.
- Continued improvements to API reliability, documentation clarity, and internal utilities.
