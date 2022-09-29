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

#menus <- data.frame(
#  choices = c('🇬🇧 ENGLISH',# = 'en', 
#              '🇨🇳 简体中文',# = 'cn', 
#              '🇹🇼 繁体中文',# = 'tw', 
#              '🇯🇵 日本語',# = 'jp', 
#              '🇰🇷 한국어',# = 'kr', 
#              '🇬🇷 Ελληνικά',# = 'gr', 
#              '🇩🇪 Deutsch',# = 'de', 
#              '🇫🇷 Français',# = 'fr', 
#              '🇮🇹 Italiano'),# = 'it'), 
#  lnk = c('ryo-en', 'ryo-cn', 'ryo-tw', 'ryo-jp', 'ryo-kr', 'ryo-gr', 'ryo-de', 'ryo-fr', 'ryo-it'), 
#  tabItem = c('en', 'cn', 'tw', 'jp', 'kr', 'gr', 'de', 'fr', 'it'))

## Active tab to select radio button in Shiny
## https://www.javacodexamples.com/examples/active-tab-to-select-radio-button-in-shiny
##
rb_choices = list(
  '🇬🇧 ENGLISH' = 'en', 
  '🇨🇳 简体中文' = 'cn', 
  '🇹🇼 繁体中文' = 'tw', 
  '🇯🇵 日本語' = 'jp', 
  '🇰🇷 한국어' = 'kr', 
  '🇬🇷 Ελληνικά' = 'gr', 
  '🇩🇪 Deutsch' = 'de', 
  '🇫🇷 Français' = 'fr', 
  '🇮🇹 Italiano' = 'it')
tabItem_choices = list(
  '🇬🇧 ENGLISH' = 'en', 
  '🇨🇳 简体中文' = 'cn', 
  '🇹🇼 繁体中文' = 'tw', 
  '🇯🇵 日本語' = 'jp', 
  '🇰🇷 한국어' = 'kr', 
  '🇬🇷 Ελληνικά' = 'gr', 
  '🇩🇪 Deutsch' = 'de', 
  '🇫🇷 Français' = 'fr', 
  '🇮🇹 Italiano' = 'it')

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
  htmltools::tagAppendAttributes(el, style = "width:500vw;height:100vh;background-color:#fff;display:flex;align-items:center;justify-content:center;")
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
                 menuSubItem('🇬🇷 Ελληνικά', tabName = 'gr'), 
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
            /* background-color: #F4B943; */
            /* } */
            
            /* logo when hovered */
            .skin-blue .main-header .logo:hover {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* navbar (rest of the header) */
            .skin-blue .main-header .navbar {
            /* background-color: #F4B943; */
            /* color: #FFD64D; */
            background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
            /* transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* main sidebar */
            /* .skin-blue .main-sidebar { */
            /* background-color: #F4B943; */
            /* } */
            
            /* active selected tab in the sidebarmenu */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu .active a { */
            /* background-color: #ff0000; */
            /* background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            /* } */
            
            /* other links in the sidebarmenu */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu a { */
            /* background-color: #00ff00; */
            /* color: #000000; */
            /* } */
            
            /* other links in the sidebarmenu when hovered */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover { */
            /* background-color: #FFD64D; */
            /* color: #FFD64D; */
            /* } */
            
            /* toggle button */
            .skin-blue .main-header .navbar .sidebar-toggle {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%);
              }
            }
            
            /* toggle button when hovered */
            .skin-blue .main-header .navbar .sidebar-toggle:hover {
            /* background-color: #FFD64D; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%);
              }
            }
            
            /* body */
            .content-wrapper, .right-side {
            /* background-color: #7DA2D1; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%);
              }
            }
            
            /* body when hovered */
            .content-wrapper, .right-side, .content-wrapper:hover, .right-side:hover {
            /* background-color: #7DA2D1; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%);
              }
            }
            
            /* footer */
            .skin-blue .main-footer {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%);
              }
            }
            
            /* footer when hovered */
            .skin-blue .main-footer .main-footer:hover {
            /* background-color: #F4B943; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%);
              }
            }
            '))), 
      
      tabItems(
        tabItem(tabName = 'home', h2('®️Studio ☁️', align = 'center'),
                alignCenter(
                  prettyRadioButtons(
                    inputId = 'rb', label = NULL, 
                    choices = rb_choices, #menus$choices, 
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
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'cn', h2('🇨🇳 简体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-cn', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-cn.html'))#, 
                #includeHTML('www/ryo-cn.html')#,
                htmlOutput('ryo_cn')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'tw', h2('🇹🇼 繁体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-tw', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-tw.html'))#, 
                #includeHTML('www/ryo-tw.html')#,
                htmlOutput('ryo_tw')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'jp', h2('🇯🇵 日本語', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-jp', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-jp.html'))#, 
                #includeHTML('www/ryo-jp.html')#,
                htmlOutput('ryo_jp')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'kr', h2('🇰🇷 한국어', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-gr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-gr.html'))#, 
                #includeHTML('www/ryo-gr.html')#,
                htmlOutput('ryo_gr')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'gr', h2('🇬🇷 Ελληνικά', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-kr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-kr.html'))#, 
                #includeHTML('www/ryo-kr.html')#,
                htmlOutput('ryo_kr')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'de', h2('🇩🇪 Deutsch', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-de', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-de.html'))#, 
                #includeHTML('www/ryo-de.html')#,
                htmlOutput('ryo_de')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'fr', h2('🇫🇷 Français', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-fr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-fr.html'))#, 
                #includeHTML('www/ryo-fr.html')#,
                htmlOutput('ryo_fr')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'it', h2('🇮🇹 Italiano', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-it', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('www/ryo-it.html'))#, 
                #includeHTML('www/ryo-it.html')#,
                htmlOutput('ryo_it')
                #htmlOutput('frame')
        )
      )
    ), 
    
    footer = dashboardFooter(
      left = p(
        HTML("<a href='https://www.scibrokes.com'>Sςιβrοκεrs Trαdιηg®</a>"), 
        br(), 
        tags$a(href = 'https://www.scibrokes.com', target = '_blank', 
               tags$img(height = '13px', alt = 'scibrokes', #align = 'right', 
                        #src = 'www/Scibrokes.png')), 
                        src = 'https://raw.githubusercontent.com/scibrokes/owner/master/www/Scibrokes.png')), 
        HTML("<a href='https://www.scibrokes.com'>世博量化®</a>"), 
        '企业知识产权®及版权®所有，盗版必究。', 
        ), 
      right = p(br(), 
                tags$a(href = 'https://www.pku.edu.cn', target = '_blank', 
                tags$img(height = '13px', alt = 'scibrokes', #align = 'right', 
                         #src = 'www/Peking University 02.png')), 
                         src = 'https://raw.githubusercontent.com/scibrokes/owner/master/www/Peking%20University%2002.png')), 
                HTML("<a href='https://www.pku.edu.cn'>北京大学</a>"), 
                '🐉 ®γσ 2022 原著')
      ), 
    title = 'DashboardPage'))


shinyApp(ui = ui, server = server)
#runApp(app.R, display.mode = 'showcase')

