library('BBmisc')
lib('shiny')
lib('htmlwidgets')
lib('DT')

# ui.R
# --------------------------------------------------------
ui <- shinyUI(fluidPage(
  title = 'Basic usage of D3Table in Shiny',
  fluidRow(column(width = 12, downloadButton("downloadData", "Download"))),
  fluidRow(column(width = 12, D3TableOutput('test'))
  )
))

# server.R
# --------------------------------------------------------
server <- shinyServer(function(input, output, session) {
  tbl <- readr::read_tsv("data.tsv")

  table_1 <-  D3Table(data = tbl);
  
  gt <- renderD3Table({table_1})
  
  output$test <- gt
      
  output$downloadData <- downloadHandler(
    filename = "chart.png",
    content = function(file) {
      saveWidget(table_1, "temp.html", selfcontained = TRUE)
      webshot::webshot(url = "temp.html", file = file)    
      }
  )  
})

server <- shinyServer(function(input, output, session) {
  tbl <- readr::read_tsv("data.tsv")

  table_1 <-  D3Table(data = tbl);
  
  gt <- renderD3Table({table_1})
  
  output$test <- gt
  
  install.packages("remotes")
  remotes::install_github("rstudio/webshot2")
  library(webshot2)
  output$downloadData <- downloadHandler(
    filename = "chart.png",
    content = function(file) {
      saveWidget(table_1, "temp.html", selfcontained = TRUE)
      webshot2::webshot(url = "temp.html", file = file)    
      }
  )
})

shinyApp(ui, server)

