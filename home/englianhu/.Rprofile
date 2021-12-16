
## ======================== Load Packages ==================================
## 
## 
## Manually install all packages since Rprofile doesn't support packages installation. 
## 
## 

suppressPackageStartupMessages(require('utils'))

## Loading the package 'BBmisc'
#if(suppressMessages(!require('BBmisc'))){
#  install.packages('BBmisc', dependencies = TRUE, 
#                   INSTALL_opts = '--no-lock')
#  suppressMessages(library('BBmisc'))
#}
#if (suppressMessages(!require('rmsfuns'))) {
#  install.packages('rmsfuns', dependencies = TRUE, 
#                   INSTALL_opts = '--no-lock')
#  suppressMessages(library('rmsfuns'))
#}

suppressPackageStartupMessages(require('BBmisc'))
#suppressMessages(library('rmsfuns'))

#if(!suppressAll(require('devtools'))) {
#  install.packages('devtools', dependencies = TRUE, 
#                   INSTALL_opts = '--no-lock')       
#  devtools::install_github('r-lib/devtools')
#}

#if(!suppressAll(require('startup'))) {
  ## https://github.com/HenrikBengtsson/startup
#  remotes::install_github('HenrikBengtsson/startup', ref = 'develop')
#}

#if(!suppressAll(require('Rdym'))) {
#  devtools::install_github('wrathematics/Rdym')
#}

## https://www.jumpingrivers.com/blog/customising-your-rprofile
#if(!suppressAll(require('rprofile'))) {
#  remotes::install_github('csgillespie/rprofile')
#}

#if(!suppressAll(require('prompt'))) {
  ## Used for nice prompts
#  remotes::install_github('gaborcsardi/prompt')
#}

#if(!suppressAll(require('colorout'))) {
  ## Used for nice colours in the terminal; not for Windows
#  remotes::install_github('jalvesaq/colorout')
#}

#if(!suppressAll(require('tidyverse'))) {
#  devtools::install_github('tidyverse/tidyverse')
#}

#if(!suppressAll(require('lubridate'))) {
#  devtools::install_github('tidyverse/lubridate')
#}

#library(prettycode, exclude = c('!', 'print'))
pkgs <- c('MASS', 'devtools', 'lubridate', 'tidyverse', 'rprofile', 'prompt', 
          'colorout', 'startup', 'conflicted', 'prettycode')#, 'Rdym')
suppressAll(lib(pkgs))
rm(pkgs)

conflicted::conflict_prefer('print', 'base', quiet=TRUE)
conflicted::conflict_prefer('check', 'devtools', quiet=TRUE)
conflicted::conflict_prefer('install', 'devtools', quiet=TRUE)

## -------------------------------------------------------------------------

## https://stackoverflow.com/a/17486231/3806250
#.First()
#.First <- function() {
#  Rdym::RdymEnable()
#  BBmisc::suppressAll(startup::install(path = '/home/englianhu'))
#  BBmisc::suppressAll(startup::startup())
#}

## ======================== Start Up =====================================

## A powerline clone, that also shows the system load average and the current working directory.
#if (interactive()) prompt::set_prompt(prompt::new_prompt_powerline())

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
#if (interactive() && suppressAll(requireNamespace('rprofile'))) {
  
  ## Only useful if you use Makefiles
  #rprofile::create_make_functions()
  
  ## Startup options
  #rprofile::set_startup_options()
  
  ## Not RStudio console
  if (rprofile::is_terminal()) {
    ## https://github.com/csgillespie/rprofile/blob/master/R/set-terminal.R
    rprofile::set_terminal()
    prompt::set_prompt(prompt::new_prompt_powerline())
  } else {
    rprofile::set_rstudio()
  }
  
  .env = rprofile::set_functions()
  suppressAll(attach(.env))
  ## Display wifi and no of R sessions
  ## Linux only
  suppressWarnings(rprofile::set_startup_info())
#}

## -------------------------------------------------------------------------

## Prints RStudio project on start-up
#setHook('rstudio.sessionInit', function(newSession) {
#  active_rproj = rprofile::get_active_rproj()
#  if (!is.null(active_rproj)) {
#    base::message(glue::glue("{crayon::yellow('R-project:')} {active_rproj}"))
#  }
#}, action = 'append')

# BBmisc::suppressAll(.First())
tryCatch(suppressWarnings(startup::startup(all = TRUE)), error=function(ex) 
  base::message('.Rprofile error: ', base::conditionMessage(ex)))
