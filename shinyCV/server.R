require('shiny')
require('shinythemes')
require('shinydashboard')
require('dashboardthemes')
require('shinyWidgets')
require('shinyjs')

server <- shinyServer(function(input, output, session) {
  
  #output$cv_page <- renderUI({
  #  
  #  page = switch(input$rb, 
  #                en = 'ryo-en.html',
  #                cn = 'ryo-cn.html',
  #                tw = 'ryo-tw.html',
  #                jp = 'ryo-jp.html')
  #  
    #HTML(markdown::markdownToHTML('ryo-en.md'))
    #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
  #  includeHTML(page)
  #})
  
  observeEvent(input$rb, {
    newtab <- switch(input$tabs,
                     "home" = "home",
                     "eng" = "eng", 
                     "chn" = "chn",
                     "twn" = "twn", 
                     "jpn" = "jpn",
                     "author" = "author")
    updateTabItems(session, "tabs", newtab)
  })
  
  #observeEvent(input$rb == 'en', {
  #  updateTabItems(session, "home",
  #                    selected = "eng")
  #})
  
  #observeEvent(input$rb == 'cn', {
  #  updateTabItems(session, "home",
  #                    selected = "chn")
  #})
  
  #observeEvent(input$rb == 'tw', {
  #  updateTabItems(session, "home",
  #                    selected = "twn")
  #})
  
  #observeEvent(input$rb == 'jp', {
  #  updateTabItems(session, "home",
  #                    selected = "jpn")
  #})
  
  output$ryo_en <- renderUI({
    #HTML(markdown::markdownToHTML('ryo-en.md'))
    #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
    includeHTML("ryo-en.html")
  })
  
  output$ryo_cn <- renderUI({
    #HTML(markdown::markdownToHTML('ryo-en.md'))
    #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
    includeHTML("ryo-cn.html")
  })
  
  output$ryo_tw <- renderUI({
    #HTML(markdown::markdownToHTML('ryo-en.md'))
    #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
    includeHTML("ryo-tw.html")
  })
  
  output$ryo_jp <- renderUI({
    #HTML(markdown::markdownToHTML('ryo-en.md'))
    #HTML(rmarkdown::render(knit('ryo-en.Rmd')))
    includeHTML("ryo-jp.html")
  })
})

#shinyApp(server = server, ui = ui)
