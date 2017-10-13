#ui.R
library(shiny)
library(shinydashboard)

header <- dashboardHeader(
  title = 'Simple dashbaord'
)
body <- dashboardBody(
  fluidRow(
    column(width=12,
           tabBox(
             id='tabvals',
             width=NULL,
             tabPanel('ENGLISH',
                      plotOutput('plot1'),value=1),
             tabPanel('日本語',
                      plotOutput('plot2'),value=2),
             tabPanel('简体中文',
                      plotOutput('plot3'),value=3),
             tabPanel('繁體中文',
                      plotOutput('plot3'),value=3)))))

dashboardPage(
  header,
  dashboardSidebar(
    conditionalPanel(
      condition = "input$tabvals == 1",
      sliderInput('slider1','Slider for tab1:',min=1,max=3000,value=30),
      sliderInput('slider2','2nd Slider for tab1:',min=1,max=3000,value=300)
    ),
    conditionalPanel(
      condition = "input$tabvals == 2",
      sliderInput('slider3','Slider for tab2:',min=1,max=1000,value=10), 
      sliderInput('slider4','2nd Slider for tab2:',min=1,max=1000,value=500)
    ),
    conditionalPanel(
      condition = "input$tabvals == 3",
      sliderInput('slider5','Slider for tab3:',min=1,max=3000,value=30),
      sliderInput('slider6','2nd Slider for tab3:',min=1,max=3000,value=30)
    )
  ),
  body
)