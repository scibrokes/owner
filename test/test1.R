library(shiny)

radio_button_choices = list("Tab 1" = 1, "Tab 2" = 2, "Tab 3" = 3)

ui <- fluidPage(

sidebarLayout(
    sidebarPanel(
      radioButtons(inputId = "radio_button", label = h5("Select tab"), choices = radio_button_choices)),

    mainPanel(
      tabsetPanel(id = "tab",

                  tabPanel("Tab1", value = "panel1", htmlOutput("text1")),
                  tabPanel("Tab2", value = "panel2", htmlOutput("text2")),
                  tabPanel("Tab3", value = "panel3", htmlOutput("text3"))
      )
    ) 
  )
)

server <- function(input, output, session) {

  observeEvent(input$radio_button, {
    updateTabsetPanel(session, "tab",
                      selected = paste0("panel", input$radio_button)
    )
  })

  output$text1 = renderUI({
    str1 = "This is tab 1"
    HTML(paste(str1)) 
  })

  output$text2 = renderUI({
    str1 = "This is tab 2"
    HTML(paste(str1)) 
  })

  output$text3 = renderUI({
    str1 = "This is tab 3"
    HTML(paste(str1)) 
  })

}

# Run the application 
shinyApp(ui = ui, server = server)