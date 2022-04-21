## https://github.com/moldach/scss-shiny
## https://shiny.rstudio.com/articles/packaging-javascript.html
## https://codepen.io/victorfreire/pen/XXzqEr

require('BBmisc')
lib('shiny')
lib('shinyMobile')
lib('sass')

ui <- f7Page(
  tags$head(tags$link(type="text/css", rel="stylesheet", href="www/test21A.css")), 
  includeHTML("www/test21A.html"), 
  includeCSS("www/test21A.css")#, 
  #includeScript('www/test21A.scss')
  #sass(sass_file('www/test21A.scss'), 
  #  'www/test21A.css', 
  #options = sass_options(
  #  output_style = 'compressed',
  #  source_map_embed = TRUE)
  #  )
  )

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)
