#' Read an Excel workbook file.
#'
#' This function is a wrapper around readxl::read_excel.
#'
#' Please read the read_excel docs
#' https://readxl.tidyverse.org/reference/read_excel.html
read_excel <- function(path, sheet, skip=1, col_types="text", trim_ws=TRUE, ...) {
  # Load Excel workbook
  df = readxl::read_excel(
    path=path,
    sheet=sheet,
    skip=skip,
    col_types=col_types,
    trim_ws=trim_ws,
    ...
  )
  # Just keep the field header, description, and data type.
  # i.e. the Field, Field name, and Format columns.
  df <- df[,1:3]

  return(df)
}
