## 
## https://github.com/jbkunst/highcharter/issues/151#issuecomment-235330873
## 

library(shiny)
library(highcharter)
library(rmarkdown)

ui <- shinyUI(fluidPage(

  # Application title
  titlePanel("Gauge Issue"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      downloadButton("download", label = "Download self-contained = TRUE"), br(), br(),
      downloadButton("download2", label = "Download self-contained = FALSE")
    ),

    # Show a plot of the generated distribution
    mainPanel(

    )
  )
))

library(shiny)

server <- shinyServer(function(input, output, session) {

  costGaugePDF <- function(data) {
    data = data
    dataLabel <- paste0("<div>$", format(data$county, big.mark = ","), "</div><div 
                        style='color:#F5892E; font-weight:normal; font-size:12px; 
                        padding-left: 16pt;'>$", format(data$california, big.mark = ","), "</div>")

    highchart() %>% 
      hc_chart(
        type = "solidgauge",
        backgroundColor = "#F5F5F5",
        margin = list(0,0,0,0),
        height = 165,
        width = 330
      ) %>% 
      hc_pane(
        startAngle = -90,
        endAngle = 90,
        size = "198%",
        center = list("50%", "100%"),
        background = list(
          list(
            outerRadius = '100%',
            innerRadius = '70%',
            backgroundColor = JS("Highcharts.Color('#FFFFFF').setOpacity(1).get()"),
            borderWidth =  1,
            shape = "arc"
          )
        )
      ) %>%
      hc_tooltip(
        enabled = FALSE
      ) %>%
      hc_yAxis(
        title = list(
          text = "Estimated Cost of Living",
          y = 70
        ),
        lineWidth = 0,
        title = list(y = -30),
        min = data$min,
        max = data$max,
        labels = list(
          style = "{'color':'#000000', 'font-weight':'bold'}"
        )
      ) %>%
      hc_plotOptions(
        solidgauge = list(
          dataLabels = list(
            enabled = TRUE,
            format = dataLabel,
            borderWidth = 0,
            y = -80,
            style = list(
              fontSize = "20px",
              color = "#398FE2"),
            useHTML = TRUE
          ),
          stickyTracking = TRUE,
          animation = FALSE
        )
      ) %>%
      hc_add_series(
        name = "State",
        data = list(list(
          y = data$california,
          innerRadius = "70%",
          radius = "86%",
          color = "#F49F57"
        ))
      ) %>%
      hc_add_series(
        name = "County",
        data = list(list(
          y = data$county,
          innerRadius = '85%',
          outerRadius = '100%',
          color = '#60A5E7'
        ))
      ) %>%
      hc_legend(
        align = "center",
        verticalAlign = "top",
        enabled = TRUE
      )

  }


  output$download <- downloadHandler(
    filename = function() {
      paste0("gauge.html")
    },
    content = function(file) {
      data <- list(
        min = 10000,
        max = 24000,
        california = 21234,
        county = 18000
      )
      gauge <- costGaugePDF(data = data)

      htmlwidgets::saveWidget(gauge, file = "gauge.html", selfcontained = TRUE)

      file.copy('gauge.html', file)

    })

  output$download2 <- downloadHandler(
    filename = function() {
      paste0("gauge.html")
    },
    content = function(file) {
      data <- list(
        min = 10000,
        max = 24000,
        california = 21234,
        county = 18000
      )
      gauge <- costGaugePDF(data = data)

      htmlwidgets::saveWidget(gauge, file = "gauge.html", selfcontained = FALSE)

      file.copy('gauge.html', file)

    })

})

shinyApp(ui=ui, server=server)
