require('shiny')
require('shinythemes')
require('shinydashboard')
require('dashboardthemes')
require('shinyWidgets')

### creating custom logo object
my_logo <- shinyDashboardLogoDIY(
  
  boldText = 'ENG', 
  mainText = 'Lian Hu', 
  textSize = 16, 
  badgeText = '®γσ', 
  badgeTextColor = 'white', 
  badgeTextSize = 2, 
  badgeBackColor = "#40E0D0", 
  badgeBorderRadius = 3)

alignCenter <- function(el) {
  htmltools::tagAppendAttributes(el, style="width:500vw;height:100vh;background-color:#005CB9;display:flex;align-items:center;justify-content:center;")
}

shinyApp(
  ui <- dashboardPage(
    dashboardHeader(title = my_logo),
    
    dashboardSidebar(
      sidebarMenu(
        menuItem("Home", tabName = "home", 
                 icon = icon("dashboard"), startExpanded = TRUE, 
                 menuSubItem("About Me", tabName = "home"),
                 menuSubItem("References", tabName = "cn"), 
                 menuSubItem("Documenting File Creation ", tabName = "en"),
                 menuSubItem("References", tabName = "ccv4")
        ),
        menuItem("Appendices", icon = icon("th"), tabName = "Appendices", 
                 menuSubItem("Documenting File Creation", tabName = "appdx1"),
                 menuSubItem("References", tabName = "appdx2")
        )
      ),
      textInput("txt", "Text input:", "text here"),
      sliderInput("slider", "Slider input:", 1, 100, 30),
      actionButton("action", "Button"),
      actionButton("action2", "Button2", class = "btn-primary"), 
      prettySwitch('test', 'test'), 
      
      menuItem(h4(strong("Curriculum Vitae", align = "center")), tabName = "dashboard"),
      menuItem(h4(strong("Appendices")), tabName = "Appendices"), 
      prettyRadioButtons('option', 'Selection', 
                         choices = c('Curriculum Vitae', 'Appendices', 'Others'), 
                         selected = 'Curriculum Vitae')
    ),
    dashboardBody(
      shinyDashboardThemes(theme = 'blue_gradient'), 
      tags$style(
        type = 'text/css', 
        '.bg-aqua {background-color: #005CB9!important; }'),
      
      ## ui tabs
      tabItems(
        tabItem('home', alignCenter(
          prettyRadioButtons(
            'rb', '', 
            choices = c('ENGLISH', '简体中文', '繁体中文', '日本語'), 
            shape = 'curve', bigger = TRUE, animation = 'pulse', 
            status = 'primary', thick = TRUE, icon = icon('registered'), 
            choiceNames = list(
              HTML("<font color='blue'>English</font>"), 
              tags$span(style = "color:red", "简体中文"), 
              "繁体中文", "日本語")))), 
        tabItem('en', h2('English'), 
                uiOutput('ryo_en')), 
        tabItem('cn', h2('简体中文'), 
                prettyCheckboxGroup(
                  inputId = "checkgroup2", 
                  label = "Click me!", thick = TRUE, 
                  choices = c("Click me !", "Me !", "Or me !"), 
                  animation = "pulse", status = "primary"), 
                uiOutput('ryo_cn')), 
        tabItem('tw', h2('繁体中文'), 
                uiOutput('ryo_tw')), 
        tabItem('jp', h2('日本語'), 
                uiOutput('ryo_jp'))
      )
    )
  ),
  server <- function(input, output) {
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
  }
)

