## Setup Options, Loading Required Libraries and Preparing Environment

## Setting to omit all warnings
options(warn = -1)

## Loading the package 'BBmisc'
#if(suppressMessages(!require('BBmisc'))){
#  install.packages('BBmisc', dependencies = TRUE, INSTALL_opts = '--no-lock')
#  suppressMessages(library('BBmisc'))
#}
if (suppressMessages(!require('rmsfuns'))) {
  install.packages('rmsfuns', dependencies = TRUE, INSTALL_opts = '--no-lock')
  suppressMessages(library('rmsfuns'))
}

## Loading multiple packages at once
pkgs <- c('plyr', 'dplyr', 'magrittr', 'tidyverse', 'devtools', 'zoo', 
          'lubridate', 'stringr', 'rvest', 'markdown', 'googleVis', 
          'knitr', 'rmarkdown', 'htmltools', 'knitr', 'kableExtra', 
          'formattable', 'echarts4r', 'radarchart', 'MASS')
#suppressAll(lib(pkgs)); rm(pkgs)
load_pkg(pkgs); rm(pkgs)

## Set the googleVis options first to change the behaviour of plot.gvis, so that 
##  only the chart component of the HTML file is written into the output file.
op <- options(gvis.plot.tag = 'chart')


