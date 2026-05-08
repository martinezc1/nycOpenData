## Resubmission

This release introduces a major architectural redesign of `nycOpenData`,
transitioning from dataset-specific wrapper functions to a unified,
catalog-driven workflow.

Major changes include:

- Added `nyc_list_datasets()` for retrieving live NYC Open Data catalog metadata.
- Added `nyc_pull_dataset()` as the primary interface for downloading datasets using either catalog keys or Socrata dataset UIDs.
- Expanded support for flexible filtering, date-based queries, and direct endpoint access.
- Significantly revised documentation, examples, and vignettes to improve transparency around:
  - Socrata API workflows
  - dataset identifiers
  - SoQL usage
  - type coercion behavior
  - catalog-based retrieval
- Updated package examples and testing infrastructure.

All checks pass locally with:

```r
devtools::check()
```
