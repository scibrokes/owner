## https://github.com/moldach/scss-shiny
## https://shiny.rstudio.com/articles/packaging-javascript.html
## https://codepen.io/victorfreire/pen/XXzqEr
## https://stackoverflow.com/questions/66128302/can-you-define-a-maximum-width-height-to-css-transform-scale
## https://unleash-shiny.rinterface.com

require('BBmisc')
lib('shiny')
lib('shinyMobile')
lib('shinyWidgets')
lib('shinyjqui')
lib('sass')

ui <- shinyMobile::f7Page(
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
/* main, .container, label, label:before, label:after { */
.container, label, label:before, label:after {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  /* max-width: 100px; */
  /* max-height: 100px; */
  margin: auto;
}
/* main {
  width: 50vw; /* 95vw; */
  height: 50vh; /* 50vw; */
} */
.container {
  max-width: 100%;
  max-height: 100%;
  margin: auto;
  animation: fade 1s;
}
label {
  display: inline-block;
  max-width: 10vw;
  max-height: 10vh; /* 10vw; */
  /* width: 10vw; */
  /* height: 10vw; */
  margin: auto;
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
  max-width: 5vw;
  max-height: 5vh; /* 5vw; */
  /* width: 5vw; */
  /* height: 5vw; */
  margin: auto;
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
  max-width: 10vw;
  max-height: 10vh; /* 10vw; */
  /* width: 10vw; */
  /* height: 10vw; */
  margin: auto;
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
  top: 0;
  bottom: 80vh; /* 80vw */
  left: -80vw;
  right: 0;
  margin: auto;
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
  top: 0;
  bottom: 60vh; /* 60vw */
  left: -60vw;
  right: 0;
  margin: auto;
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
  max-width: 5vw;
  max-height: 5vh; /* 5vw */
  margin: auto;
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
  max-width: 8vw;
  max-height: 8vh; /* 8vw */
  margin: auto;
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
  top: 0;
  bottom: 40vh; /* 40vw */
  left: -40vw;
  right: 0;
  margin: auto;
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
  top: 0;
  bottom: 20vh; /* 20vw */
  left: -20vw;
  right: 0;
  margin: auto;
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
  max-width: 5vw;
  max-height: 5vh; /* 5vw */
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
  max-width: 8vw;
  max-height: 8vh; /* 8vw */
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
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
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
  top: 0;
  bottom: -20vh; /* -20vw */
  left: 20vw;
  right: 0;
  margin: auto;
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
  top: 0;
  bottom: -40vh; /* -40vw */
  left: 40vw;
  right: 0;
  margin: auto;
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
  top: 0;
  bottom: -60vh; /* -60vw */
  left: 60vw;
  right: 0;
  margin: auto;
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
  top: 0;
  bottom: -80vh; /* -80vw */
  left: 80vw;
  right: 0;
  margin: auto;
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
    div(class='container', align='center', 
      #jqui_resizable(
      HTML('
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
        ')
    #)
    )
  #includeHTML("www/test21B.html")#, 
  #includeCSS("www/test21B.css")#, 
  #includeScript('www/test21B.scss')
  #sass(sass_file('www/test21B.scss'), 
  #  'www/test21B.css', 
  #options = sass_options(
  #  output_style = 'compressed',
  #  source_map_embed = TRUE)
  #  )
  )

server <- function(input, output) {
  
}

#runApp('test/test21C.R', display.mode = 'showcase')
shinyApp(ui = ui, server = server)
