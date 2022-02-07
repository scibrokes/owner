#radarchart::chartJSRadar(
#  skill[,-1], main = 'Skill Rating', width = '100%', height = '100%', 
#  maxScale = 10, labelSize = 'auto', showToolTipLabel = TRUE)

### ---------------------------

Sys.setlocale(category = 'LC_ALL', locale = 'Chinese')

linear_gradient1 <- htmlwidgets::JS(
  "new echarts.graphic.LinearGradient(
     0, 0, 0, 1,
     [
       { offset: 0, color: '#EDAE01' },
       { offset: 1, color: '#FFEB94' }
     ])")

linear_gradient2 <- htmlwidgets::JS(
  "new echarts.graphic.LinearGradient(
     0, 0, 0, 1,
     [
       { offset: 0, color: '#002C54' },
       { offset: 1, color: '#4CB5F5' }
     ])")

skill |> 
  echarts4r::e_charts(`技能`) |> 
  echarts4r::e_radar(`程度`, max = 10, name = skill$`技能`, 
                     itemStyle = list(
                       color = linear_gradient1), 
                     areaStyle = list(
                       color = linear_gradient2)) |>
  echarts4r::e_tooltip(trigger = 'item')
