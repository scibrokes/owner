## https://github.com/scibrokes/owner/issues/2#issuecomment-1102259852

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
        $lightBg: "https://i.ibb.co/t2ghNcR/light-wood.jpg"
        $darkBg: "https://i.ibb.co/HK4jNK4/dark-wood.jpg"
        $dur: 0.5s
        
        *
	      border: 0
	      box-sizing: border-box
	      margin: 0
	      padding: 0
        \:root
	      font-size: calc(32px + (40 - 32)*(100vw - 320px)/ (1024 - 320))
        body
	       background:
	  	   image: url($lightBg)
		     position: 50% 50%
	       color: #381803
	       display: flex
	       font: 1em Nunito, sans-serif
	       height: 100vh
	       line-height: 1.5
        form
	        margin: auto
	        max-width: 10em
	        padding: 1.5em 0
	        position: relative
	      label:before, span:before
		      border-radius: 50%
		      content: ""
	      label
		      cursor: pointer
		      display: flex
		      letter-spacing: 0.1em
		      text-transform: uppercase
		      &:before
			      background: radial-gradient(100% 100% at 33% 33%,rgba(0,0,0,0.25) 25%,rgba(0,0,0,0) 50%), radial-gradient(100% 100% at 67% 67%,rgba(255,255,255,0.15),rgba(255,255,255,0) 50%)
			      box-shadow: 0 0 0.75em #000 inset
			      display: inline-block
			      margin-right: 0.375em
			      width: 1.5em
			      height: 1.5em
		      &:not(:last-of-type)
			      margin-bottom: 1.5em
	span
		position: absolute
		top: 1.75em
		left: 0.25em
		width: 1em
		height: 1em
		transition: transform $dur/2 linear
		z-index: 1
		&, &:before
			display: block
		&:before
			background:
				color: #2762f3
				image: radial-gradient(10% 10% at 50% 50%, rgba(255,255,255,0.6) 50%, rgba(255,255,255,0)), radial-gradient(12% 12% at 60% 25%, rgba(255,255,255,0.6) 50%, rgba(255,255,255,0)), radial-gradient(100% 100% at 60% 50%, rgba(0,0,0,0) 25%, rgba(0,0,0,0.25) 50%)
			border-radius: 50%
			box-shadow: 0 0.1em 0.1em 0 rgba(0,0,0,0.5), 0 0 0.1em 0.1em rgba(0,0,0,0.25) inset
			width: 100%
			height: 100%

input
	position: fixed
	top: -1.5em
	left: -1.5em

@for $s from 1 through 4
	$yPos: 3em * ($s - 1)
	input:nth-of-type(#{$s}):checked ~ span
		transform: translateY($yPos)
		&:before
			animation: wobble#{$s} $dur linear forwards
	@keyframes wobble#{$s}
		from, to
			transform: translateY(0) scale(1)
		25%
			transform: translateY(0) scale(1.33)
		50%
			transform: translateY(0.25em) scale(1)
		67%
			transform: translateY(-0.15em) scale(1)
		83%
			transform: translateY(0.07em) scale(1)

/* Dark mode */
@media screen and (prefers-color-scheme: dark)
	body
		background:
			image: url($darkBg)
		color: #c58b50
    '))),
      fluidPage(
        div(align = 'center', class = 'container', 
          HTML('<form>
          <input id="one" type="radio" name="radios" value="one">
	        <input id="two" type="radio" name="radios" value="two">
	        <input id="three" type="radio" name="radios" value="three">
	        <input id="four" type="radio" name="radios" value="four">
	        <span></span>
	        <label for="one">One</label>
	        <label for="two">Two</label>
	        <label for="three">Three</label>
	        <label for="four">Four</label>
          </form>')
           )
        )
      )
    )
  )

server = shinyServer(function(input, output, session) { 

})

shinyApp(ui = ui, server = server)

