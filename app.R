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

conflict_prefer('dashboardPage', 'shinydashboardPlus')
conflict_prefer('dashboardHeader', 'shinydashboardPlus')
conflict_prefer('dashboardSidebar', 'shinydashboardPlus')
conflict_prefer('dashboardFooter', 'shinydashboardPlus')
conflict_prefer('box', 'shinydashboardPlus')

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
  
  #fluidPage(
  ## https://dreamrs.github.io/shinyWidgets/reference/setBackgroundColor.html
  # use a gradient in background
  #  setBackgroundColor(
  #    color = c('#2171B5', '#F7FBFF'),
  #    gradient = 'radial',
  #    direction = c('top', 'left')
  #    ),
  #...)
  #
  dashboardPage(#skin = 'midnight', 
    header = dashboardHeader(title = logo),
    
    sidebar = dashboardSidebar(
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
      
      ## https://stackoverflow.com/questions/52198452/how-to-change-the-background-color-of-the-shiny-dashboard-body
      tags$head(tags$style(HTML('
            /* logo */
            /* .skin-blue .main-header .logo { */
            /* background-color: #f4b943; */
            /* } */
            
            /* logo when hovered */
            .skin-blue .main-header .logo:hover {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155deg, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
            /*   &:hover{ */
            /*     background: linear-gradient(155deg, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* navbar (rest of the header) */
            .skin-blue .main-header .navbar {
            /* background-color: #f4b943; */
            /* color: #FFD64D; */
            background: linear-gradient(155deg, #146275 0%, #33A8C4 100%);
            /* transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155deg, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* main sidebar */
            /* .skin-blue .main-sidebar { */
            /* background-color: #f4b943; */
            /* } */
            
            /* active selected tab in the sidebarmenu */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{ */
            /* background-color: #ff0000; */
            /* background: linear-gradient(155deg, #146275 0%, #33A8C4 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155deg, #146275 20%, #33A8C4 80%); */
            /*   } */
            /* } */
            
            /* other links in the sidebarmenu */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu a{ */
            /* background-color: #00ff00; */
            /* color: #000000; */
            /* } */
            
            /* other links in the sidebarmenu when hovered */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{ */
            /* background-color: #FFD64D; */
            /* color: #FFD64D; */
            /* } */
            
            /* toggle button when hovered  */
            .skin-blue .main-header .navbar .sidebar-toggle:hover{
            /* background-color: #FFD64D; */
              color: #FFD64D;
              background: linear-gradient(155deg, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
            /*   &:hover{ */
            /*     background: linear-gradient(155deg, #002C54 20%, #4CB5F5 80%); */
            /*     } */
            }
            
            /* body */
            .content-wrapper, .right-side {
              background-color: #7DA2D1;
            }
            '))), 
      
      tabItems(
        tabItem(tabName = 'home', h2('®️Studio ☁️', align = 'center'),
                alignCenter(
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
                    icon = icon('registered'))
                )
        ), 
        tabItem(tabName = 'en', h2('🇬🇧 ENGLISH', align = 'center'), 
                #tags$iframe(src = 'http://rpubs.com/englianhu/ryo-en', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-en.html'))#, 
                #includeHTML('www/ryo-en.html')#,
                htmlOutput('ryo_en')
        ), 
        tabItem(tabName = 'cn', h2('🇨🇳 简体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-cn', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-cn.html'))#, 
                #includeHTML('www/ryo-cn.html')#,
                htmlOutput('ryo_cn')
        ), 
        tabItem(tabName = 'tw', h2('🇹🇼 繁体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-tw', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-tw.html'))#, 
                #includeHTML('www/ryo-tw.html')#,
                htmlOutput('ryo_tw')
        ), 
        tabItem(tabName = 'jp', h2('🇯🇵 日本語', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-jp', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-jp.html'))#, 
                #includeHTML('www/ryo-jp.html')#,
                htmlOutput('ryo_jp')
        ), 
        tabItem(tabName = 'kr', h2('🇰🇷 한국어', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-kr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-kr.html'))#, 
                #includeHTML('www/ryo-kr.html')#,
                htmlOutput('ryo_kr')
        ), 
        tabItem(tabName = 'de', h2('🇩🇪 Deutsch', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-de', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-de.html'))#, 
                #includeHTML('www/ryo-de.html')#,
                htmlOutput('ryo_de')
        ), 
        tabItem(tabName = 'fr', h2('🇫🇷 Français', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-fr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-fr.html'))#, 
                #includeHTML('www/ryo-fr.html')#,
                htmlOutput('ryo_fr')
        ), 
        tabItem(tabName = 'it', h2('🇮🇹 Italiano', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-it', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-it.html'))#, 
                #includeHTML('www/ryo-it.html')#,
                htmlOutput('ryo_it')
        )
      )
    ), 
    
    footer = dashboardFooter(
      p('Powered by - Copyright® Intellectual Property Rights of ', 
        tags$a(href='https://www.scibrokes.com', target = '_blank', 
               tags$img(height = '20px', alt = 'scibrokes', #align='right', 
                        src='www/Scibrokes.png')), 
        HTML("<a href='https://www.scibrokes.com'>Sςιβrοκεrs Trαdιηg®</a>"))), 
    title = 'DashboardPage'))



server <- shinyServer(function(input, output, session) {
  ## https://stackoverflow.com/questions/56064805/displaying-html-file-using-includehtml-in-shiny-is-not-working-with-renderui
  output$ryo_en <- renderUI(includeHTML('www/ryo-en.html'))
  output$ryo_cn <- renderUI(includeHTML('www/ryo-cn.html'))
  output$ryo_tw <- renderUI(includeHTML('www/ryo-tw.html'))
  output$ryo_jp <- renderUI(includeHTML('www/ryo-jp.html'))
  #output$ryo_kr <- renderUI(includeHTML('www/ryo-kr.html'))
  #output$ryo_de <- renderUI(includeHTML('www/ryo-de.html'))
  #output$ryo_fr <- renderUI(includeHTML('www/ryo-fr.html'))
  #output$ryo_it <- renderUI(includeHTML('www/ryo-it.html'))
})



shinyApp(ui, server)

