## https://www.cuoshuo.com/blog/452769.html
library(shiny)
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
    
    selectInput("notwork", 
                label = tags$span(
                  "This not works", 
                  tags$i(
                    class = "glyphicon glyphicon-info-sign", 
                    style = "color:#0072B2;",
                    title = list("Further information ",
                    tags$a(href = "https://www.google.com", "here", .noWS = "after"))
                  )),
                choices = c("a","b")),
    
    selectInput("notwork2", 
                label = tags$span(
                  "Neither this", 
                  tags$i(
                    class = "glyphicon glyphicon-info-sign", 
                    style = "color:#0072B2;",
                    title = p("Further information ",
                                 strong("here"))
                  )),
                choices = c("a","b")),
  ),
  
  server = function(input, output) {
  }
)

#shinyApp(ui=ui, server=server)
