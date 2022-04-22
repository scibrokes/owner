# -------------- Load Packages -----------------------------

require('BBmisc')
if(!require('XML')) devtools::install_github('omegahat/XML')
if(!require('runr')) devtools::install_github('yihui/runr')
## https://shi18ny.datasketch.dev
lib('shiny')
conflict_prefer('runExample', 'shiny')
if(!require('shi18ny')) devtools::install_github('datasketch/shi18ny')

## https://yang-tang.github.io/shinyjqui/articles/introduction.html
pkgs <- c('shiny', 'shinythemes', 'shinydashboard', 'shinydashboardPlus', 'memoise', 
  'bs4Dash', 'dashboardthemes', 'shinyWidgets', 'shinyjs', 'shinyBS', 'XML', 'xml2', 
  'htmltools', 'shiny.i18n', 'shi18ny', 'shinyvalidate', 'shinyFeedback', 'shinyMobile', 
  'shinymanager', 'shinyjqui', 'miniUI', 'sass')
lib(pkgs)
#lib(pkgs[1:4])

# -------------- Prefer Conflict -----------------------------

conflict_prefer('dashboardPage', 'shinydashboardPlus')
conflict_prefer('dashboardHeader', 'shinydashboardPlus')
conflict_prefer('dashboardSidebar', 'shinydashboardPlus')
conflict_prefer('sidebarMenu', 'shinydashboard')
conflict_prefer('menuItem', 'shinydashboard')
conflict_prefer('menuSubItem', 'shinydashboard')
conflict_prefer('dashboardBody', 'shinydashboard')
conflict_prefer('tabItems', 'shinydashboard')
conflict_prefer('tabItem', 'shinydashboard')
conflict_prefer('taskItem', 'shinydashboardPlus')
conflict_prefer('messageItem', 'shinydashboardPlus')
conflict_prefer('notificationItem', 'shinydashboardPlus')
conflict_prefer('box', 'shinydashboardPlus')
conflict_prefer('updateTabItems', 'shinydashboard')
conflict_prefer('dashboardFooter', 'shinydashboardPlus')
#conflict_prefer('runExample', 'shiny')
#lib(pkgs)

# -------------- Set Parameters -----------------------------

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

## https://stackoverflow.com/a/50979068/3806250
alignCenter <- memoise(function(el) {
  htmltools::tagAppendAttributes(
    el, style = "
      width:500vw;
      height:100vh;
      background-color: rgba(255, 255, 255, 0.35); /* 35% opaque white */
      padding: 0.25em;
      color: #FFD64D;
      background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
      transition: all 0.45s;
      display:flex;
      flex-wrap: wrap;
      align-items:center;
      justify-content:center;
    ")
})


# -------------- ui -----------------------------

## Dynamic UI in Shiny (incl. demo app)
## https://towardsdatascience.com/dynamic-ui-in-shiny-incl-demo-app-a6fb791be4c6

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
  ## https://rinterface.github.io/shinydashboardPlus/articles/more-skins.html
  dashboardPage(#skin = 'midnight', 
    header = dashboardHeader(title = logo), 
    ## https://stackoverflow.com/a/70093686/3806250
    sidebar = dashboardSidebar(
      minified = TRUE, collapsed = FALSE, 
      ## https://stackoverflow.com/questions/52382832/r-shiny-dashboard-body-dependant-from-shiny-subitem-selection
      ## https://ducthanhnguyen.github.io/MaterialAdminLTE/index3.html
      
      sidebarMenu(
        id = 'sidebarID', 
        menuItem('®️Studio ☁️', tabName = 'menu', 
          ## https://getbootstrap.com/docs/3.4/components/#glyphicons
          ## https://fontawesome.com/icons 
          #badgeLabel = '🚧', badgeColor = 'green', 
          icon = icon('fa-brand fa-linux'), startExpanded = TRUE, 
          menuSubItem('🏠 主页', tabName = 'home'), 
          menuSubItem('🇬🇧 ENGLISH', tabName = 'en'), 
          menuSubItem('🇨🇳 简体中文', tabName = 'cn'), 
          menuSubItem('🇹🇼 繁体中文', tabName = 'tw'), 
          menuSubItem('🇯🇵 日本語', tabName = 'jp'), 
          menuSubItem('🇰🇷 한국어', tabName = 'kr'), 
          menuSubItem('🇬🇷 Ελληνικά', tabName = 'gr'), 
          menuSubItem('🇩🇪 Deutsch', tabName = 'de'), 
          menuSubItem('🇫🇷 français', tabName = 'fr'), 
          menuSubItem('🇮🇹 Italiano', tabName = 'it')), 
        menuItem('附录', tabName = 'append', 
          #badgeLabel = '🚧', badgeColor = 'blue', 
          icon = icon('th'), startExpanded = TRUE, 
          menuSubItem('世博量化®', tabName = 'scbr'), 
          menuSubItem('作者', tabName = 'auth'), 
          menuSubItem('参考文献', tabName = 'refr'))
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
               transition: all 0.45s;
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
            /* background-color: #FF0000; */
            /* background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            /* } */
            
            /* other links in the sidebarmenu */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu a { */
            /* background-color: #00FF00; */
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
            
            /* navbar */
            .navbar-custom-menu {
              /* color: #FFD64D; */
              background-color: transparent;
            }
            
            /* sidebarColumn */
            .sidebarCollapsed {
            /*  position: absolute; */
            /*  top: -25px; */
            /*  padding-top: -50px; */
            }
            .main-sidebar.shiny-bound-input {
            /*  position: absolute; */
            /*  top: 25px; */
            /*  right 25px; */
            /*  padding-top: 30px; */
            /*  padding-right: 30px; */
            }
            
            /* body */
            /* .content-wrapper, .right-side { */
            .content-wrapper {
            /* background-color: #7DA2D1; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
            /*  &:hover{ */
            /*    background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%); */
            /*  } */
            }
            
            /* body when hovered */
            /* .content-wrapper, .right-side, .content-wrapper:hover, .right-side:hover { */
            /*   background-color: #7DA2D1; */
            /*   color: #FFD64D; */
            /*   background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%); */
            /*   } */
            /* } */
            
            /* footer */
            .skin-blue .main-footer {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* footer */
            .pull-right.hidden-xs {
              /* color: #FFD64D; */
              background-color: transparent;
            }
            
            /* footer when hovered */
            /* .skin-blue .main-footer .main-footer:hover { */
            /*   background-color: #F4B943; */
            /*   color: #FFD64D; */
            /*   background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            /* } */
            
            /* ## https://stackoverflow.com/questions/59760316/change-the-color-of-text-in-validate-in-a-shiny-app */
            .shiny-output-error-validation {
            /* background-color: #FFD64D; */
              color: #FF0000;
              font-size: 36px;
              font-weight: bold;
              display:flex;
              align-items:center;
              justify-content:center;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%);
              }
            }
            
            
            @keyframes fade {
  0%, 50% {
    opacity: 0;
    transform: scale(0);
  }
}
@keyframes dot-anim {
  0% {
    top: -4vw;
  }
  50% {
    top: 4vw;
  }
  100% {
    top: -4vw;
  }
}
@keyframes checked-radio-3 {
  0% {
    top: -10vw;
    transform: scale(0);
  }
  100% {
    top: 0;
    transform: scale(1);
  }
}
@keyframes unchecked-radio-3 {
  0% {
    bottom: 0;
    transform: scale(1);
  }
  100% {
    bottom: -10vw;
    transform: scale(0);
  }
}
@keyframes checked-radio-4 {
  0% {
    transform: rotate(0) translateY(-4.8vw) scale(.2);
  }
  83% {
    transform: rotate(360deg) translateY(-2.5vw) scale(1);
    transform-origin: 2vw;
  }
  88% {
    transform: translateY(.6vw) scale(1);
  }
  93% {
    transform: translateY(-.9vw) scale(1);
  }
  100% {
    transform: translateY(0) scale(1);
  }
}
@keyframes checked-radio-5 {
  0% {
    top: -10vw;
    transform: scale(0);
  }
  100% {
    top: 0;
    transform: scale(1);
  }
}
@keyframes unchecked-radio-5 {
  0% {
    bottom: 0;
    transform: scale(1);
  }
  100% {
    bottom: -10vw;
    transform: scale(0);
  }
}
@keyframes checked-radio-6 {
  0% {
    transform: rotate(0) translateY(-4.8vw) scale(.2);
  }
  83% {
    transform: rotate(360deg) translateY(-2.5vw) scale(1);
    transform-origin: 2vw;
  }
  88% {
    transform: translateY(.6vw) scale(1);
  }
  93% {
    transform: translateY(-.9vw) scale(1);
  }
  100% {
    transform: translateY(0) scale(1);
  }
}
@keyframes unchecked-radio-6 {
  25% {
    top: -6.5vw;
  }
  50% {
    top: 9vw;
  }
  75% {
    top: -10vw;
  }
  100% {
    top: -10vw;
    transform: scale(0);
  }
}
@keyframes checked-radio-7 {
  0% {
    top: -10vw;
    transform: scale(0);
  }
  100% {
    top: 0;
    transform: scale(1);
  }
}
@keyframes unchecked-radio-7 {
  0% {
    bottom: 0;
    transform: scale(1);
  }
  100% {
    bottom: -10vw;
    transform: scale(0);
  }
}
@keyframes checked-radio-8 {
  0% {
    transform: rotate(0) translateY(-4.8vw) scale(.2);
  }
  83% {
    transform: rotate(360deg) translateY(-2.5vw) scale(1);
    transform-origin: 2vw;
  }
  88% {
    transform: translateY(.6vw) scale(1);
  }
  93% {
    transform: translateY(-.9vw) scale(1);
  }
  100% {
    transform: translateY(0) scale(1);
  }
}
@keyframes unchecked-radio-8 {
  25% {
    top: -6.5vw;
  }
  50% {
    top: 9vw;
  }
  75% {
    top: -10vw;
  }
  100% {
    top: -10vw;
    transform: scale(0);
  }
}
@keyframes checked-radio-9 {
  0% {
    transform: rotate(0) translateY(-4.8vw) scale(.2);
  }
  83% {
    transform: rotate(360deg) translateY(-2.5vw) scale(1);
    transform-origin: 2vw;
  }
  88% {
    transform: translateY(.6vw) scale(1);
  }
  93% {
    transform: translateY(-.9vw) scale(1);
  }
  100% {
    transform: translateY(0) scale(1);
  }
}
@keyframes unchecked-radio-9 {
  25% {
    top: -6.5vw;
  }
  50% {
    top: 9vw;
  }
  75% {
    top: -10vw;
  }
  100% {
    top: -10vw;
    transform: scale(0);
  }
}

*, *:before, *:after {
  margin: auto;
  padding: 0;
  outline: 0;
  overflow: hidden;
  box-sizing: border-box;
}
html, body {
  /* background: white; */
  background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
  transition: all 0.25s;
  /* background-image: url("file:///home/englianhu/Documents/GitHub/owner/test/www/maths.jpg"); */
}
main, .container, label, label:before, label:after {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
main {
  width: 95vw;
  height: 50vw;
}
.container {
  width: 100%;
  height: 100%;
  animation: fade 1s;
}
label {
  display: inline-block;
  width: 10vw;
  height: 10vw;
  border-radius: 50%;
  transition: all .2s ease-in-out;
  animation-timing-function: ease-in-out;
  animation-iteration-count: infinite;
  animation-duration: 1.6s;
  animation-name: dot-anim;
}
.radio:checked + label {
  animation-play-state: paused;
}
label:before {
  content: "";
  position: absolute;
  width: 5vw;
  height: 5vw;
  background: white;
  border-radius: 50%;
  box-shadow: rgba(0, 0, 0, 0.117647) 0 0 .8vw 0, rgba(0, 0, 0, 0.239216) 0 .8vw .8vw 0;
  transition: all .2s;
}
label:hover:before {
  box-shadow: rgba(0, 0, 0, 0.0784314) 0 0 1vw 0, rgba(0, 0, 0, 0.239216) 0 1vw 1vw 0;
}
label:after {
  content: "";
  position: absolute;
  width: 10vw;
  height: 10vw;
  background: rgba(255, 255, 255, .5);
  border-radius: 50%;
  transform: scale(0);
}
.radio:checked + label:after {
  background: transparent;
  transition: all .5s;
  transform: scale(1);
}
/**** BLUE RED Radio button code ****/
#radio-1 + label {
  left: -80vw;
  bottom: 80vw;
  /* background: #4285F4; */
  color: #FF0000;
  background: linear-gradient(155DEG, #200769 0%, #69B4F5 100%);
  transition: all 0.45s;
  animation-delay: 0s;
}
#radio-1 + label:before {
  /* background: linear-gradient(155DEG, #200769 0%, #69B4F5 100%); */
  /* transition: all 0.45s; */
  transform: scale(0);
}
#radio-1:checked + label:before {
  content: "🇬🇧 \\A ENG";
  white-space: pre; /* or pre-wrap */
  color: #FF0000;
  background: linear-gradient(155DEG, #200769 0%, #69B4F5 100%);
  transition: all 0.45s;
  transform: scale(1);
  transition: all .4s;
}
/**** RED YELLOW radio button code ****/
#radio-2 + label {
  left: -60vw;
  bottom: 60vw;
  /* background: #EA4335; */
  background: linear-gradient(155DEG, #FF0000 0%, #FF8787 100%);
  transition: all 0.45s;
  border-color: #EA4335!important;
  animation-delay: .2s;
}
#radio-2:checked + label {
  background: white;
  border: 1vw solid;
  box-shadow: inset rgba(0, 0, 0, 0.117647) 0 0 .6vw 0, inset rgba(0, 0, 0, 0.239216) 0 .6vw .8vw 0;
  transition: all .2s;
}
#radio-2:checked + label:before {
  width: 5vw;
  height: 5vw;
  content: "🇨🇳 \\A 简";
  white-space: pre; /* or pre-wrap */
  color: #FFBE00;
  /* background: #EA4335; */
  /* transition: all .4s; */
  background: linear-gradient(155DEG, #FF0000 0%, #FF8787 100%);
  transition: all 0.45s;
}
/* for IE */
#radio-2:not(:checked) + label:before {
  width: 8vw;
  height: 8vw;
  /* https://stackoverflow.com/a/17047836/3806250 */
  content: "🇨🇳 \\A 简体中文";
  white-space: pre; /* or pre-wrap */
  color: #FFBE00;
  /* background: #EA4335; */
  background: linear-gradient(155DEG, #FF0000 0%, #FF8787 100%);
  transition: all 0.45s;
  box-shadow: none;
}
/**** RED BLUE radio button code ****/
#radio-3 + label {
  left: -40vw;
  bottom: 40vw;
  color: #E0DFED;
  /* background: #FBBC05; */
  background: linear-gradient(155DEG, #200769 0%, #69B4F5 100%);
  transition: all 0.45s;
  animation-delay: .4s;
}
#radio-3 + label:before {
  /* background: #E91E63; */
  content: "🇹🇼 \\A 繁";
  white-space: pre; /* or pre-wrap */
  color: #E0DFED;
  background: linear-gradient(155DEG, #200769 0%, #69B4F5 100%);
  transition: all 0.45s;
  transform: scale(0);
  animation-name: unchecked-radio-3;
  animation-duration: .2s;
  animation-timing-function: ease-in-out;
}
#radio-3:checked + label:before {
  animation-name: checked-radio-3;
  animation-duration: .4s;
  animation-timing-function: ease-in-out;
  animation-fill-mode: both;
}
/**** RED WHITE radio button code ****/
#radio-4 + label {
  left: -20vw;
  bottom: 20vw;
  /* background: #EA4335; */
  background: linear-gradient(155DEG, #FF0000 0%, #FF8787 100%);
  transition: all 0.45s;
  border-color: #EA4335!important;
  animation-delay: .2s;
}
#radio-4:checked + label {
  background: white;
  border: 1vw solid;
  box-shadow: inset rgba(0, 0, 0, 0.117647) 0 0 .6vw 0, inset rgba(0, 0, 0, 0.239216) 0 .6vw .8vw 0;
  transition: all .2s;
}
#radio-4:checked + label:before {
  width: 5vw;
  height: 5vw;
  content: "🇯🇵 \\A 日";
  white-space: pre; /* or pre-wrap */
  color: #E0DFED;
  /* background: #EA4335; */
  /* transition: all .4s; */
  background: linear-gradient(155DEG, #FF0000 0%, #FF8787 100%);
  transition: all 0.45s;
}
/* for IE */
#radio-4:not(:checked) + label:before {
  width: 8vw;
  height: 8vw;
  /* https://stackoverflow.com/a/17047836/3806250 */
  content: "🇯🇵 \\A 日本語";
  white-space: pre; /* or pre-wrap */
  color: #E0DFED;
  /* background: #EA4335; */
  background: linear-gradient(155DEG, #FF0000 0%, #FF8787 100%);
  transition: all 0.45s;
  box-shadow: none;
}
/**** LIGHT BLUE BLACK Radio button code ****/
#radio-5 + label {
  left: 0vw;
  bottom: 0vw;
  content: "🇰🇷 \\A 한국어 \\A 🇰🇷";
  white-space: pre; /* or pre-wrap */
  /* bottom: -6vw; */
  /* background: #4285F4; */
  background: linear-gradient(155DEG, #4285F4 0%, #E4E3E8 100%);
  transform: scale(1);
  animation-delay: 0s;
}
#radio-5 + label:before {
  transform: scale(0);
}
#radio-5:checked + label:before {
  color: #200769;
  content: "🇰🇷 \\A 한";
  white-space: pre; /* or pre-wrap */
  background: linear-gradient(155DEG, #4285F4 0%, #E4E3E8 100%);
  transform: scale(1);
  transition: all .4s;
}
/**** LIGHT BLUE WHITE radio button code ****/
#radio-6 + label {
  left: 20vw;
  bottom: -20vw;
  /* background: #FBBC05; */
  color: #E0DFED;
  background: linear-gradient(155DEG, #4285F4 0%, #E4E3E8 100%);
  transition: all 0.45s;
  animation-delay: .4s;
}
#radio-6 + label:before {
  /* background: #E91E63; */
  color: #E0DFED;
  content: "🇬🇷 \\A Ελλη";
  white-space: pre; /* or pre-wrap */
  background: linear-gradient(155DEG, #4285F4 0%, #E4E3E8 100%);
  transition: all 0.45s;
  transform: scale(0);
  animation-name: unchecked-radio-6;
  animation-duration: .2s;
  animation-timing-function: ease-in-out;
}
#radio-6:checked + label:before {
  animation-name: checked-radio-6;
  animation-duration: .4s;
  animation-timing-function: ease-in-out;
  animation-fill-mode: both;
}
/**** BLACK YELLOW radio button code ****/
#radio-7 + label {
  left: 40vw;
  bottom: -40vw;
  content: "🇩🇪 \\A Deutsch \\A 🇩🇪";
  white-space: pre; /* or pre-wrap */
  /* background: #000000; */
  color: #FBBC05;
    background: linear-gradient(155DEG, #000000 0%, #E4E3E8 100%);
    transition: all 0.45s;
    animation-delay: .6s;
}
#radio-7 + label:before {
  /* background: #E0DFED; */
  color: #FBBC05;
  content: "🇩🇪 \\A DE";
  white-space: pre; /* or pre-wrap */
  background: linear-gradient(155DEG, #000000 0%, #E4E3E8 100%);
  transition: all 0.45s;
  animation: unchecked-radio-7 .5s both;
}
#radio-7:checked + label:before {
  animation-name: checked-radio-7;
  animation-duration: .6s;
  animation-timing-function: cubic-bezier(0.22, 0.61, 0.36, 1);
  animation-fill-mode: both;
}
/**** BLUE WHITE Radio button code ****/
#radio-8 + label {
  left: 60vw;
  bottom: -60vw;
  color: #E0DFED;
  /* background: #4285F4; */
  background: linear-gradient(155DEG, #200769 0%, #69B4F5 100%);
  transition: all 0.45s;
  animation-delay: 0s;
}
#radio-8 + label:before {
  background: linear-gradient(155DEG, #200769 0%, #69B4F5 100%);
  transition: all 0.45s;
  transform: scale(0);
}
#radio-8:checked + label:before {
  color: #E0DFED;
  content: "🇫🇷 \\A FR";
  white-space: pre; /* or pre-wrap */
  transform: scale(1);
  transition: all .4s;
}
/**** GREEN WHITE radio button code ****/
#radio-9 + label {
  left: 80vw;
  bottom: -80vw;
  color: #E0DFED;
  /* background: #34A853; */
  background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
  transition: all 0.45s;
  animation-delay: .6s;
}
#radio-9 + label:before {
  /* background: #8BC34A; */
  /* color: #E0DFED; */
  background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
  transition: all 0.45s;
  animation: unchecked-radio-9 .5s both;
}
#radio-9:checked + label:before {
  color: #E0DFED;
  content: "🇮🇹 \\A IT";
  white-space: pre; /* or pre-wrap */
  animation-name: checked-radio-9;
  animation-duration: .6s;
  animation-timing-function: cubic-bezier(0.22, 0.61, 0.36, 1);
  animation-fill-mode: both;
}
[type="radio"] {
    display: none;
}
            '))), 
      
      tabItems(
        tabItem(tabName = 'home', h2('®️Studio ☁️', align = 'center'), 
          #alignCenter(
            ## https://stackoverflow.com/questions/4253920/how-do-i-change-the-color-of-radio-buttons
            ## https://www.justinmind.com/blog/radio-button-design-examples
            ## https://www.sliderrevolution.com/resources/styling-radio-buttons
            # prettyRadioButtons(
            #   inputId = 'rb', label = NULL, 
            #   choices = rb_choices, #menus$choices, 
            #   shape = 'curve', animation = 'pulse', 
            #   selected = character(0), status = 'primary', 
            #   thick = TRUE, width = '100%', bigger = TRUE, 
            #   icon = icon('registered'))
            #)
            #includeHTML('www/DynRadioB.html'), 
            #includeCSS('www/DynRadioB.css')
            #htmlOutput('radio_home')
          f7Page(
            #jqui_sortable(
            #jqui_resizable(
            HTML('
            <div class="container" align="center">
              <input type="radio" class="radio" id="radio-1" name="group"/>
                <label for="radio-1"><br>🇬🇧<br>English</label>
              <input type="radio" class="radio" id="radio-2" name="group"/>
                <label for="radio-2"></label>
              <input type="radio" class="radio" id="radio-3" name="group"/>
                <label for="radio-3"><br>🇹🇼<br>繁体中文</label>
              <input type="radio" class="radio" id="radio-4" name="group"/>
                <label for="radio-4"></label>
              <input type="radio" class="radio" id="radio-5" name="group"/>
                <label for="radio-5"><br>🇰🇷<br>한국어</label>
              <input type="radio" class="radio" id="radio-6" name="group"/>
                <label for="radio-6"><br>🇬🇷<br>Ελληνικά</label>
              <input type="radio" class="radio" id="radio-7" name="group"/>
                <label for="radio-7"><br>🇩🇪<br>Deutsch</label>
              <input type="radio" class="radio" id="radio-8" name="group"/>
                <label for="radio-8"><br>🇫🇷<br>Français</label>
              <input type="radio" class="radio" id="radio-9" name="group"/>
                <label for="radio-9"><br>🇮🇹<br>Italiano</label>
            </div>
            ')#))
          )
          ), 
        tabItem(tabName = 'en', h2('🇬🇧 ENGLISH', align = 'center'), 
          ## https://stackoverflow.com/a/9158079/3806250
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
          ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
          htmlOutput('ryo_kr'), br(), br(), br(), 
          HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
          #htmlOutput('frame')
          ), 
        tabItem(tabName = 'gr', h2('🇬🇷 Ελληνικά', align = 'center'), 
          #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-gr', 
          #            height = 800, width = '100%', frameborder = 0)#, 
          #HTML(readLines('www/ryo-gr.html'))#, 
          #includeHTML('www/ryo-gr.html')#, 
          ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
          htmlOutput('ryo_gr'), br(), br(), br(), 
          HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
          #htmlOutput('frame')
          ), 
        tabItem(tabName = 'de', h2('🇩🇪 Deutsch', align = 'center'), 
          #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-de', 
          #            height = 800, width = '100%', frameborder = 0)#, 
          #HTML(readLines('www/ryo-de.html'))#, 
          #includeHTML('www/ryo-de.html')#,
          ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
          htmlOutput('ryo_de'), br(), br(), br(), 
          HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
          #htmlOutput('frame')
          ), 
        tabItem(tabName = 'fr', h2('🇫🇷 Français', align = 'center'), 
          #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-fr', 
          #            height = 800, width = '100%', frameborder = 0)#, 
          #HTML(readLines('www/ryo-fr.html'))#, 
          #includeHTML('www/ryo-fr.html')#,
          ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
          htmlOutput('ryo_fr'), br(), br(), br(), 
          HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")#, 
          #tags$script(HTML("
          #        var p = document.getElementById('ryo_fr')
          #        $(p).attr('align', 'center');"))
          #htmlOutput('frame')
          ), 
        tabItem(tabName = 'it', h2('🇮🇹 Italiano', align = 'center'), 
          #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-it', 
          #            height = 800, width = '100%', frameborder = 0)#, 
          #HTML(readLines('www/ryo-it.html'))#, 
          #includeHTML('www/ryo-it.html')#,
          ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
          htmlOutput('ryo_it'), br(), br(), br(), 
          HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
          #htmlOutput('frame')
          ), 
        tabItem(tabName = 'scbr', h2('世博量化®', align = 'center'), 
          htmlOutput('scibrokes')
          ), 
        tabItem(tabName = 'auth', h2('作者', align = 'center'), 
          #tags$iframe(src = 'http://rpubs.com/englianhu/ryo-eng', 
          #            height = 800, width = '100%', frameborder = 0)#, 
          #HTML(readLines('www/ryo-eng.html'))#, 
          #includeHTML('www/ryo-eng.html'), 
          #includeCSS('www/CSSBackgrounds.css')
          htmlOutput('ryo_eng')
          ), 
        tabItem(tabName = 'refr', h2('参考文献', align = 'center'), 
          br(), 
          p('此履历表使用闪霓应用编程，参考了以下文献：', 
            HTML("<a href='https://vlab.stern.nyu.edu/doc/3?topic=mdls'>GJR-GARCH Model</a>"), 
            'is the best fit model. You are feel free to browse over '), 
            jqui_sortable(
            tags$ul(
              tags$li(HTML("<a href='https://github.com/scibrokes/owner/issues/2'>Error: embed sidebar & css background inside html file doesn't work (shiny) #2</a>")), 
              tags$li(HTML("<a href='https://unleash-shiny.rinterface.com/beautify-sass.html'>Outstanding User Interfaces with Shiny</a>")), 
              tags$li(HTML("<a href='https://community.rstudio.com/t/how-to-use-sass-css-scss-in-r-shiny/97471'>How to use Sass CSS (SCSS) in R-Shiny</a>")), 
              tags$li(HTML("<a href='https://github.com/moldach/scss-shiny'>GitHub: scss-shiny</a>")), 
              tags$li(HTML("<a href='https://shiny.rstudio.com/articles/css.html'>Using custom CSS in your app</a>")), 
              tags$li(HTML("<a href='https://mastering-shiny.org'>Mastering Shiny</a>")), 
              tags$li(HTML("<a href='https://github.com/grabear/awesome-rshiny'>GitHub: awesome-rshiny</a>")), 
              tags$li(HTML("<a href='https://ducthanhnguyen.github.io/MaterialAdminLTE/index3.html'>MaterialAdminLTE (Shiny Application)</a>")), 
              tags$li(HTML("<a href='https://www.justinmind.com/blog/radio-button-design-examples'>Radio button design: easy selection and decision-making</a>")), 
              tags$li(HTML("<a href='https://codepen.io/visualcookie/details/xeBqBm'>Recreation: Card theme switcher</a>")), 
              tags$li(HTML("<a href='https://codepen.io/duggi/pen/gPjrKM'>3D Radar Chart</a>")), 
              tags$li(HTML("<a href='https://cran.r-project.org/web/packages/shinyMobile/vignettes/Tabs-Layout.html'>Mini UI - Tabs-Layout</a>")), 
              tags$li(HTML("<a href='https://www.sliderrevolution.com/resources/styling-radio-buttons'>Styling Radio Buttons with CSS (59 Custom Examples)</a>")), 
              tags$li(HTML("<a href='https://codepen.io/sodapop/pen/GpgEeE'>Custom CSS3 Radio Button - Radiosplosion</a>")), 
              tags$li(HTML("<a href='https://codepen.io/jkantner/pen/oNXjjZM'>Radio Buttons With Marble and Wood</a>")), 
              tags$li(HTML("<a href='https://codepen.io/victorfreire/pen/XXzqEr'>Google Dots Radio Buttons</a>")), 
              tags$li(HTML("<a href='https://shiny.rstudio.com/articles/css.html'>Using custom CSS in your app</a>")), 
              tags$li(HTML("<a href='https://shiny.rstudio.com/articles/packaging-javascript.html'>Packaging JavaScript code for Shiny</a>")), 
              tags$li(HTML("<a href='https://blog.hubspot.com/website/css-animation-examples'>24 Creative and Unique CSS Animation Examples to Inspire Your Own</a>"))
              )), 
            p('for the research study which compare the accuracy and the return of investment of various statistical models. '), 
          br(), 
          p('以下着手科研高频量化交易：', 
            HTML("<a href='https://vlab.stern.nyu.edu/doc/3?topic=mdls'>GJR-GARCH Model</a>"), 
            'is the best fit model. You are feel free to browse over ', 
            tags$ul(
              tags$li(HTML("<a href='https://medium.com/@dave.cote.msc/hands-on-advanced-deep-learning-time-series-forecasting-with-tensors-7facae522f18'>Hands-On Advanced Deep Learning Time Series Forecasting with Tensors</a>")), 
              tags$li(HTML("<a href='http://rpubs.com/englianhu/316133'>binary.com Interview Question I (Extention)</a>")), 
              tags$li(HTML("<a href='https://beta.rstudioconnect.com/content/3073/'>Q1App</a>")), 
              tags$li(HTML("<a href='https://beta.rstudioconnect.com/content/2367/'>ShinyApp</a>"), '(App for 3 Questions : Blooper)'), 
              tags$li(HTML("<a href='https://beta.rstudioconnect.com/content/3775/'>testRealTimeTransc</a>"))), 
            'for the research study which compare the accuracy and the return of investment of various statistical models. '), 
          p('Below is the equation for the model.', 
            withMathJax(
              helpText('$$\\delta_{t}^{2} = \\omega + (\\alpha + \\gamma I_{t-1}) \\varepsilon_{t-1}^{2} + \\beta \\sigma_{t-1}^{2}$$')), 'where'), 
          p(withMathJax(
          helpText('$$I_{t-1}=
                    \\begin{cases}
                    0& \\text{if } r_{t-1} \\leq \\mu\\\\
                    1& \\text{if } r_{t-1} > \\mu
                    \\end{cases}$$'))), 
          p('The daily data for calculation is getting from ', 
            HTML("<a href='https://medium.com/@dave.cote.msc/hands-on-advanced-deep-learning-time-series-forecasting-with-tensors-7facae522f18'>Hands-On Advanced Deep Learning Time Series Forecasting with Tensors</a>"), 
            ' while the real-time price to staking and settlement is getting from ', 
            HTML("<a href='https://www.truefx.com/'>TrueFX.com.</a>"), 
            'Therefore there has no any guarantee of profit and also accuracy of price dataset.')
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
      right = p(
        br(), 
        tags$a(href = 'https://www.pku.edu.cn', target = '_blank', 
               tags$img(height = '13px', alt = 'scibrokes', #align = 'right', 
                        #src = 'www/Peking University 02.png')), 
                        src = 'https://raw.githubusercontent.com/scibrokes/owner/master/www/Peking%20University%2002.png')), 
        HTML(paste0("<a href='https://www.pku.edu.cn'>", span('北京大学', style = 'color:blue'), "</a>")), 
        '🐉 ®γσ ξηg 2022 原著')
      ), 
    title = 'DashboardPage'))


# -------------- server -----------------------------

server <- shinyServer(function(input, output, session) {
  
  #kr <- file.exists('www/ryo-kr.html')
  #gr <- file.exists('www/ryo-gr.html')
  #de <- file.exists('www/ryo-de.html')
  #fr <- file.exists('www/ryo-fr.html')
  #it <- file.exists('www/ryo-it.html')
  
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
  
  ## https://stackoverflow.com/a/70093686/3806250
  # 
  # bookmarkingWhitelist <- c('sidebarID')
  #
  # observe({
  #   setBookmarkExclude(setdiff(names(input), bookmarkingWhitelist))
  # })
  #
  # observeEvent(input$sidebarID, {
  ## http://127.0.0.1:6172/?_inputs_&sidebarID=%22dashboard%22
  ## http://127.0.0.1:6172/?_inputs_&sidebarID=%22widgets%22
  #  
  #  newURL <- paste0(
  #      session$clientData$url_protocol,
  #      "//",
  #      session$clientData$url_hostname,
  #      ":",
  #      session$clientData$url_port,
  #      session$clientData$url_pathname,
  #      "?_inputs_&sidebarID=%22",
  #      input$sidebarID,
  #      "%22"
  #    )
  #  
  #  updateQueryString(newURL,
  #                    mode = "replace",
  #                    session)
  #})
  
  observeEvent(input$rb, {
    #withProgress(message = 'Loading...',
    #             detail = 'This may take a while...', value = 0, {
    #  for (i in 1:15) {
    #    incProgress(1/15)
    #    Sys.sleep(0.25)
    #  }
    #})
    updateTabItems(session, 'sidebarID', selected = input$rb)
  })
  
  output$radio_home <- renderUI({
    #includeCSS('www/DynRadioB.css')
    includeHTML('www/DynRadioB.html')
  })
  
  output$ryo_en <- renderUI({
    #includeCSS('www/CSSBackgrounds.css')
    includeHTML('www/ryo-en.html')
  })
  
  output$ryo_cn <- renderUI({
    #includeCSS('www/CSSBackgrounds.css')
    includeHTML('www/ryo-cn.html')
  })
  
  output$ryo_tw <- renderUI({
    #includeCSS('www/CSSBackgrounds.css')
    includeHTML('www/ryo-tw.html')
  })
  
  output$ryo_jp <- renderUI({
    #includeCSS('www/CSSBackgrounds.css')
    includeHTML('www/ryo-jp.html')
  })
  
  output$ryo_kr <- renderUI({
    
    #kr <- file.exists('www/ryo-kr.html')
    #
    #if (kr == FALSE) {
      ## https://shiny.rstudio.com/articles/html-tags.html
    #  div(id = 'ryo_kr',
    #    HTML('<ruby>건설<rp>(</rp><rt>geonseol</rt><rp>)</rp>중<rp>(</rp><rt>jung</rt><rp>)</rp></ruby> !'), 
    #    class = 'shiny-html-output shiny-bound-output shiny-output-error shiny-output-error-shiny.silent.error shiny-output-error-Missing-Data-Class shiny-output-error-validation', 
    #    align = 'center'
    #    )
    #    } else {
    #      includeHTML('www/ryo-kr.html')
    #    }
    
    ## https://rstudio.github.io/shinyvalidate/reference/compose_rules.html
    ## Validation rules are set in the server, start by
    ## making a new instance of an `InputValidator()`
    #joey <- InputValidator$new()
    
    ## Basic usage: `sv_regex()` requires both a regex
    ## pattern and message to display if the validation
    ## of `input$lookup_id` fails
    #joey$add_rule(
    #  kr,
    #  sv_regex('FALSE', HTML('<ruby>건설<rp>(</rp><rt>geonseol</rt><rp>)</rp>중<rp>(</rp><rt>jung</rt><rp>)</rp></ruby> !'))
    #  )
    
    ## Finally, `enable()` the validation rules
    #joey$enable()
    
    ## https://mastering-shiny.org/action-feedback.html
    #shinyFeedback::feedbackWarning(kr, FALSE, HTML('<ruby>건설<rp>(</rp><rt>geonseol</rt><rp>)</rp>중<rp>(</rp><rt>jung</rt><rp>)</rp></ruby> !'))
    
    validate(
      need(is.error(file.exists('www/ryo-kr.html')), '건설중 !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('www/ryo-kr.html')
  })
  
  output$ryo_gr <- renderUI({
    validate(
      need(is.error(file.exists('www/ryo-gr.html')), 'Υπό κατασκευή !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('www/ryo-gr.html')
  })
  
  output$ryo_de <- renderUI({
    validate(
      need(is.error(file.exists('www/ryo-de.html')), 'En construction !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('www/ryo-de.html')
  })
  
  output$ryo_fr <- renderUI({
    validate(
      need(is.error(file.exists('www/ryo-fr.html')), 'Im Bau !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('www/ryo-fr.html')
  })
  
  output$ryo_it <- renderUI({
    validate(
      need(is.error(file.exists('www/ryo-it.html')), 'In costruzione !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('www/ryo-it.html')
  })
  
  observeEvent(input$sidebarID, {
    updatePrettyRadioButtons(session, 'rb', selected = input$sidebarID)
  })
  
  output$ryo_eng <- renderUI({
    includeCSS('www/CSSBackgrounds.css')
    includeHTML('www/ryo-eng.html')
  })
  
  output$scibrokes <- renderUI({
    tags$iframe(src = 'https://www.scibrokes.com', height = 800, width = '100%', frameborder = 0)
  })
  
})


# -------------- shinyApp() -----------------------------

shinyApp(ui, server)
#runApp(app.R, display.mode = 'showcase')

