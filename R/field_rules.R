library(validate)


#' This function generates data validation rules for a field, based on its
#' format in the Technical Output Specification (TOS).
#'
#' @param format A string e.g. "Number", "String(3)", "Date(YYYY-MM-DD)"
field_rules <- function(format) {

  # Build a list of rules
  rules = list()

  # Integer
  if (format == "Number") {
    rules_ = c(
      function(x) x%%1==0
    )

    rules <- append(rules, rules_)
  # Date
  } else if (format="Date(YYYY-MM-DD)") {

  # String
  } else {

  }

  return(rules)
}
