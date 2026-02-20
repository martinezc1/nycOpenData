# Changelog

## nycOpenData 0.1.6

CRAN release: 2026-02-14

### New features and documentation

This release marks the first contributor-powered expansion of
nycOpenData, with new dataset functions, tests, and documentation added
by student contributors.

- Added support for the NYPD Hate Crimes dataset (Crystal Adote,
  [@crystalna20](https://github.com/crystalna20)).
- Added support for the Local Law 18 Pay and Demographics Report dataset
  (Jonah Dratfield, [@jdratfield38](https://github.com/jdratfield38)).
- Added support for NYPD Shooting Incident Data (Year To Date) (Joyce
  Escatel-Flores, [@JoyceEscatel](https://github.com/JoyceEscatel)).
- Added support for New York City Population by Borough, 1950–2040 (Rob
  Hutto, [@robhutto](https://github.com/robhutto)).
- Added support for Inmate Incidents – Slashing and Stabbing (Isley
  Jean-Pierre, [@ijpier](https://github.com/ijpier)).
- Added support for the NYC Wetlands dataset, including tests and
  vignette (Shannon Joyce,
  [@shannonjoyce](https://github.com/shannonjoyce)).
- Added support for the NYCHA Violations dataset (Laura Rose-Werner,
  [@laurarosewerner](https://github.com/laurarosewerner)).
- Added support for NYC Climate Projections: Extreme Events and Sea
  Level Rise (Emma Tupone,
  [@emmatup0205](https://github.com/emmatup0205)).
- Added support for Local Law 97 of 2021 – Pets in Shelter Report (Xinru
  Wang, [@xrwangxr](https://github.com/xrwangxr)).

Each new dataset function follows the nyc\_\*() interface design,
includes documentation, and integrates with the package’s internal
request handling system.

### Documentation and vignettes

- Expanded vignettes and examples accompanying new dataset functions.
- Continued improvements to reproducible workflow demonstrations across
  datasets.

### Maintenance

- Ongoing improvements to internal request handling and API reliability.
- No breaking changes to existing function interfaces.
