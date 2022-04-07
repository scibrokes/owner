library(shiny)

server <- shinyServer(function(input, output, session) {

  # Listens for click from element with ID=chck_file
  observeEvent(input$chck_file,{
    # Check if file exists
    if ( file.exists( isolate({input$fname}) ) ){
      # Display text
      output$text <- renderText({ paste("File exists in: ",getwd(),sep="") })
    }
    else{
      output$text <- renderText({ paste("No such file in: ",getwd(),sep="") })
    }
  })

  # Listens for click from element with ID=create_file
  observeEvent(input$create_file,{
    # Create file
    file.create(isolate({input$fname}))
  })
})

ui <- shinyUI(fluidPage(
  textInput("fname","File name: ",value="myfile.txt"),
  verbatimTextOutput("text"),
  actionButton("chck_file", "Check for file"),
  actionButton("create_file", "Create file")
))

shinyApp(ui = ui, server = server)
