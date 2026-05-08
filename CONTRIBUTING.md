# Contributing to nycOpenData

Thank you for your interest in contributing to **nycOpenData**!

`nycOpenData` provides a lightweight R interface to the NYC Open Data
Socrata API, allowing users to discover and retrieve datasets through a
catalog-driven workflow.

This guide explains how to report issues, suggest improvements, and
contribute code or documentation changes.

------------------------------------------------------------------------

# Code of Conduct

Please be respectful and constructive in all interactions.

By participating in this project, you agree to abide by the standards
described in `CODE_OF_CONDUCT.md`.

------------------------------------------------------------------------

# Ways to Contribute

Contributions are welcome in many forms, including:

- Reporting bugs or unexpected behavior
- Improving documentation or examples
- Expanding tests and edge-case coverage
- Improving API reliability or error handling
- Improving package ergonomics and developer workflows
- Improving vignette clarity or reproducibility

------------------------------------------------------------------------

# Filing Issues

When opening an issue, please include:

1.  What you expected to happen
2.  What actually happened
3.  A minimal reproducible example using `reprex`
4.  [`sessionInfo()`](https://rdrr.io/r/utils/sessionInfo.html) output
    when relevant

If the issue is dataset-specific, please also include:

- the dataset name and/or Socrata dataset UID
- any filters or query arguments used
- whether the issue appears intermittent

Example dataset UID:

``` r
"erm2-nwe9"
```
