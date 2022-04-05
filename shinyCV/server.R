require('BBmisc')
lib('shiny')
lib('shinythemes')
lib('shinydashboard')
lib('shinydashboardPlus')
lib('bs4Dash')
lib('dashboardthemes')
lib('shinyWidgets')
lib('shinyjs')
lib('memoise')
if(!require('XML')) devtools::install_github('omegahat/XML')
lib('XML')

conflict_prefer('dashboardPage', 'shinydashboardPlus')
conflict_prefer('dashboardHeader', 'shinydashboardPlus')
conflict_prefer('dashboardSidebar', 'shinydashboardPlus')
conflict_prefer('sidebarMenu', 'shinydashboard')
conflict_prefer('menuItem', 'shinydashboard')
conflict_prefer('menuSubItem', 'shinydashboard')
conflict_prefer('dashboardBody', 'shinydashboard')
conflict_prefer('tabItems', 'shinydashboard')
conflict_prefer('tabItem', 'shinydashboard')
conflict_prefer('dashboardFooter', 'shinydashboardPlus')
conflict_prefer('box', 'shinydashboardPlus')
conflict_prefer('updateTabItems', 'shinydashboard')


server <- shinyServer(function(input, output, session) {
  
  #observe({
    ## https://stackoverflow.com/questions/56064805/displaying-html-file-using-includehtml-in-shiny-is-not-working-with-renderui
    ## https://stackoverflow.com/questions/33020558/embed-iframe-inside-shiny-app
  #  query <- menus[which(menus$choices == input$rb), 2]
  #  lnk <<- paste0('https://rpubs.com/englianhu/', query)
  #  })
    
  #output$frame <- renderUI({
  #  input$rb
  #  ui_lnk <- tags$iframe(src = lnk, height = 800, width = '100%', frameborder = 0)
  #  print(ui_lnk)
  #  ui_lnk
  #})
  
  observeEvent(input$rb, {
    updateTabItems(session, 'tabs', selected = input$rb)
  })

  output$ryo_en <- renderUI(includeHTML('www/ryo-en.html'))
  output$ryo_cn <- renderUI(includeHTML('www/ryo-cn.html'))
  output$ryo_tw <- renderUI(includeHTML('www/ryo-tw.html'))
  output$ryo_jp <- renderUI(includeHTML('www/ryo-jp.html'))
  output$ryo_kr <- renderUI(includeHTML('www/ryo-kr.html'))
  output$ryo_gr <- renderUI(includeHTML('www/ryo-gr.html'))
  output$ryo_de <- renderUI(includeHTML('www/ryo-de.html'))
  output$ryo_fr <- renderUI(includeHTML('www/ryo-fr.html'))
  output$ryo_it <- renderUI(includeHTML('www/ryo-it.html'))
  
  observeEvent(input$tabs, {
    updatePrettyRadioButtons(session, 'rb', selected = input$tabs)
  })

})


shinyApp(ui = ui, server = server)
#runApp(app.R, display.mode = 'showcase')

