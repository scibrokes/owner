library(shiny)

radio_button_choices = list("Tab 1" = 1, "Tab 2" = 2, "Tab 3" = 3)
panel_choices = list("Panel 1" = 1, "Panel 2" = 2, "Panel 3" = 3)

ui <- fluidPage(

  sidebarLayout(
    sidebarPanel(
      radioButtons(inputId = "radio_button", label = h5("Select tab"), choices = radio_button_choices)),

    mainPanel(
      tabsetPanel(id = "tab",

                  tabPanel(names(panel_choices)[1], value = panel_choices[[1]], htmlOutput("text1")),
                  tabPanel(names(panel_choices)[2], value = panel_choices[[2]], htmlOutput("text2")),
                  tabPanel(names(panel_choices)[3], value = panel_choices[[3]], htmlOutput("text3"))
      )
    ) 
  )
)

server <- function(input, output, session) {

  observeEvent(input$radio_button, {
    updateTabsetPanel(session, "tab", selected = input$radio_button)
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

  observeEvent(input$tab, {
    updateRadioButtons(session, "radio_button", selected = input$tab)
  })

}

# Run the application 
shinyApp(ui = ui, server = server)