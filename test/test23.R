## https://github.com/Gustavogaep/ShinyMobile_Demo/blob/master/app_forum.R
options("rgdal_show_exportToProj4_warnings"="none")

# install.packages("argonR")
# install.packages("argonDash")
# install.packages("shinyWidgets")
# install.packages("rvg")
# install.packages("officer")
# install.packages("esquisse")
# install.packages("readr")

library(shinythemes)
library(readr)

library(shiny)
library(esquisse)
library(rvg)
library(officer)
library(argonR)
library(argonDash)

#install.packages("shinydashboardPlus")
library(shinydashboardPlus)
library(shinydashboard)
library(shinyWidgets)
library(shiny)
library(leaflet)
library(dplyr)
library(tidyr)
library(rgdal)
library(DT)
library(ggplot2)
library(tm)
library(memoise)

# color palettes
library("RColorBrewer")

#Para las estadisticas============================================

#global
#=======

#initialize
library(datasets)
library(ggplot2) 

#==First segment of the map=======================================================================

# I put in "dirmapas" the route where are all the ..
#..required files for the app

dirmapas <- "E:/Consejo-Nacional-de-Educacion/Shinys2020/webweb"
setwd(dirmapas)

#If we want to know our working directory, we write: getwd()

trend_data <- read_csv("trend_data.csv")


# The polygon map (contours)
departamentos<-readOGR(dsn="BAS_LIM_DEPARTAMENTO.shp", layer="BAS_LIM_DEPARTAMENTO")

# Cut out unnecessary columns: 
# We only need the columns 1 "NOMBDEP" and 3 "FIRST_IDDP"

# > w<-read.dbf("BAS_LIM_DEPARTAMENTO.dbf")
# > str(w)

# 'data.frame':	25 obs. of  4 variables:
# $ NOMBDEP   : Factor w/ 25 levels "AMAZONAS","ANCASH",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ COUNT     : int  84 166 80 109 111 127 6 108 94 76 ...
# $ FIRST_IDDP: Factor w/ 25 levels "01","02","03",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ HECTARES  : num  3930647 3596225 2111415 6325589 4350382 ...
# - attr(*, "data_types")= chr [1:4] "C" "N" "C" "N"

# > summary(w)

#  NOMBDEP           COUNT          FIRST_IDDP      HECTARES       
# AMAZONAS : 1   Min.   :  6.00     01   : 1     Min.   :   14141  
# ANCASH   : 1   1st Qu.: 28.00     02   : 1     1st Qu.: 2111415  


departamentos@data<-departamentos@data[,c(1,3)]

# transform to WGS884 reference system 
departamentos<-spTransform(departamentos, CRS("+init=epsg:4326"))

# Find the edges of our map
bounds<-bbox(departamentos)

# Get the income data 
income_long2<-read.csv("income_long2.csv",stringsAsFactors = FALSE, fileEncoding = "latin1")  

  


#===App start==============================================================================





#install.packages("shinyMobile")


library(shiny)
library(shinyMobile)

# with hidden tabs
shinyApp(
  ui <- f7Page(
    title = "shinyMobile",
    #theme = "light",
    
    f7TabLayout(
      
      navbar = f7Navbar(
                        title = "Update Tabs with hidden tab",
                        subtitle = "",
                        hairline = TRUE,
                        shadow = TRUE,
                        bigger = FALSE,
                        transparent = TRUE,
                        theme = "light"
                       ),
      
      
      f7Tabs(
        id = 'tabs',
        animated = TRUE,
        #theme = "light",
        
        # TABLA UNO=============================================================
        
        f7Tab(
              active = TRUE,
              #theme = "light",
              tabName = 'Instrucciones',
              icon = f7Icon("quote_bubble"),
              h1('AQUI VAN LAS EXPLICACIONES'),
              
              
              f7ExpandableCard(
                               id = "card3",
                               #theme = "light",
                               title = enc2utf8("¿Cómo usar el aplicativo?"),
                               image = "https://www.republica.com/retablos-financieros/wp-content/uploads/sites/28/2019/10/internet.jpg",
                               enc2utf8("Los indicadores emblemáticos son..........")
                              ),
              f7ExpandableCard(
                               id = "card3",
                               title = enc2utf8("¿Qué son los indicadores?"),
                               image="https://www.analdex.org/wp-content/uploads/2019/11/Estadisticas.-Archivo.jpg",
                               enc2utf8(
                                        "Los indicadores son....., dentro de estos se destacan
                                        los emblemáticos....."
                                       )
                              )
              
              
              ),
        
        
        # TABLA DOS=============================================================
        f7Tab(
              active = FALSE,
              
              tabName = 'Indicadores',
              icon = f7Icon("graph_square_fill"),
              
              h1(enc2utf8("Propósito 2: Inclusión y Equidad")),
              
              #--------------------------------------------------
              f7Card(
                     title = enc2utf8("Indicador N°9"), 
                     enc2utf8(
                              "Porcentaje de la población de 18 años a más 
                              que señala que en los últimos cinco años se ha 
                              sentido maltratada o ha sufrido un intento de 
                              discriminación."
                             ),
                     br(),
                     br(),
                    
                     enc2utf8(
                              "Niveles de desagregación: Ámbito, nivel de pobreza"
                              ),
                     footer = enc2utf8(
                                       "Encuesta Nacional de Hogares (ENAHO) - INEI, 
                                       Módulo de Gobernabilidad"
                                      )
                  ),
              
              
              f7Button(inputId ='goto', label = 'Mira el indicador 9'),
              #---------------------------------------------------
              
              br(),
              
              #---------------------------------------------------
              f7Card(
                     title = enc2utf8("Indicador N°10"), 
                    
                     enc2utf8(
                              "Porcentaje de hogares que accede al paquete 
                               de agua segura, saneamiento, electricidad 
                               e internet."
                             ),
                     br(),
                     br(),
                    
                     enc2utf8(
                              "Niveles de desagregación: Ámbito, nivel de pobreza"
                             ),
                    
                     footer = enc2utf8(
                                       "Encuesta Nacional de Hogares (ENAHO) - INEI, 
                                        Módulo de Características de la vivienda"
                                      )
                   ),
              
              f7Button(inputId ='goto2', label = 'Mira el indicador 10'),
              #------------------------------------------------------
              
              h1(enc2utf8("Propósito 3: Bienestar Socioemocional")),
              
              #---------------------------------------------------
              f7Card(
                     title = enc2utf8("Indicador N°14"), 
                    
                     enc2utf8(
                              "Porcentaje de niñas y niños de 24 a 71 meses que regula sus emociones 
                               y comportamientos en situaciones de frustración y establecimiento de 
                               límites, según área de residencia."
                            ),
                     br(),
                     br(),
                    
                     enc2utf8(
                              "Niveles de desagregación: Ámbito, nivel de pobreza, nivel 
                               educativo de la madre"
                             ),
                    
                     footer = enc2utf8("Encuesta Demográfica y de Salud Familiar - ENDES - INEI")
                   ),
              
              f7Button(inputId ='goto3', label = 'Mira el indicador 14')
             ),
        
        #---------------------------------------------------
        
        # SEVERAL HIDDEN TABS============================================================
        
        # Hidden table, Indicator 9 ========================
        
        f7Tab(
              tabName = 'Hidden Indicator 9',
              hidden = TRUE,
              #h1('This is a tab that does not appear in the tab menu.Yet, you can still access it.'),
          
          
          
          f7Tabs(
            id = "tabs",
            style = "strong", animated = FALSE, swipeable = TRUE,
            
            f7Tab(
                  tabName = "Series", 
                  icon = f7Icon("graph_square_fill"),
                  active = FALSE,
                  f7Shadow(
                           intensity = 10,
                           hover = TRUE,
                
                  f7Card(
                         title = "Series de tiempo a nivel distrital",
                        
                         fluidPage(
                                   theme = shinytheme("lumen"),
                                   titlePanel("Google Trend Index"),
                                   sidebarLayout(
                                                sidebarPanel(
                                                            
                                                            # Select type of trend to plot  selectInput
                                                            f7Select(
                                                                     inputId = "type", 
                                                                     label = strong("Trend index"),
                                                                     choices = unique(trend_data$type),
                                                                     selected = "travel"
                                                                    ),
                                                            
                                                            # Select date range to be plotted
                                                            dateRangeInput(
                                                                           "date", 
                                                                           strong("Date range"), 
                                                                           start = "2007-01-01", 
                                                                           end = "2017-07-31",
                                                                           min = "2007-01-01", 
                                                                           max = "2017-07-31"
                                                                          ),
                                                            
                                                            
                                                            # Select whether to overlay smooth trend line
                                                            f7checkBox(
                                                                       inputId = "smoother", 
                                                                       label = strong("Overlay smooth trend line"), 
                                                                       value = FALSE
                                                                       ),
                                                            
                                                            # Display only if the smoother is checked
                                                            conditionalPanel(condition = "input.smoother == true",
                                                                             
                                                                             f7Slider(
                                                                                      inputId = "f", 
                                                                                      label = "Smoother span:",
                                                                                      min = 0.01, max = 1, value = 0.67, step = 0.01
                                                                                      ),
                                                                             HTML("Higher values give more smoothness.")
                                                                            )
                                                            ),
                                                
                                                # Output: Description, lineplot, and reference
                                                
                                                mainPanel(
                                                          plotOutput(
                                                                     outputId = "lineplot", 
                                                                     height = "300px"
                                                                    ),
                                                          
                                                          tags$a(
                                                                 href = "https://www.google.com/finance/domestic_trends", 
                                                                 "Source: Google Domestic Trends", 
                                                                 target = "_blank"
                                                                 )
                                                         )
                                                 )
                                   )
                        
                        
                        )
              )
              
            ),
            
            
            f7Tab(
                  tabName = "Mapa",
                  icon = f7Icon("map"),
                  active = FALSE,
                  f7Shadow(
                           intensity = 10,
                           hover = TRUE,
                           f7Card(
                                  fluidPage(     
                                            #Una columna se divide en dos cajas (box), 
                                            #en la superior el grafico del mapa...
                                            #..en la inferior la tabla de resultados
                                            #=========================================  
                    
                                            #9, EL MAXIMO NIVEL DE COLUMNA ES 12
                                            column(width = 12,
                                                   
                                                   #Cajon que corresponde al grafico del mapa
                                                   #=========================================
                                                   
                                                   box(width = NULL, solidHeader = TRUE,
                                                       leafletOutput("peruMap", height=400)),
                                                   
                                                   # Cajoncito pequenho donde selecciono primero el 
                                                   # "Grupo Etario" y luego el "tipo de evento"
                                                   #================================================
                                                   
                                                   #3, EL MAXIMO NIVEL DE COLUMNA ES 12
                                                   column(width=12,
                                                          
                                                          box(width=NULL, 
                                                              
                                                              #La lista desplegable de los grupos etarios
                                                              #==========================================
                                                              
                                                              uiOutput("etarioSelect"),
                                                              
                                                              #Los botoncitos que indican el tipo de Evento, son tres tipos de eventos
                                                              #=======================================================================
                                                              
                                                              f7Radio(
                                                                inputId = "meas", 
                                                                label="Aspectos a observar",
                                                                choices=c("Internet"="Internet", 
                                                                          "Accesibilidad"="Accesibilidad",
                                                                          "Servicios esenciales"="Servicios esenciales"),
                                                                selected="Internet"
                                                              )
                                                          )
                                                   )
  

                                            )
                                       )

                                 )
                            )

              
                 ),
            f7Tab(
                  tabName = "Cuadro",
                  #icon = f7Icon("cloud_upload"),
                  icon = f7Icon ("fas fa-table"),
                  active = FALSE,
                  #-------------------------------------------------------------------------------
                  
                  f7Shadow(
                           intensity=10,
                           hover=TRUE,
                           f7Card(   
                                  fluidPage(
                                            column(width=12,
                                                   #Box that corresponds to the table
                                                   #=================================
                                               
                                                   box(
                                                       width=NULL,
                                                       dataTableOutput("departamentoTable")
                                                       ) 
                                                   )
                                            )
                                  )
                           )
                  #--------------------------------------------------------------------------------
  
                )
            )
          
          
          
        ),
        
        # Hidden table, Indicator 10 ===================================
        f7Tab(
              tabName = 'Hidden Indicator 10',
              hidden = TRUE,
              h1('Here are the series, map and chart of the indicator 10')
             ),
        
        
        # Hidden table, Indicator 14 ====================================
        f7Tab(
              tabName = 'Hidden Indicator 14',
              hidden = TRUE,
              h1('Here are the series, map and chart of the indicator 14')
             )
      )
    )
  ),
  
  server = function(input, output, session) {
    observe(print(input$tabs))
    
    observeEvent(input$goto,{
                             updateF7Tabs(
                                          session = session, 
                                          id = 'tabs', 
                                          selected = 'Hidden Indicator 9'
                                         )
                })
    
    # Subset data
    
    selected_trends <- reactive({
                                 req(input$date)
                                 validate(
                                          need(
                                              !is.na(input$date[1]) & !is.na(input$date[2]), 
                                              "Error: Please provide both a start and an end date."
                                              )
                                        )
                                 validate(
                                         need(
                                              input$date[1] < input$date[2], 
                                              "Error: Start date should be earlier than end date."
                                             )
                                        )
                                 trend_data %>%
                                 filter(
                                        type == input$type,
                                        date > as.POSIXct(input$date[1]) & date < as.POSIXct(input$date[2])
                                       )
                                })
    
    
    # Create scatterplot object the plotOutput function is expecting
    
    output$lineplot <- renderPlot({
                                  #434343 = negro
                                  color = "#7B1C8E"
                                  par(mar = c(4, 4, 1, 1))
                                  plot(
                                       x = selected_trends()$date, 
                                       y = selected_trends()$close, 
                                       type = "l",
                                       xlab = "Date", 
                                       ylab = "Trend index", 
                                       col = color, 
                                       fg = color, 
                                       col.lab = color, 
                                       col.axis = color
                                      )
                                  
                                  # Display only if smoother is checked
                                  if(input$smoother){
                                                     smooth_curve <- lowess(
                                                                            x = as.numeric(selected_trends()$date), 
                                                                            y = selected_trends()$close, 
                                                                            f = input$f
                                                                            )
                                                    lines(
                                                          smooth_curve, 
                                                          col = "#E6553A", 
                                                          lwd = 3
                                                          )
                                                    }
                                })                                 
    
    
    
    
    #====Segmento del Map==========================================================================================================
    
    
    getDataSet<-reactive({
      
      # Get a subset of the income data which is contingent on the input variables..
      #...meas es simplemente el ID de las botoncitos de bolita
      
      dataSet<-income_long2[income_long2$Etario==input$dataEtario & income_long2$Measure==input$meas,]  
      
      # Copy our GIS data
      joinedDataset<-departamentos
      
      # Join the two datasets together
      joinedDataset@data <- suppressWarnings(left_join(joinedDataset@data, dataSet, by="NOMBDEP"))
      
      
      joinedDataset
      
    })
    
    
    # Due to use of leafletProxy below, this should only be called once...
    
    
    output$peruMap<-renderLeaflet({
                                  leaflet() %>%
                                    addTiles() %>%
                                    
                                    # Centre the map in the middle of our co-ordinates
                                    setView(mean(bounds[1,]),
                                            mean(bounds[2,]),
                                            zoom=5 
                                           )       
                                  })
    
    
    observe({
      theData<-getDataSet() 
      
      # n too large, allowed maximum for palette YlGn is 9
      # I WOULD LIKE A LARGE RANGE OF COLORS, BUT IF I PUT...
      #..n GREATER THAN THREE, MY MAP WILL RUN OUT OF COLOR
      pal <- colorQuantile("YlGn", theData$Porcentaje, n = 3) 
      
      
      # set text for the clickable popup labels
      
      departamento_popup <- paste0(
        enc2utf8("<strong>Región: </strong>"), 
        theData$NOMBDEP, 
        "<br><strong>",input$meas,"- Esperado: </strong>",formatC(theData$Cantidad_Esperada, format="d", big.mark=' '),
        "<br><strong>",input$meas,"- Real: </strong>",formatC(theData$Cantidad_Realizada, format="d", big.mark=' '),
        "<br><strong>",input$meas,"- Porcentaje: </strong>",formatC(theData$Porcentaje, format="d", big.mark=' ')
                                  )
      
      
      # If the data changes, the polygons are cleared and redrawn, however, the map (above) is not redrawn
      
      leafletProxy("peruMap", data = theData) %>%
        clearShapes() %>%
        addPolygons(
                    data = theData,
                    fillColor = pal(theData$Porcentaje), 
                    fillOpacity = 0.8, 
                    color = "#BDBDC3", 
                    weight = 2,
                    popup = departamento_popup
                    )  
      
    })
    
    
    #********************************************************************            
    
    # table of results, rendered using data table
    #================================================
    
    output$departamentoTable <- renderDataTable(
      
      datatable({
                 dataSet<-getDataSet()
                
                 # Just get name and value columns
                 dataSet<-dataSet@data[,c(1,6)] 
                
                 names(dataSet)<-c("Region",paste0(input$meas," %"))
                
                 dataSet
                },
              
                options = list(lengthMenu = c(5, 10, 25), pageLength = 25)
               )
        )
    
    #************************************************************************         
    
    
    
    # Corresponds to age groups "dataEtario"
    #=====================================================================
    
    output$etarioSelect<-renderUI({
      
      etarioRange<-sort(
                        unique(as.factor(income_long2$Etario)), 
                        decreasing=TRUE
                        )
      
      f7Select(
               inputId = "dataEtario",
               label = "Grupo etario",
               choices = enc2utf8(
                                  #LA IZQUIERDA ES LO QUE SE VE, DERECHA ES LO QUE SE LE ASIGNA
                                  c(
                                    "Primera infancia"="Primera infancia",
                                    "Niñez"="Niñez",
                                    "Adolescencia"="Adolescencia",
                                    "Juventud"="Juventud",
                                    "Adultez"="Adultez",
                                    "Adultez mayor"="Adultez mayor"
                                   )
                                 )
              )
      
    })
    
    
    #==Fin del segmento mapita=========================================================================
    
    
    
    observeEvent(input$goto2,{
                              updateF7Tabs(
                                           session = session, 
                                           id = 'tabs', 
                                           selected = 'Hidden Indicator 10'
                                           )
                })
    
    observeEvent(input$goto3,{
                              updateF7Tabs(
                                           session = session, 
                                           id = 'tabs', 
                                           selected = 'Hidden Indicator 14'
                                           )
                })

  }
)