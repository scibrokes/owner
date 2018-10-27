require('shiny')
require('shinythemes')
require('shinydashboard')
require('dashboardthemes')
require('shinyWidgets')
require('shinyjs')
require('memoise')
require('XML')

### creating custom logo object
my_logo <- shinyDashboardLogoDIY(
  boldText = 'ENG', 
  mainText = 'Lian Hu', 
  textSize = 16, 
  badgeText = 'RYO', #'®γσ', 
  badgeTextColor = 'white', 
  badgeTextSize = 2, 
  badgeBackColor = "#40E0D0", 
  badgeBorderRadius = 3)

alignCenter <- memoise(function(el) {
  htmltools::tagAppendAttributes(el, style="width:500vw;height:100vh;background-color:#fff;display:flex;align-items:center;justify-content:center;")
})

ui <- shinyUI(
  dashboardPage(
  dashboardHeader(title = my_logo),
  
  dashboardSidebar(
    sidebarMenu(id = "tabs", 
      menuItem("Home", tabName = "menu", 
               icon = icon("home"), startExpanded = TRUE, 
               menuSubItem("Curriculum Vitae", tabName = "home"),
               menuSubItem("English", tabName = "en"), 
               menuSubItem("Simplified Chinese", tabName = "cn"), 
               menuSubItem("Traditional Chinese", tabName = "tw"),
               menuSubItem("Japanese", tabName = "jp")),
      menuItem("Appendices", icon = icon("th"), tabName = "Appendices", 
               menuSubItem("Author", tabName = "author"))
      )),
  dashboardBody(
    shinyDashboardThemes(theme = 'blue_gradient'), 
    tabItems(
      tabItem(tabName = 'home', alignCenter(
        prettyRadioButtons(
          inputId = 'rb', label = '', 
          choices = c('ENGLISH' = 'en', 'Chinese (Simplified)' = 'cn', 
                      'Chinese (Traditional)' = 'tw', 'Japanese' = 'jp'), 
          #choices = c('ENGLISH' = 'en', '简体中文' = 'cn', 
          #            '繁体中文' = 'tw', '日本語' = 'jp'), 
          shape = 'curve', bigger = TRUE, animation = 'pulse', 
          selected = character(0), status = 'primary', thick = TRUE, 
          icon = icon('registered'))
        )), 
      tabItem(tabName = 'en', h2('English'), 
              tags$iframe(src = 'https://englianhu.github.io/2018/10/ryo-en.html', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'cn', h2('Chinese (Simplified)'), 
              tags$iframe(src = 'https://englianhu.github.io/2018/10/ryo-cn.html', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'tw', h2('Chinese (Traditional)'), 
              tags$iframe(src = 'https://englianhu.github.io/2018/10/ryo-tw.html', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'jp', h2('Japanese'), 
              tags$iframe(src = 'https://englianhu.github.io/2018/10/ryo-jp.html', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'author', h2('Author'), 
              tags$iframe(src = 'https://beta.rstudioconnect.com/content/4351/ryo-eng.html', 
                          height = 800, width = '100%', frameborder = 0))), 
    br(), 
    p('Powered by - Copyright® Intellectual Property Rights of ', 
      tags$a(href='http://www.scibrokes.com', target = '_blank', 
             tags$img(height = '20px', alt = 'scibrokes', #align='right', 
                      src='www/scb_logo.jpg')), 
      HTML("<a href='http://www.scibrokes.com'>Scibrokes®</a>")))))

#shinyApp(server = server, ui = ui)
