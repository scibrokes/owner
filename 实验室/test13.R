## Only run examples in interactive R sessions
#if (interactive()) {

library(shiny)
library(shinyvalidate)
er <- as.numeric(file.exists('www/ryo-kr.html'))

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
library(shinyvalidate)

ui <- fluidPage(
  textInput("lookup_id", "Lookup ID")
)

server <- function(input, output, session) {
  
  # Validation rules are set in the server, start by
  # making a new instance of an `InputValidator()`
  iv <- InputValidator$new()

  # Basic usage: `sv_regex()` requires both a regex
  # pattern and message to display if the validation
  # of `input$lookup_id` fails
  iv$add_rule(
    "lookup_id",
    sv_regex("error", HTML('<ruby>건설<rp>(</rp><rt>geonseol</rt><rp>)</rp>중<rp>(</rp><rt>jung</rt><rp>)</rp></ruby> !'))
  )

  # Finally, `enable()` the validation rules
  iv$enable()
}

shinyApp(ui, server)

}

# As an alternative to the above example, the
# following snippet can serve to replace the
# `iv$add_rule(...)` statement

# If you're more comfortable with wildcards
# (i.e., globbing) than with regular expressions,
# use `glob2rx()` in `pattern`

# iv$add_rule(
#   "lookup_id",
#   sv_regex(
#     pattern = glob2rx("*.png"),
#     message = "A filename ending in 'png' was expected",
#     ignore.case = TRUE
#   )
# )

