# TOS Parser

This package may be used to load a Technical Output Specification (TOS) and convert it to a machine-readable, open format such as YAML.

[YAML](https://en.wikipedia.org/wiki/YAML) is a data format that aims to be easy to learn and human-readable. The name "YAML" is a recursive acronym that stands for "YAML Ain’t Markup Language."

The YAML files used to specify the data validation rules are determined by the [validate](https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html#82_Metadata_in_text_files:_YAML) R package.

For example, the following field definitions would be converted from below (CSV format)

```csv
A_NUMACP,Number of Valid Augmented Care Period Groups,Number
ACPDISP_n,Augmented Care Period Destination,String(2)
ACPEND_n,Augmented Care Period End Date,Date(YYYY-MM-DD)
```

to YAML format like this:

```yaml
rules:
  # A_NUMACP
  - name: A_NUMACP is numeric
    expr: is.numeric("A_NUMACP")
  - name: A_NUMACP is an integer
    expr: number_format(A_NUMACP, "d*")
  - name: A_NUMACP is unsigned
    expr: A_NUMACP >= 0
  # ACPDISP_n
  - name: ACPDISP_n is a string
    expr: is.character("ACPDISP_n")
  - name: ACPDISP_n has up to 2 characters
  	expr: nchar("ACPDISP_n") <= 2
  # ACPEND_n
  - name: ACPDISP_n is a date
    expr: field_format("ACPDISP_n", "^\\d{4}-\\d{2}-\\d{2}$")
```

# Installation

## Dependencies

* [readxl](https://cli.r-lib.org/) is used to load Excel workbooks.
* [validate](https://cran.r-project.org/web/packages/validate/index.html) is used to define data validation rules.

# Usage

TODO

# Development

This repository contains an R package. See: https://r-pkgs.org/

