library(shiny)
library(bs4Dash)
library(echarts4r)
library(data.table)

conflict_prefer("box", "bs4Dash")

df = data.frame(name=c('A','B','C'),
                color = c('blue','white','green'),
                atr1 = c(34,45,32),
                atr2 = c(56,32,21),
                atr3 = c(23,45,21))

# UI

ui = dashboardPage(
  title = "Example radar plot",
  header = dashboardHeader(
    title = dashboardBrand(
      title = "radarchart test",
      color = "primary"
    )),

  sidebar = dashboardSidebar(
    selectizeInput('sel1','name',choices = NULL),
    selectizeInput('sel2','color',choices = NULL)
    ),
  body = dashboardBody(
      box(echarts4rOutput("radar"))
)
)

# SERVER

server = function(input, output, session) {
  
#Filter update
  updateSelectizeInput(session, 'sel1', choices = sort(unique(df$name)),selected = "A" ,server = TRUE)
  
  observeEvent(input$sel1, {
    updateSelectInput(session, inputId = "sel2", label="color",
                      choices = df[df$name==input$sel1,]$color)
  })
  
  #Table creation to use in radarplot
  dataradar = reactive({
    dataradar = df[df$name==input$sel1 & df$color == input$sel2, c('atr1','atr2','atr3')]
    dataradar = data.table(dataradar)
    dataradar = melt(dataradar, measure.vars = c(names(dataradar))) 
  })
  

  #radar plot
  output$radar = renderEcharts4r({
    plot = dataradar() %>%
      e_charts(variable)  %>%
      e_radar(value) 
    plot
  })
  
}

shinyApp(ui,server)
