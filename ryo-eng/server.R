require(shiny)
require(ggplot2)

shinyServer(function(input,output){
  
  output$plot1 <- renderPlot({
    
    out <- ggplot(data.frame(X1=rnorm(input$slider1,input$slider2)),aes(X1))+
      geom_density(fill='light blue')+
      theme_minimal()+
      xlab('X value')+
      ylab('')+
      ggtitle('Distribution of X')+
      theme(
        axis.text.y = element_blank(),
        axis.ticks = element_blank())
    
    print(out)
  })
  output$plot2 <- renderPlot({
    out <- ggplot(data.frame(X1=rnorm(input$slider3,input$slider4)),aes(X1))+
      geom_density(fill='light blue')+
      theme_minimal()+
      xlab('X value')+
      ylab('')+
      ggtitle('Distribution of X')+
      theme(
        axis.text.y = element_blank(),
        axis.ticks = element_blank())
    
    print(out)
  })
  output$plot3 <- renderPlot({
    out <- ggplot(data.frame(X1=rnorm(input$slider5,input$slider6)),aes(X1))+
      geom_density(fill='light blue')+
      theme_minimal()+
      xlab('X value')+
      ylab('')+
      ggtitle('Distribution of X')+
      theme(
        axis.text.y = element_blank(),
        axis.ticks = element_blank())
    
    print(out)
  })
  
  
})