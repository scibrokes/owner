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

## ======================== Micro Editor ===================================

## https://www.tecmint.com/micro-linuxtext-editor-with-syntax-highlighting/
## Micro – A Modern Terminal Based Text Editor with Syntax Highlighting

## ============================= PATH ======================================
#system('sudo chmod +rwx /usr/lib/R')

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

## ======================== Micro Editor ===================================

## https://www.tecmint.com/micro-linuxtext-editor-with-syntax-highlighting/
## Micro – A Modern Terminal Based Text Editor with Syntax Highlighting

## ============================= PATH ======================================
#system('sudo chmod +rwx /usr/lib/R')

.pth <- .libPaths(c('/cloud/lib/R/library', '/cloud/lib/R/site-library'))
.libPaths(.pth)

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
## ------------------------------------------------------------------

## We set the cloud mirror, which is 'network-close' to everybody, as default
local({
  r <- getOption('repos')
  r['CRAN'] <- 'https://cloud.r-project.org'
  options(repos = r)
})

## ==================== Load Packages ===============================

suppressPackageStartupMessages(require('utils'))

if(!suppressPackageStartupMessages(require('rmsfuns'))) {
  install.packages('rmsfuns', dependencies = TRUE, 
                   INSTALL_opts = '--no-lock')
}
suppressPackageStartupMessages(require('rmsfuns'))

if(!suppressPackageStartupMessages(require('devtools'))) {
  install.packages('devtools', dependencies = TRUE, 
                   INSTALL_opts = '--no-lock')       
  devtools::install_github('r-lib/devtools')
}

if(!suppressPackageStartupMessages(require('startup'))) {
  ## https://github.com/HenrikBengtsson/startup
  remotes::install_github('HenrikBengtsson/startup', ref = 'develop')
}

if(!suppressPackageStartupMessages(require('Rdym'))) {
  devtools::install_github('wrathematics/Rdym')
}

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
if(!suppressPackageStartupMessages(require('rprofile'))) {
  remotes::install_github('csgillespie/rprofile')
}

if(!suppressPackageStartupMessages(require('prompt'))) {
  # Used for nice prompts
  remotes::install_github('gaborcsardi/prompt')
}

if(!suppressPackageStartupMessages(require('colorout'))) {
  # Used for nice colours in the terminal; not for Windows
  remotes::install_github('jalvesaq/colorout')
}

if(!suppressPackageStartupMessages(require('tidyverse'))) {
  devtools::install_github('tidyverse/tidyverse')
}

if(!suppressPackageStartupMessages(require('lubridate'))) {
  devtools::install_github('tidyverse/lubridate')
}

if(!suppressPackageStartupMessages(require('prettycode'))) {
  devtools::install_github('https://github.com/r-lib/prettycode')
}

#library(prettycode, exclude = c('!', 'print'))
pkgs <- c('MASS', 'devtools', 'lubridate', 'tidyverse', 'rprofile', 'prompt', 
          'colorout', 'Rdym', 'startup', 'conflicted', 'prettycode')
suppressPackageStartupMessages(load_pkg(pkgs))
rm(pkgs)

conflicted::conflict_prefer('print', 'base', quiet=TRUE)

## -------------------------------------------------------------------

## https://stackoverflow.com/a/17486231/3806250
#.First()
.First <- function() {
  Rdym::RdymEnable()
  suppressPackageStartupMessages(startup::install(path = '/home/englianhu'))
  suppressPackageStartupMessages(startup::startup(all = TRUE))
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
tryCatch(suppressWarnings(startup::startup(all = TRUE)), error=function(ex) 
  base::message('.Rprofile error: ', base::conditionMessage(ex)))



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
## ------------------------------------------------------------------

## We set the cloud mirror, which is 'network-close' to everybody, as default
local({
  r <- getOption('repos')
  r['CRAN'] <- 'https://cloud.r-project.org'
  options(repos = r)
})

## ==================== Load Packages ===============================

suppressPackageStartupMessages(require('utils'))

if(!suppressPackageStartupMessages(require('rmsfuns'))) {
  install.packages('rmsfuns', dependencies = TRUE, 
                   INSTALL_opts = '--no-lock')
}
suppressPackageStartupMessages(require('rmsfuns'))

if(!suppressPackageStartupMessages(require('devtools'))) {
  install.packages('devtools', dependencies = TRUE, 
                   INSTALL_opts = '--no-lock')       
  devtools::install_github('r-lib/devtools')
}

if(!suppressPackageStartupMessages(require('startup'))) {
  ## https://github.com/HenrikBengtsson/startup
  remotes::install_github('HenrikBengtsson/startup', ref = 'develop')
}

if(!suppressPackageStartupMessages(require('Rdym'))) {
  devtools::install_github('wrathematics/Rdym')
}

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
if(!suppressPackageStartupMessages(require('rprofile'))) {
  remotes::install_github('csgillespie/rprofile')
}

if(!suppressPackageStartupMessages(require('prompt'))) {
  # Used for nice prompts
  remotes::install_github('gaborcsardi/prompt')
}

if(!suppressPackageStartupMessages(require('colorout'))) {
  # Used for nice colours in the terminal; not for Windows
  remotes::install_github('jalvesaq/colorout')
}

if(!suppressPackageStartupMessages(require('tidyverse'))) {
  devtools::install_github('tidyverse/tidyverse')
}

if(!suppressPackageStartupMessages(require('lubridate'))) {
  devtools::install_github('tidyverse/lubridate')
}

if(!suppressPackageStartupMessages(require('prettycode'))) {
  devtools::install_github('https://github.com/r-lib/prettycode')
}

#library(prettycode, exclude = c('!', 'print'))
pkgs <- c('MASS', 'devtools', 'lubridate', 'tidyverse', 'rprofile', 'prompt', 
          'colorout', 'Rdym', 'startup', 'conflicted', 'prettycode')
suppressPackageStartupMessages(load_pkg(pkgs))
rm(pkgs)

conflicted::conflict_prefer('print', 'base', quiet=TRUE)

## -------------------------------------------------------------------

## https://stackoverflow.com/a/17486231/3806250
#.First()
.First <- function() {
  Rdym::RdymEnable()
  suppressPackageStartupMessages(startup::install(path = '/home/englianhu'))
  suppressPackageStartupMessages(startup::startup(all = TRUE))
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
tryCatch(suppressWarnings(startup::startup(all = TRUE)), error=function(ex) 
  base::message('.Rprofile error: ', base::conditionMessage(ex)))

