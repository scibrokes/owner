## update packages via terminal
sudo su - -c "R -e \"pkgs <- c('devtools', 'tidyverse', 'miniUI', 'crayon'); sapply(pkgs, install.packages, repos='https://cran.rstudio.org', getOption('repos'), lib='/usr/lib/R/library', dependencies = TRUE, INSTALL_opts = '--no-lock')\""

sudo su - -c "R -e \"pkgs <- c('ghit', 'mosaic', 'RgoogleMaps', 'openssl', 'RcppArmadillo', 'roxygen2', 'tinytex', 'xfun', 'BiocManager', 'rgl'，'rJava', 'rJava', 'OpenStreetMap', 'loa', 'sodium', 'magick'); sapply(pkgs, install.packages, repos='https://cran.rstudio.org', getOption('repos'), lib='/usr/lib/R/library', dependencies = TRUE, INSTALL_opts = '--no-lock')\""

## https://www.reddit.com/r/rstats/comments/hiu17b/can_i_delete_outdated_r_version/
sudo su - -c "R -e \"install.packages(rownames(installed.packages(priority = 'NA')), getOption('repos'), dependencies = TRUE, INSTALL_opts = '--no-lock')\""

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




