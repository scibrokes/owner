sudo su - -c "R -e \"remotes::install_github('HenrikBengtsson/startup', ref = 'develop')\""
sudo su - -c "R -e \"devtools::install_github('wrathematics/Rdym')\""
sudo su - -c "R -e \"remotes::install_github('gaborcsardi/prompt')\""
sudo su - -c "R -e \"remotes::install_github('jalvesaq/colorout')\""
sudo su - -c "R -e \"remotes::install_github('csgillespie/rprofile')\""

with_config(use_proxy('52.55.211.119', 8080), install_github('jalvesaq/colorout'))
54.221.78.73
52.55.211.119
20.205.243.168

sudo su - -c "R -e \"install.packages('devtools', repos='https://cran.rstudio.org', lib='/usr/lib/R/library', dependencies = c('Depends', 'Imports'), INSTALL_opts = '--no-lock')\""

sudo su - -c "R -e \"pkgs <- c('ghit', 'rstanarm', 'beyesplot'); BBmisc::lib(pkgs)\""

# we recommend running this is a fresh R session or restarting your current session
sudo su - -c "R -e \"install.packages(c('ghit', 'rstanarm', 'beyesplot'), repos = c('https://mc-stan.org/r-packages/'), lib='/usr/lib/R/library', dependencies = c('Depends', 'Imports'), INSTALL_opts = '--no-lock')\""

sudo su - -c "R -e \"remotes::install_github('stan-dev/cmdstanr')\""
sudo su - -c "R -e \"install.packages('rstanarm', repos = c('https://mc-stan.org/r-packages', getOption('repos')))\""

sudo su - -c "R -e \"install.packages(c('splashr', ''), repos='https://cran.rstudio.org', lib='/usr/lib/R/library', dependencies = c('Depends', 'Imports'), INSTALL_opts = '--no-lock')\""

sudo su - -c "R -e \"install.packages(c('languageserver'), repos='http://R-Forge.R-project.org', lib='/usr/lib/R/library', dependencies = c('Depends', 'Imports'), INSTALL_opts = '--no-lock')\""

sudo su - -c "R -e \"devtools::install_github('stan-dev/rstanarm', INSTALL_opts = '--no-multiarch', force = TRUE)\""

sudo su - -c "R -e \"devtools::install_github('stan-dev/rstanarm', INSTALL_opts = '--no-lock', force = TRUE)\""

install.packages('rstanarm', repos = c('https://mc-stan.org/r-packages/', getOption('repos')))

sudo su - -c "R -e \"devtools::update_packages()\""
sudo su - -c "R -e \"update.packages(ask=FALSE)\""

----------------------------------


- Run these two commands in your terminal to add Homebrew to your PATH:
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/englianhu/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
- Install Homebrew's dependencies if you have sudo access:
    sudo apt-get install build-essential
  For more information, see:
    https://docs.brew.sh/Homebrew-on-Linux
- We recommend that you install GCC:
    brew install gcc
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh
    
    

