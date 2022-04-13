library(tidyverse)
library(shiny)
library(plotly)

conflict_prefer("filter", "dplyr")
conflict_prefer("layout", "plotly")
 
pokemons <- 
read_table('
  name      hp  defense attack sp_attack sp_defense speed
  Bulbasaur 45      49     49        65         65    45
    Ivysaur 60      63     62        80         80    60
   Venusaur 80     123    100       122        120    80
 Charmander 39      43     52        60         50    65
 Charmeleon 58      58     64        80         65    80
  Charizard 78      78    104       159        115   100')



ui <- navbarPage(title = "Pokemon Research",

                 tabPanel(title = "Pokemon Statistics",
                          sidebarPanel(
                              selectInput(inputId = "indv",
                                          label = "Pokemon",
                                          choices = pokemons$name, 
                                          selected = 'Bulbasaur')
                              ),
                          mainPanel(
                              plotlyOutput('radar') #the radar plot
                          )
                          ))

server <- function(input, output, session) {

    output$radar <- renderPlotly({
        pkmn <- filter(pokemons, name == input$indv)
        
        r <- map_dbl(pkmn[, 2:6], ~.x)
        nms <- names(r)
        
        #code to plot the radar
        fig <- plot_ly(
            type = 'scatterpolar',
            r = r,
            theta = nms,
            fill = 'toself',
            mode = 'markers'
        ) 
        fig <- fig %>%
            layout(
                polar = list(
                    radialaxis = list(
                        visible = T,
                        range = c(0,max(r))
                    )
                ),
                showlegend = F
            )
    })
}

shinyApp(ui, server)


