Sys.setlocale(category = 'LC_ALL', locale = 'Chinese')

require('dplyr', quietly = TRUE, warn.conflicts = FALSE)
require('magrittr', quietly = TRUE, warn.conflicts = FALSE)
require('formattable', quietly = TRUE, warn.conflicts = FALSE)
require('knitr', quietly = TRUE, warn.conflicts = FALSE)
require('kableExtra', quietly = TRUE, warn.conflicts = FALSE)

skill <- tibble(
  '技能' = c('計量經濟學', '量化交昜', 'R編程語言', '微軟辦公軟件', 'SQL語言', 'Python編程語言', '數據分析', '客服工作', '體育博彩行業', '建立RStudio服務器', '統計學', '數據科學', 'Shiny應用', 'Linux操作繫統', 'Web API應用程序接口', 'Sparklyr大數據分析', '高級 R', 'modeltime / tidyverts / prophet', 'tidyverse / tidymodels', '張量Tensorflow / pytorch', 'Web Driver驅動器瀏覽器', 'FrontPage / 部署網站', 'Photoshop / Picsart'), 
  '程度' = c(9, 9, 9, 8, 3, 4, 9, 9, 7, 7, 6, 8, 8, 7, 6, 2, 6, 7, 6, 2, 4, 3, 5))
skill <- tibble('序列' = 1:nrow(skill), skill)

skill |> 
  {\(.) dplyr::mutate(
    ., `技能` = cell_spec(`技能`, italic = TRUE, 
                        color = spec_color(seq(nrow(skill)), option = 'A', 
                                           begin = 0.1, end = 0.9), 
                        tooltip = paste0('程度: ', `程度`), angle = 3))}() |>#, 
  #Level = color_tile('#FFFDDC', 'darkgoldenrod')(Level)) |> 
  {\(.) mutate_if(., is.numeric, function(x){ 
    cell_spec(x, 'html', color = 
                spec_color(x, option = 'A', begin = 0.1, end = 0.9, 
                           direction = -1), angle = 20, 
              font_size = spec_font_size(x), bold = TRUE) })}() |> 
  {\(.) kbl(., caption = '技能評估（從新兵1至專業10）', escape = FALSE, align = 'c')}() |> 
  {\(.) kable_styling(., bootstrap_options = c('striped', 'hover', 'condensed', 'responsive'))}() |> 
  {\(.) row_spec(., 0, background = 'DimGrey', color = 'yellow')}()# %>% 
#column_spec(1, background = 'CornflowerBlue', color = 'red') %>% 
#column_spec(2, background = 'grey', color = 'black') %>% 
#column_spec(2, background = 'grey', color = 'black')
