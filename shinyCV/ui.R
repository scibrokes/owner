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

### creating custom logo object
logo <- shinyDashboardLogoDIY(
  boldText = 'ξηg', 
  mainText = 'Lιαη Ημ', 
  textSize = 16, 
  badgeText = '🐉 ®γσ', 
  badgeTextColor = 'white', 
  badgeTextSize = 2, 
  badgeBackColor = "#40E0D0", 
  badgeBorderRadius = 3)

alignCenter <- memoise(function(el) {
  htmltools::tagAppendAttributes(el, style="width:500vw;height:100vh;background-color:#fff;display:flex;align-items:center;justify-content:center;")
})

ui <- shinyUI(
  shinydashboardPlus::dashboardPage(#skin = 'midnight', 
    header = shinydashboardPlus::dashboardHeader(title = logo),
    
    sidebar = shinydashboardPlus::dashboardSidebar(
      minified = TRUE, collapsed = FALSE, 
      sidebarMenu(
        id = 'tabs', 
        menuItem('®️Studio ☁️', tabName = 'menu', 
                 ## https://getbootstrap.com/docs/3.4/components/#glyphicons
                ## https://fontawesome.com/icons 
                icon = icon('fa-brand fa-linux'), startExpanded = TRUE, 
                menuSubItem('🏠 Home', tabName = 'home'),
                menuSubItem('🇬🇧 ENGLISH', tabName = 'en'), 
                menuSubItem('🇨🇳 简体中文', tabName = 'cn'), 
                menuSubItem('🇹🇼 繁体中文', tabName = 'tw'),
                menuSubItem('🇯🇵 日本語', tabName = 'jp'),
                menuSubItem('🇰🇷 한국어', tabName = 'kr'),
                menuSubItem('🇩🇪 Deutsch', tabName = 'de'),
                menuSubItem('🇫🇷 français', tabName = 'fr'),
                menuSubItem('🇮🇹 Italiano', tabName = 'it'))#, 
        #menuItem('Appendices', icon = icon('th'), tabName = 'append', 
        #         menuSubItem('Author', tabName = 'author'))
        )), 
    
    body = dashboardBody(
      shinyDashboardThemes(theme = 'blue_gradient'), 
      tabItems(
        tabItem(tabName = 'home', h2('®️Studio ☁️', align = 'center'), alignCenter(
          prettyRadioButtons(
            inputId = 'rb', label = NULL, 
            choices = c('🇬🇧 ENGLISH' = 'en',
                        '🇨🇳 简体中文' = 'cn', 
                        '🇹🇼 繁体中文' = 'tw', 
                        '🇯🇵 日本語' = 'jp', 
                        '🇰🇷 한국어' = 'kr', 
                        '🇩🇪 Deutsch' = 'de', 
                        '🇫🇷 Français' = 'fr', 
                        '🇮🇹 Italiano' = 'it'), 
            shape = 'curve', animation = 'pulse', 
            selected = character(0), status = 'primary', 
            thick = TRUE, width = '100%', bigger = TRUE, 
            icon = icon('registered')))
          ), 
        tabItem(tabName = 'en', h2('🇬🇧 ENGLISH', align = 'center'), 
                tags$iframe(src = 'http://rpubs.com/englianhu/ryo-en', 
                            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-en.html')), 
                #fluidPage(includeHTML('www/ryo-en.html'))
                ), 
        tabItem(tabName = 'cn', h2('🇨🇳 简体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-cn', 
                #            height = 800, width = '100%', frameborder = 0), 
                #HTML(readLines('www/ryo-cn.html')), 
                fluidPage(includeHTML('www/ryo-cn.html'))), 
        tabItem(tabName = 'tw', h2('🇹🇼 繁体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-tw', 
                #            height = 800, width = '100%', frameborder = 0), 
                #HTML(readLines('www/ryo-tw.html')), 
                fluidPage(includeHTML('www/ryo-tw.html'))), 
        tabItem(tabName = 'jp', h2('🇯🇵 日本語', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-jp', 
                #            height = 800, width = '100%', frameborder = 0), 
                #HTML(readLines('www/ryo-jp.html')), 
                fluidPage(includeHTML('www/ryo-jp.html'))),
        tabItem(tabName = 'kr', h2('🇰🇷 한국어', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-kr', 
                #            height = 800, width = '100%', frameborder = 0), 
                #HTML(readLines('www/ryo-kr.html')), 
                #fluidPage(includeHTML('www/ryo-kr.html'))
                ), 
        tabItem(tabName = 'de', h2('🇩🇪 Deutsch', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-de', 
                #            height = 800, width = '100%', frameborder = 0), 
                #HTML(readLines('www/ryo-de.html')), 
                #fluidPage(includeHTML('www/ryo-de.html'))
                ), 
        tabItem(tabName = 'fr', h2('🇫🇷 Français', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-fr', 
                #            height = 800, width = '100%', frameborder = 0), 
                #HTML(readLines('www/ryo-fr.html')), 
                #fluidPage(includeHTML('www/ryo-fr.html'))
                ), 
        tabItem(tabName = 'it', h2('🇮🇹 Italiano', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-fr', 
                #            height = 800, width = '100%', frameborder = 0), 
                #HTML(readLines('www/ryo-fr.html')), 
                #fluidPage(includeHTML('www/ryo-fr.html'))
                ))), 
  
  footer = shinydashboardPlus::dashboardFooter(
    p('Powered by - Copyright® Intellectual Property Rights of ', 
      tags$a(href='https://www.scibrokes.com', target = '_blank', 
             tags$img(height = '20px', alt = 'scibrokes', #align='right', 
                      src='www/Scibrokes.png')), 
      HTML("<a href='https://www.scibrokes.com'>Sςιβrοκεrs Trαdιηg®</a>"))), 
  title = 'DashboardPage'))

#shinyApp(server = server, ui = ui)
