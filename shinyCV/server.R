require('BBmisc')
lib('shiny')
lib('shinythemes')
lib('shinydashboard')
lib('shinydashboardPlus')
lib('dashboardthemes')
lib('shinyWidgets')
lib('shinyjs')
lib('memoise')
if(!require('XML')) devtools::install_github('omegahat/XML')
lib('XML')

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
  
  #observeEvent(input$rb == 'en', {
  #  updateTabItems(session, "tabs", selected = "en")
  #})
  #
  #observeEvent(input$rb == 'cn', {
  #  updateTabItems(session, "tabs", selected = "cn")
  #})
  #
  #observeEvent(input$rb == 'tw', {
  #  updateTabItems(session, "tabs", selected = "tw")
  #})
  #
  #observeEvent(input$rb == 'jp', {
  #  updateTabItems(session, "tabs", selected = "jp")
  #})
  
  observe({
    ## https://stackoverflow.com/questions/56064805/displaying-html-file-using-includehtml-in-shiny-is-not-working-with-renderui
    ## https://stackoverflow.com/questions/33020558/embed-iframe-inside-shiny-app
    query <- menus[which(menus$choices == input$rb), 2]
    lnk <<- paste0('https://rpubs.com/englianhu/', query)
    })
    
  output$frame <- renderUI({
    input$rb
    ui_lnk <- tags$iframe(src = lnk, height = 800, width = '100%', frameborder = 0)
    print(ui_lnk)
    ui_lnk
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
  
  #observeEvent(input$rb, {
  #  updateTabItems(session, input$rb,
  #                    selected = input$rb)
  #})
  
  #observeEvent(input$rb, {
    #tbs <- c('en', 'cn', 'tw', 'jp', 'kr', 'de', 'fr', 'it')
  #  newtab <- switch(input$tabs, 
  #                   'en' = 'en', 
  #                   'cn' = 'cn', 
  #                   'tw' = 'tw', 
  #                   'jp' = 'jp', 
  #                   'kr' = 'kr', 
  #                     'de' = 'de', 
  #                   'fr' = 'fr', 
  #                   'it' = 'it')
  #  updateTabItems(session, 'tabs', newtab)#, selected = input$rb)
  #})
  
  #observeEvent(input$rb, {
  #  updatePrettyRadioButtons(
  #    session = session,
  #    inputId = 'rb',
  #    choices = c('en', 'cn', 'tw', 'jp', 'kr', 'de', 'fr', 'it'),
  #    prettyOptions = list(animation = 'pulse', status = 'info', 
  #                         shape = 'curve', status = 'primary', 
  #                         thick = TRUE, width = '100%', 
  #                         bigger = TRUE, icon = icon('registered')))
  #}, ignoreInit = TRUE)
  
})

#shinyApp(server = server, ui = ui)
