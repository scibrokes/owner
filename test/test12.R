require('BBmisc')
lib('shiny')
lib('shinyBS')

shinyApp(
  ui = fluidPage(
    tags$ruby('건설', tags$rp('(', .noWS = 'after'), 
              tags$rt('geonseol', .noWS = 'after'), 
              tags$rp(')', .noWS = 'after'), 
              '중', tags$rp('(', .noWS = 'after'), 
              tags$rt('jung', .noWS = 'after'), 
              tags$rp(')', .noWS = 'after')),
    br(),
    br(),
    tags$ruby('건설', tags$rp('('), 
               tags$rt('geonseol'), 
               tags$rp(')'), 
               '중', tags$rp('('), 
               tags$rt('jung'), 
               tags$rp(')')),
    br(),
    br(),
    HTML('<ruby>건설<rp>(</rp><rt>geonseol</rt><rp>)</rp>중<rp>(</rp><rt>jung</rt><rp>)</rp></ruby> !'),
    br(),
    br(),
    'Chern Shiing-Shen', 
    tags$ruby('陈', tags$rp('(', .noWS = 'after'), 
              tags$rt('chén', .noWS = 'after'), 
              tags$rp(')', .noWS = 'after'), 
              '省', tags$rp('(', .noWS = 'after'), 
              tags$rt('xǐng', .noWS = 'after'), 
              tags$rp(')', .noWS = 'after'),
              '身', tags$rp('(', .noWS = 'after'), 
              tags$rt('shēn', .noWS = 'after'), 
              tags$rp(')', .noWS = 'after')
              ),
    br(),
    br(),
    tags$ruby('杨', tags$rp('('), 
              tags$rt('yáng'), 
              tags$rp(')'), 
              '振', tags$rp('('), 
              tags$rt('zhèn'), 
              tags$rp(')'),
              '宁', tags$rp('('), 
              tags$rt('níng'), 
              tags$rp(')')
              ),
    br(),
    br(),
    HTML('<ruby>丘<rp>(</rp><rt>qiū</rt><rp>)</rp>成<rp>(</rp><rt>chéng</rt><rp>)</rp>桐<rp>(</rp><rt>tóng</rt><rp>)</rp></ruby> !')
  ),
  
  server = function(input, output) {
  }
)
