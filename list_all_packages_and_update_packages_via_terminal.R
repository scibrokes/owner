## update packages via terminal
sudo su - -c "R -e \"pkgs <- c('tidyr', 'broom'); lapply(pkgs, install.packages, repos='https://cran.rstudio.org', lib='/usr/lib/R/library')\""
sudo su - -c "R -e \"devtools::update_packages()\""
sudo su - -c "R -e \"update.packages(ask=FALSE)\""


## ===========================================================
## list all r packages 
require('tidyverse')
require('xml2')
require('rvest')
require('stringr')
require('magrittr')
require('plyr')
require('dplyr')
require('devtools')

rp <- 'https://cloud.r-project.org/src/contrib/'
pkg <- rp %>% 
  read_html %>% 
  html_nodes('a') %>% 
  html_attr('href')
pkg <- pkg[136:length(pkg)]

# pkg[1:10] %>% 
#llply(., function(x) {
#  y <- paste0(rp, x)
#  z <- paste0("download.file(url = ", y, ", destfile = paste0('/home/englianhu/Downloads/", x,"))")
#  eval(z)
#})

pkg %>% 
  llply(., function(x) {
    y <- paste0(rp, x)
    fl <- paste0('/home/englianhu/Downloads/', x)
    download.file(url = y, destfile = fl)
    install.packages(fl, repos = NULL, type = 'source')
    #install.packages(file.choose(fl), repos = NULL, type = 'source')
    #install_local(path = fl)
    file.remove(fl)
  })




