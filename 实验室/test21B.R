## https://github.com/moldach/scss-shiny
## https://shiny.rstudio.com/articles/packaging-javascript.html
## https://codepen.io/victorfreire/pen/XXzqEr

require('BBmisc')
lib('shiny')
lib('shinyMobile')
lib('sass')

ui <- f7Page(
  includeHTML("www/test21B.html"), 
  includeCSS("www/test21B.css")#, 
  #includeScript('www/test21B.scss')
  #sass(sass_file('www/test21B.scss'), 
  #  'www/test21B.css', 
  #options = sass_options(
  #  output_style = 'compressed',
  #  source_map_embed = TRUE)
  #  )
  )

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)
