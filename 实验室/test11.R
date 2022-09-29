library(shiny)
library(shinyBS)
shinyApp(
  ui = fluidPage(
    br(),
    selectInput("works", 
                label = tags$span(
                  "This works", 
                  tags$i(
                    class = "glyphicon glyphicon-info-sign", 
                    style = "color:#0072B2;",
                    title = "Further information "
                  )),
                choices = c("a","b")),
    selectInput("worksnow", 
      label = tags$span("This works now too", bsButton("thisworks", label = "", icon = icon("info"), style = "info", size = "extra-small")),
      choices = c("a","b")
    ),
    bsPopover(
      id = "thisworks",
      title = "More information",
      content = paste0(
        "Any HTML can be here ",
        a("ShinyBS", href = "https://ebailey78.github.io/shinyBS/index.html", target="_blank")
      ),
      placement = "right",
      trigger = "hover",
      options = list(container = "body")
    )
  ),
  
  server = function(input, output) {
  }
)

