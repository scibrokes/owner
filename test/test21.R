## https://github.com/scibrokes/owner/issues/2#issuecomment-1102259852
## https://stackoverflow.com/questions/53517929/css-radio-button-style-change-when-not-selected

require('BBmisc')
if(!require('XML')) devtools::install_github('omegahat/XML')
if(!require('runr')) devtools::install_github('yihui/runr')
## https://shi18ny.datasketch.dev
#if(!require('shi18ny')) devtools::install_github('datasketch/shi18ny')

pkgs <- c('shiny', 'shinythemes', 'shinydashboard', 'shinydashboardPlus', 'memoise', 
  'bs4Dash', 'dashboardthemes', 'shinyWidgets', 'shinyjs', 'shinyBS', 'XML', 'xml2', 
  'htmltools', 'shinyvalidate', 'shinyFeedback', 'sass')
lib(pkgs)

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
conflict_prefer('dashboardFooter', 'shinydashboardPlus')
conflict_prefer('box', 'shinydashboardPlus')
conflict_prefer('updateTabItems', 'shinydashboard')
conflict_prefer('runExample', 'shiny')

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

#// Just check/uncheck to see the effects transitions.
#
#
#
#
#
#//          Inspiration
#
#//design.google.com/articles/evolving-the-google-identity/

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

ui <- shinyUI(
  dashboardPage(
    header = dashboardHeader(title = logo), 
    sidebar = dashboardSidebar(),
    body = dashboardBody(
      shinyDashboardThemes(theme = 'blue_gradient'), 
      
      ## https://stackoverflow.com/questions/52198452/how-to-change-the-background-color-of-the-shiny-dashboard-body
      tags$head(tags$style(HTML('
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
    @keyframes unchecked-radio-4 {
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
      /* width:500vw; */
      /* height:100vh; */
      background-color: rgba(255, 255, 255, 0.35); /* 35% opaque white */
      padding: 0.25em;
      /* color: #FFD64D; */
      /* background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%); */
      /* transition: all 0.45s; */
      /* display:flex; */
      /* flex-wrap: wrap; */
      /* align-items:center; */
      /* justify-content:center; */
    }
    main, .container, label, label:before, label:after {
      background-color: rgba(255, 255, 255, 0.35); /* 35% opaque white */
      padding: 0.25em;
      display:flex;
      flex-wrap: wrap;
      align-items:center;
      justify-content:center;
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
    }
    main {
      width: 95vw;
      height: 50vw;
      margin: auto;
      /* width: 60%; */
      border: 3px solid #73AD21;
      padding: 10px;
    }
    .container {
      /* margin: auto; */
      /* width: 60%; */
      /* border: 3px solid #73AD21; */
      /* padding: 10px; */
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
    /**** BLUE Radio button code ****/
    #radio-1 + label {
      left: -60vw;
      background: #4285F4;
      animation-delay: 0s;
    }
    #radio-1 + label:before {
      transform: scale(0);
    }
    #radio-1:checked + label:before {
      transform: scale(1);
      transition: all .4s;
    }
    /**** RED radio button code ****/
    #radio-2 + label {
      left: -20vw;
      background: #EA4335;
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
      background: #EA4335;
      transition: all .4s;
    }
    /* for IE */
    #radio-2:not(:checked) + label:before {
      width: 8vw;
      height: 8vw;
      background: #EA4335;
      box-shadow: none;
    }
    /**** YELLOW radio button code ****/
    #radio-3 + label {
      left: 20vw;
      background: #FBBC05;
      animation-delay: .4s;
    }
    #radio-3 + label:before {
    /* background: #E91E63; */
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
    /**** GREEN radio button code ****/
    #radio-4 + label {
      left: 60vw;
      background: #34A853;
      animation-delay: .6s;
    }
    #radio-4 + label:before {
      /* background: #8BC34A; */
      animation: unchecked-radio-4 .5s both;
    }
    #radio-4:checked + label:before {
      animation-name: checked-radio-4;
      animation-duration: .6s;
      animation-timing-function: cubic-bezier(0.22, 0.61, 0.36, 1);
      animation-fill-mode: both;
    }
    [type="radio"] {
      display: none;
    }
    
    
    /* Radio Buttons section 2*/
    input[type="radio"] {
      left: 0;
      margin: 0;
      padding: 0;
      position: absolute;
      top: 0;
      z-index: 5;
      /* IE 8 */
      -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
      -moz-opacity: 0;
      opacity: 0;
    }
    
    .faux-radio {
      width: 12px;
      height: 12px;
      background: #f2f2f2;
      border: 1px solid #a6a6a6;
      border-radius: 12px;
      display: inline-block;
      margin-right: 2px;
      position: relative;
    }
    
    .faux-radio.selected:after {
      content: "";
      width: 6px;
      height: 6px;
      background: #666;
      border-radius: 6px;
      position: absolute;
      top: 2px;
      left: 2px;
    }
    
    
    /* Radio Buttons section 3*/
    input[type="radio"] {
    -webkit-appearance: none;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    outline: none;
    border: 3px solid gray;
}

input[type="radio"]:before {
    content: "";
    display: block;
    width: 60%;
    height: 60%;
    margin: 20% auto;
    border-radius: 50%;
}

input[type="radio"]:checked:before {
    background: green;

}

input[type="radio"]:checked {
  border-color: orange;
}
      '))),
      fluidPage(
        div(align = 'center', class = 'container', style='display: inline-block;', 
          HTML('<div class="container" align="center">
           <input type="radio" class="radio" id="radio-1" name="group" value="one"/>
           <label for="radio-1"></label>
           <input type="radio" class="radio" id="radio-2" name="group" value="two"/>
           <label for="radio-2"></label>
           <input type="radio" class="radio" id="radio-3" name="group" value="three"/>
           <label for="radio-3"></label>
           <input type="radio" class="radio" id="radio-4" name="group" value="four"/>
           <label for="radio-4"></label></div>')
           ), 
        HTML('
          <div class="faux-radio" data-group="radio-test">
          <input type="radio" id="radio-1" name="radio-test" onclick="document.body.style.backgroundColor = "green">
          </div>
          '),
        HTML('
          <div>
          <div class="radio">
            <input type="radio" name="person" id="radio-1" value="James">
            <label for="radio-1">James</label>
          </div>

          <div class="radio">
            <input type="radio" name="person" id="radio-2" value="Michael">
            <label for="radio-2">Michael</label>
          </div>

          <div class="radio">
            <input type="radio" name="person" id="radio-3" value="Andy">
            <label for="radio-3">Andy</label>
          </div>
          </div>
          ')
        )
      )
    )
  )

server = shinyServer(function(input, output, session) { 

})

shinyApp(ui = ui, server = server)

