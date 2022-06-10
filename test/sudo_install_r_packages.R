sudo su - -c "R -e \"remotes::install_github('HenrikBengtsson/startup', ref = 'develop')\""
sudo su - -c "R -e \"devtools::install_github('wrathematics/Rdym')\""
sudo su - -c "R -e \"remotes::install_github('gaborcsardi/prompt')\""
sudo su - -c "R -e \"remotes::install_github('jalvesaq/colorout')\""
sudo su - -c "R -e \"remotes::install_github('csgillespie/rprofile')\""

with_config(use_proxy('52.55.211.119', 8080), install_github('jalvesaq/colorout'))
54.221.78.73
52.55.211.119
20.205.243.168

sudo su - -c "R -e \"install.packages(c('data.table'), repos='https://cran.rstudio.org', getOption('repos'), lib='/usr/lib/R/library', dependencies = TRUE, INSTALL_opts = '--no-lock')\""

sudo su - -c "R -e \"pkgs <- c('ghit', 'rgeos', 'geojson', 'geojsonio', 'geojsonlint', 'geojsonio', 'geojsonlint', 'sf', 'rmapshaper', 'raster', 'gdistance', 'crawl', 'momentuHMM', 'mosaic', 'devtools', 'lubridate', 'knitr', 'markdown', 'rmarkdown', 'REmap', 'ggmap', 'RgoogleMaps'); BBmisc::lib(pkgs)\""

----------------------------------

Title: ®γσ, ξηg Lιαη Ημ (tw)

®γσ, ξηg Lιαη Ημ 
Curriculum Vitae (tw)

http://rpubs.com/englianhu/ryo-tw

----------------------------------

Title: ®γσ, ξηg Lιαη Ημ (jp)

®γσ, ξηg Lιαη Ημ
Curriculum Vitae (jp)

http://rpubs.com/englianhu/ryo-jp

----------------------------------

Title: ®γσ, ξηg Lιαη Ημ (en)

®γσ, ξηg Lιαη Ημ
Curriculum Vitae (en)

http://rpubs.com/englianhu/ryo-en

----------------------------------

Title: ®γσ, ξηg Lιαη Ημ (cn)

®γσ, ξηg Lιαη Ημ 
Curriculum Vitae (cn)

http://rpubs.com/englianhu/ryo-cn

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
    
    

