require('shiny')
require('shinythemes')
require('shinydashboard')
require('dashboardthemes')
require('shinyWidgets')
require('shinyjs')
require('memoise')
if(!require('XML')) devtools::install_github('omegahat/XML')
require('XML')

### creating custom logo object
my_logo <- shinyDashboardLogoDIY(
  boldText = 'ξηg', 
  mainText = 'Lιαη Ημ', 
  textSize = 16, 
  badgeText = '®γσ', 
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
          #choices = c('ENGLISH' = 'en', 'Chinese (Simplified)' = 'cn', 
          #            'Chinese (Traditional)' = 'tw', 'Japanese' = 'jp'), 
          choices = c('🇬🇧 ENGLISH' = 'en', '🇨🇳 简体中文' = 'cn', 
                      '🇹🇼 繁体中文' = 'tw', '🇯🇵 日本語' = 'jp'), 
          shape = 'curve', bigger = TRUE, animation = 'pulse', 
          selected = character(0), status = 'primary', thick = TRUE, 
          icon = icon('registered'))
        )), 
      tabItem(tabName = 'en', h2('English'), 
              tags$iframe(src = 'https://rpubs.com/englianhu/ryo-en', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'cn', h2('Chinese (Simplified)'), 
              tags$iframe(src = 'https://rpubs.com/englianhu/ryo-cn', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'tw', h2('Chinese (Traditional)'), 
              tags$iframe(src = 'https://rpubs.com/englianhu/ryo-tw', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'jp', h2('Japanese'), 
              tags$iframe(src = 'https://rpubs.com/englianhu/ryo-jp', 
                          height = 800, width = '100%', frameborder = 0)), 
      tabItem(tabName = 'author', h2('Author'), 
              tags$iframe(src = 'https://rpubs.com/englianhu/ryo-eng', 
                          height = 800, width = '100%', frameborder = 0))), 
    br(), 
    p('Powered by - Copyright® Intellectual Property Rights of ', 
      tags$a(href='https://www.scibrokes.com', target = '_blank', 
             tags$img(height = '20px', alt = 'scibrokes', #align='right', 
                      src='www/Scibrokes.png')), 
      HTML("<a href='http://www.scibrokes.com'>Scibrokes®</a>")))))

#shinyApp(server = server, ui = ui)
