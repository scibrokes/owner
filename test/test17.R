## R shiny renderUI when variable is modified
## https://stackoverflow.com/questions/46543507/r-shiny-renderui-when-variable-is-modified

library(shinydashboard)
library(data.table)
library(dplyr)
library(shinyjs)
library(shinydashboard)
library(shinyTime)
library(shinyBS)
library(knitr)

dbHeader <- dashboardHeader(title = "Scada Visualization")

ui <- dashboardPage(
  dbHeader,
  dashboardSidebar(
    fileInput('scada', "Select the Scada dataframe"),
    hr(),
    selectInput("windTurbine","Select wind Turbine:","All"),
    selectInput("columns","Select Variable:",""),

    sidebarMenu(id='submenu',
                menuItem("Apply Filters",tabName = "filters" ,icon = icon("pencil-square-o"),
                         menuSubItem('Min/Max', tabName = 'limits', selected = FALSE)
                ),
                conditionalPanel(
                  condition = "input.submenu == 'limits'",
                  hr(),
                  fluidRow(
                    column(6,textInput(inputId="minTxt", label="Minimum", value = 0, width='200px')),
                    column(6,textInput(inputId="maxTxt", label="Maximum", value = 10, width='200px'))
                  ),
                  bsButton("filtButton",label = "OK", icon = icon("check-square"), block = F, style = "success")
                )
    )
  ),
  dashboardBody(
    uiOutput("button_ui"),
    tabBox(
      id = "tabBox", height = "850px",width="1600px",
      tabPanel("Data", id ="dataTab", icon = icon("database"),uiOutput("dataUI"))
    )

  ))


server <- function(input, output, session) {

  values <<- reactiveValues(df=NULL)

  dtScada <- reactive({
    if (is.null(input$scada)){
      return(NULL)
    }

    dtScada <- readRDS(input$scada$datapath) 
    updateSelectInput(session, "windTurbine", choices= c("All", as.character(unique(dtScada$nAerogenerador))))
    updateSelectInput(session, "columns", choices = colnames(dtScada))
    dtScada <- as.data.table(dtScada)
    assign("dtScada",dtScada,envir=.GlobalEnv)
    return(dtScada)
  })

  myData <- reactive({
    # If there is no data loaded, return NULL
    if (is.null(dtScada())) return(NULL)
    dtScada <- dtScada()

    if (input$windTurbine != "All"){ 
      dtScada <- as.data.frame(dtScada[dtScada[,nAerogenerador==as.numeric(input$windTurbine)],])
      dtScada <- as.data.table(dtScada)
    }

    assign("dtScada",dtScada,envir=.GlobalEnv)
    return(dtScada)   
  })

  observe({
    if (is.null(myData())) return(NULL)
    isolate(values$df <<- myData())
  })

  output$button_ui <- renderUI({
    tagList(
      bsModal("confLimits", "Apply Limits", trigger = "filtButton", size = "small",
              HTML("Confirm operation?"),
              bsButton("Limyes", label = "Yes", icon = icon("check-square-o"), block = F, style = "success"),
              bsButton("Limno", label = "Cancel", icon = icon("hand-stop-o"), block = F, style = "danger")
      ))
  })

  observeEvent(input$Limyes, {
    dtScada <- values$df
    dataTable <- dtScada[with(dtScada, 
                              get(input$columns) < as.numeric(isolate(input$minTxt)) |
                                get(input$columns) > as.numeric(isolate(input$maxTxt)) ), eval(input$columns) := NA]

    isolate({  
      updateTextInput(session, "minTxt", value = paste(isolate(input$minTxt)))
      updateTextInput(session, "maxTxt", value = paste(isolate(input$maxTxt)))
    })

    isolate(values$df <<- dtScada)
    toggleModal(session, "confLimits", toggle = "close")
    assign("dtScada",dtScada,envir=.GlobalEnv)
  })

  observeEvent(input$Limno, {
    toggleModal(session, "confLimits", toggle = "close")
  })

  output$dataUI <- renderUI({

    if (is.null(values$df)) {return(NULL)}
    else {
      mainPanel(width='100%',
                fluidRow(
                  box(id = "tabBox", width= "90%", heigth = 450, status = "primary",
                      div(style = 'overflow-x: scroll', tableOutput("view")))),
                fluidRow(id = "txtSum", verbatimTextOutput("summary")),
                downloadButton('downloadData', 'Download Data')
      )}
  })

  output$view <- function() {
    paste(knitr::kable(
      head(values$df,n=5), format = 'html', output = FALSE,
      table.attr="class='data table table-bordered table-condensed'",
      digits=2),
      caption=h4("Head of the scada Data"),
      sep = '\n')
  }

  output$summary <- renderPrint(width = "180",{
    summary(values$df)
  })

  session$onSessionEnded(stopApp)

}

runApp(list(ui = ui, server = server))