## Setup Options, Loading Required Libraries and Preparing Environment

## Setting to omit all warnings
options(warn=-1)

## Loading the package 'BBmisc'
if(suppressMessages(!require('BBmisc'))){
  install.packages('BBmisc')}
suppressMessages(library('BBmisc'))

## Loading multiple packages at once
pkgs <- c('plyr', 'dplyr', 'devtools', 'zoo', 'lubridate', 'stringr', 'rvest', 
          'googleVis', 'markdown', 'knitr', 'rmarkdown')
suppressAll(lib(pkgs)); rm(pkgs)

## Set the googleVis options first to change the behaviour of plot.gvis, so that 
##  only the chart component of the HTML file is written into the output file.
op <- options(gvis.plot.tag='chart')


