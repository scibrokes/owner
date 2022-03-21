require('shiny')
require('shinythemes')
require('shinydashboard')
require('dashboardthemes')
require('shinyWidgets')
require('shinyjs')
if(!require('XML')) devtools::install_github('omegahat/XML')
require('XML')

server <- shinyServer(function(input, output, session) {
  
  #observeEvent(input$rb, {
  #       newtab <- switch(input$tabs, 
  #                        "en" = "en", 
  #                        "cn" = "cn", 
  #                        "tw" = "tw", 
  #                        "jp" = "jp")
  #       updateTabItems(session, "tabs", newtab)
  #    })
  
  #output$cv_page <- renderUI({
  #  
  #  page = switch(input$rb, 
  #                en = 'www/ryo-en.html',
  #                cn = 'www/ryo-cn.html',
  #                tw = 'www/ryo-tw.html',
  #                jp = 'www/ryo-jp.html')
  #  
    #HTML(markdown::markdownToHTML('ryo-en.md'))
    #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
  #  includeHTML(page)
  #})
  
  #observeEvent(input$rb, {
  #  newtab <- switch(input$tabs,
  #                   "home" = "home",
  #                   "en" = "en", 
  #                   "cn" = "cn",
  #                   "tw" = "tw", 
  #                   "jp" = "jp",
  #                   "author" = "author")
  #  updateTabItems(session, "tabs", newtab)
  #})
  
  observeEvent(input$rb == 'en', {
    updateTabItems(session, "tabs", selected = "en")
  })
  
  observeEvent(input$rb == 'cn', {
    updateTabItems(session, "tabs", selected = "cn")
  })
  
  observeEvent(input$rb == 'tw', {
    updateTabItems(session, "tabs", selected = "tw")
  })
  
  observeEvent(input$rb == 'jp', {
    updateTabItems(session, "tabs", selected = "jp")
  })
  
  #output$ryo_en <- renderUI({
  #  #HTML(markdown::markdownToHTML('ryo-en.md'))
  #  #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
  #  includeHTML("ryo-en.html")
  #})
  
  #output$ryo_cn <- renderUI({
  #  #HTML(markdown::markdownToHTML('ryo-en.md'))
  #  #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
  #  includeHTML("ryo-cn.html")
  #})
  
  #output$ryo_tw <- renderUI({
  #  #HTML(markdown::markdownToHTML('ryo-en.md'))
  #  #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
  #  includeHTML("ryo-tw.html")
  #})
  
  #output$ryo_jp <- renderUI({
  #  #HTML(markdown::markdownToHTML('ryo-en.md'))
  #  #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
  #  includeHTML("ryo-jp.html")
  #})
})

#shinyApp(server = server, ui = ui)
