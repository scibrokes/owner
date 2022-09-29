library(shiny)
library(shinydashboard)
conflict_prefer("dashboardBody", "shinydashboard")
conflict_prefer("dashboardPage", "shinydashboardPlus")
conflict_prefer("box", "shinydashboard")

body <- dashboardBody(
  fluidRow(
    box(
      title = actionLink("titleId", "Update", icon = icon("refresh")), 
      width = 4, solidHeader = TRUE, status = "primary",
      uiOutput("boxContentUI")
    ),
    box(
      title = p("Title 1", 
                actionButton("titleBtId", "", icon = icon("refresh"),
                  class = "btn-xs", title = "Update")
      ), 
      width = 4, solidHeader = TRUE, status = "warning",
      uiOutput("boxContentUI2")
    )
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "Row layout"),
  dashboardSidebar(),
  body
)

server = function(input, output, session) { 
  output$boxContentUI <- renderUI({
    input$titleId
    pre(paste(sample(letters,10), collapse = ", "))
  }) 

  output$boxContentUI2 <- renderUI({
    input$titleBtId
    pre(paste(sample(LETTERS,10), collapse = ", "))
  })  
}

shinyApp(ui = ui, server = server)