require('BBmisc')
pkgs <- c('shiny', 'shinyvalidate','shinyFeedback')
lib(pkgs)

ui <- fluidPage(
  selectInput("language", "Language", choices = c("", "English", "Maori")),
  textInput("name", "Name"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  greetings <- c(
    English = "Hello", 
    Maori = "Kia ora"
  )
  output$greeting <- renderText({
    req(input$language, input$name)
    paste0(greetings[[input$language]], " ", input$name, "!")
  })
}
shinyApp(ui, server)

