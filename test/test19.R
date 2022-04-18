## https://stackoverflow.com/questions/37169039/direct-link-to-tabitem-with-r-shiny-dashboard

library(shiny)
library(shinydashboard)
conflict_prefer("box", "shinydashboard")

ui <- shinyUI(
  dashboardPage(
    dashboardHeader(title = "Some Header"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Computations", tabName = "tabItem1", icon = icon("dashboard")),
        menuItem("Results", tabName = "tabItem2", icon = icon("th"))
      )
    ),

    dashboardBody(
      tags$script(HTML("
        var openTab = function(tabName){
          $('a', $('.sidebar')).each(function() {
            if(this.getAttribute('data-value') == tabName) {
              this.click()
            };
          });
        }
      ")),
      tabItems(
        tabItem(tabName = "tabItem1",
          fluidRow(
            box(plotOutput("plot1", height = 250)),

            box(
              title = "Controls",
              sliderInput("slider", "Number of observations:", 1, 100, 50)
            )
          ),
          infoBoxOutput("out1")
        ),

        tabItem(tabName = "tabItem2",
          h2("Widgets tab content")
        )
      )
    )
  )
)

server <- function(input, output){
  histdata <- rnorm(500)

  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })

  output$out1 <- renderInfoBox({
    infoBox("Completed",  
      a("Computation Completed", onclick = "openTab('tabItem2')", href="#"),
      icon = icon("thumbs-o-up"), color = "green"
    )
  })
}

shinyApp(ui, server)

