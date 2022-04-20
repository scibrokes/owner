require('BBmisc')
lib('shiny')
lib('shinyWidgets')

choices <- c('🇬🇧 ENGLISH' = 'en', 
  '🇨🇳 简体中文' = 'cn', 
  '🇹🇼 繁体中文' = 'tw', 
  '🇯🇵 日本語' = 'jp', 
  '🇰🇷 한국어' = 'kr', 
  '🇬🇷 Ελληνικά' = 'gr', 
  '🇩🇪 Deutsch' = 'de', 
  '🇫🇷 Français' = 'fr', 
  '🇮🇹 Italiano' = 'it')

ui <- fluidPage(
  tags$h1("Pretty radio buttons"),
  br(),

  fluidRow(
    column(
      width = 4,
      prettyRadioButtons(
        inputId = "radio1",
        label = "Click me!",
        choices = choices, 
        shape = 'curve', animation = 'pulse', 
        selected = character(0), status = 'primary', 
        thick = TRUE, width = '100%', bigger = TRUE, 
        icon = icon('registered')
      ),
      verbatimTextOutput(outputId = "res1")
    )
  )
)

server <- function(input, output, session) {
  output$res1 <- renderPrint(input$radio1)
}

shinyApp(ui, server)