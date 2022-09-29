library(shiny)
runApp(
  list(
    ui = fluidPage(
      titlePanel("Validation App"),
      sidebarLayout(
        sidebarPanel(
          selectInput("data", label = "Data set", choices = c("", "mtcars"))
        ),
        mainPanel(uiOutput("tableUI"))
      )
    ),

    server = function(input, output) {
      data <- reactive({ 
        get(input$data, 'package:datasets') 
      })

      output$tableUI <- renderUI({
        if (input$data == "") {
          div(
            HTML('<ruby>건설<rp>(</rp><rt>geonseol</rt><rp>)</rp>중<rp>(</rp><rt>jung</rt><rp>)</rp></ruby> !')
          ) 
        } else {
          tableOutput("table")
        }
      })

      output$table <- renderTable(head(data()))
    }

  )
)