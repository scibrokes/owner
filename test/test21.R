## https://github.com/moldach/scss-shiny
## https://shiny.rstudio.com/articles/packaging-javascript.html
## https://codepen.io/victorfreire/pen/XXzqEr

library(shiny)
library(shinyMobile)

ui <- f7Page(
  includeHTML("www/test21.html"),
  includeCSS("www/test21.css")
)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)
