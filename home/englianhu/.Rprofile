#source("renv/activate.R")
##						Emacs please make this -*- R -*-
## empty Rprofile.site for R on Debian
##
## Copyright (C) 2008 - 2018  Dirk Eddelbuettel and GPL'ed
##
## see help(Startup) for documentation on ~/.Rprofile and Rprofile.site

# ## Example of .Rprofile
# options(width=65, digits=5)
# options(show.signif.stars=FALSE)
# setHook(packageEvent('grDevices', 'onLoad'),
#         function(...) grDevices::ps.options(horizontal=FALSE))
# set.seed(1234)
# .First <- function() cat("\n   Welcome to R!\n\n")
# .Last <- function()  cat("\n   Goodbye!\n\n")

## ======================== Micro Editor ===================================

## https://www.tecmint.com/micro-linuxtext-editor-with-syntax-highlighting/
## Micro - A Modern Terminal Based Text Editor with Syntax Highlighting

## ============================= PATH ======================================
#system('sudo chmod +rwx /usr/lib/R')

.pth <- .libPaths(c('/usr/lib/R/library')) #, '/cloud/lib/R/library', '/cloud/lib/R/site-library'))
.libPaths(.pth)

## https://support.rstudio.com/hc/en-us/articles/200532197
## https://community.rstudio.com/t/r-does-not-display-korean-chinese/30889/3?u=englianhu
#Sys.setlocale("LC_CTYPE", "en_US.UTF-8")
#Sys.setlocale("LC_CTYPE", "zh_CN.UTF-8")
#Sys.setlocale(category = "LC_CTYPE", "Chinese (Simplified)_China.936")
#Sys.setlocale(locale = "Chinese")
#Sys.setlocale(locale = "Japanese")
#Sys.setlocale(locale = "English")

# rmarkdown::render('/home/englianhu/Documents/owner/ryo-cn.Rmd',  encoding = 'UTF-8')
#Sys.setlocale("LC_CTYPE", "UTF-8")
#Sys.setlocale(locale = "UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "Chinese")
#Sys.setlocale(category = "LC_ALL", locale = "zh_CN.UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "jp_JP.UTF-8")
options(encoding='UTF-8')

#dir(paste0(R.home(component = 'home'), '/etc'))
## https://www.jumpingrivers.com/blog/customising-your-rprofile/

## -------------------------------------------------------------------------

## https://stackoverflow.com/a/13736073/3806250
# candidates <- c(Sys.getenv('R_PROFILE'),
# file.path(Sys.getenv('R_HOME'), 'etc', 'Rprofile.site'),
# Sys.getenv('R_PROFILE_USER'),
#file.path(getwd(), '.Rprofile') )
# 
# Filter(file.exists, candidates)

## https://github.com/rstudio/reticulate/issues/496#issuecomment-601446838
#Sys.setenv(RETICULATE_PYTHON = '/usr/bin/python3')
#Sys.setenv(RETICULATE_PYTHON = '/home/englianhu/anaconda3/bin/python')
## https://d.cosx.org/d/422269-r-410/11
Sys.setenv(RETICULATE_PYTHON = '/home/englianhu/anaconda3/bin/python3', 
           '_R_USE_PIPEBIND_' = 'true')
#Sys.setenv(RETICULATE_PYTHON = '/home/englianhu/anaconda3/envs/py38/bin/python')
## -------------------------------------------------------------------------

## We set the cloud mirror, which is 'network-close' to everybody, as default
local({
  #r <- getOption('repos')
  #r['CRAN'] <- 'https://cloud.r-project.org'
  #options(repos = r)
  
  ## https://radiant-rstats.github.io/docs/install.html
  options(repos = c(CRAN = 'https://cloud.r-project.org', 
                    RSM = 'https://radiant-rstats.github.io/minicran', 
                    Omega = 'http://www.omegahat.net/R', 
                    CINC = 'https://cinc.rud.is', 
                    RForge = 'https://www.rforge.net', 
                    RSpatial = 'https://rspatial.r-universe.dev'), 
          Stan = 'https://mc-stan.org/r-packages')
  #install.packages('remotes')
  #remotes::install_github('radiant-rstats/radiant.update', upgrade = 'never')
  #radiant.update::radiant.update()
  #install.packages('cmdstanr', repos = c('https://mc-stan.org/r-packages', getOption('repos')))
})

## ==================== Load Packages ===============================

suppressPackageStartupMessages(require('utils'))

if(!suppressPackageStartupMessages(require('BBmisc'))) {
  install.packages('BBmisc', dependencies = TRUE, 
                   lib = .pth[1], INSTALL_opts = '--no-lock')
  suppressPackageStartupMessages(require('BBmisc'))
}

if(!suppressPackageStartupMessages(require('rmsfuns'))) {
  install.packages('rmsfuns', dependencies = TRUE, 
                   lib = .pth[1], INSTALL_opts = '--no-lock')
  suppressPackageStartupMessages(require('rmsfuns'))
}

if(!suppressPackageStartupMessages(require('devtools'))) {
  install.packages('devtools', dependencies = TRUE, 
                   lib = .pth[1], INSTALL_opts = '--no-lock')
  devtools::install_github('r-lib/devtools')
  suppressPackageStartupMessages(require('devtools'))
}
conflicted::conflict_prefer('check', 'devtools', quiet = TRUE)

if(!suppressPackageStartupMessages(require('startup'))) {
  ## https://github.com/HenrikBengtsson/startup
  remotes::install_github('HenrikBengtsson/startup', ref = 'develop')
  suppressPackageStartupMessages(require('startup'))
}

if(!suppressPackageStartupMessages(require('Rdym'))) {
  devtools::install_github('wrathematics/Rdym')
  suppressPackageStartupMessages(require('Rdym'))
}

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
if(!suppressPackageStartupMessages(require('rprofile'))) {
  remotes::install_github('csgillespie/rprofile')
  suppressPackageStartupMessages(require('rprofile'))
}

if(!suppressPackageStartupMessages(require('prompt'))) {
  # Used for nice prompts
  remotes::install_github('gaborcsardi/prompt')
  suppressPackageStartupMessages(require('prompt'))
}

if(!suppressPackageStartupMessages(require('colorout'))) {
  # Used for nice colours in the terminal; not for Windows
  remotes::install_github('jalvesaq/colorout')
  suppressPackageStartupMessages(require('colorout'))
}

if(!suppressPackageStartupMessages(require('tidyverse'))) {
  devtools::install_github('tidyverse/tidyverse')
  suppressPackageStartupMessages(require('tidyverse'))
}

if(!suppressPackageStartupMessages(require('lubridate'))) {
  devtools::install_github('tidyverse/lubridate')
  suppressPackageStartupMessages(require('lubridate'))
}

if(!suppressPackageStartupMessages(require('prettycode'))) {
  devtools::install_github('https://github.com/r-lib/prettycode')
  suppressPackageStartupMessages(require('prettycode'))
}

if(!suppressPackageStartupMessages(require('openxlsx2'))) {
  remotes::install_github('JanMarvin/openxlsx2')
  suppressPackageStartupMessages(require('openxlsx2'))
}

## https://github.com/r-lib/crayon
## https://github.com/r-lib/progress
## https://github.com/r-hub/rhub
#library(prettycode, exclude = c('!', 'print'))

suppressPackageStartupMessages(require('dplyr'))
conflicted::conflict_prefer('print', 'base', quiet = TRUE)
conflicted::conflict_prefer('filter', 'dplyr', quiet = TRUE)
conflicted::conflict_prefer('select', 'dplyr', quiet = TRUE)

pkgs <- c('MASS', 'conflicted', 'prettycode', 'crayon', 'progress', 'rhub', 'plyr', 'purrr', 'readr', 'tidyr', 'pryr', 'broom', 'formattable', 'git2r', 'knitr', 'kableExtra', 'data.table', 'tibble', 'tibbletime', 'magrittr', 'forecast', 'fable', 'fabletools', 'usethis', 'tidytuesdayR')
suppressPackageStartupMessages(load_pkg(pkgs))
rm(pkgs)

## -------------------------------------------------------------------

## https://stackoverflow.com/a/17486231/3806250
#.First()
.First <- function() {
  Rdym::RdymEnable()
  #suppressPackageStartupMessages(startup::install(path = '/home/englianhu'))
  #suppressPackageStartupMessages(startup::startup(all = TRUE))
}

## =================== Start Up ==================================

# A powerline clone, that also shows the system load average and the current working directory.
if (interactive()) prompt::set_prompt(prompt::new_prompt_powerline())

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
if (interactive() && suppressPackageStartupMessages(requireNamespace('rprofile'))) {
  
  # Only useful if you use Makefiles
  rprofile::create_make_functions()
  
  # Startup options
  rprofile::set_startup_options()
  
  # Not RStudio console
  if (rprofile::is_terminal()) {
    # https://github.com/csgillespie/rprofile/blob/master/R/set-terminal.R
    rprofile::set_terminal()
  } else {
    rprofile::set_rstudio()
  }
  
  .env = rprofile::set_functions()
  suppressMessages(attach(.env))
  # Display wifi and no of R sessions
  # Linux only
  suppressWarnings(rprofile::set_startup_info())
}

## -------------------------------------------------------------------------

# Prints RStudio project on start-up
setHook('rstudio.sessionInit', function(newSession) {
  active_rproj = rprofile::get_active_rproj()
  if (!is.null(active_rproj)) {
    base::message(glue::glue("{crayon::yellow('R-project:')} {active_rproj}"))
  }
}, action = 'append')

#rmsfuns::suppressPackageStartupMessages(.First())
tryCatch(suppressWarnings(startup::startup(all = TRUE)), 
         error = function(ex) 
           base::message('.Rprofile error: ', 
                         base::conditionMessage(ex)))

