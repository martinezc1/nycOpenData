# List datasets available in nycOpenData

Retrieves the current NYC Open Data catalog and returns datasets
available for use with \`nyc_pull_dataset()\`.

## Usage

``` r
nyc_list_datasets()
```

## Value

A tibble of available datasets, including generated \`key\`, dataset
\`uid\`, and dataset \`name\`.

## Details

Keys are generated from dataset names using
\`janitor::make_clean_names()\`.

## Examples

``` r
if (interactive() && curl::has_internet()) {
  nyc_list_datasets()
}
```
