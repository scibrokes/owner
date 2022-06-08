remapC <- function (data, maptype = "china", markLineData = NULL, markPointData = NULL, 
          color = c("#1e90ff", "#f0ffff"), theme = get_theme("Bright"), 
          title = "", subtitle = "", markLineTheme = markLineControl(), 
          markPointTheme = markPointControl(), geoData = NA, mindata = NA, 
          maxdata = NA) {
  if (.Platform$OS.type == "windows") {
    locate = Sys.getlocale("LC_CTYPE")
    Sys.setlocale("LC_CTYPE", "eng")
  }
  
  if (!is.data.frame(data)) {
    stop("Map data should be a data frame.")
  }
  
  data = na.omit(data)
  if (ncol(data) < 2 | nrow(data) == 0) {
    stop("Data should have at least 2 columns and 1 row")
  }
  
  if (!is.character(data[1, 1])) {
    data[, 1] = as.character(data[, 1])
  }
  
  if (!is.numeric(data[1, 2])) {
    stop("Column 2 should be numeric!")
  }
  
  maptype = checkMapName(maptype)
  mapnames = mapNames(mapType = maptype)
  if (is.null(data$tooltip)) {
    mapCVec = apply(data, 1, function(x) paste0("{name:'", 
                                                x[1], "',value:", x[2], "}"))
  } else {
    mapCVec = apply(data, 1, function(x) paste0("{name:'", 
                                                x[1], "',value:", x[2], ",tooltipValue:", x[3], "}"))
  }
  mapCData = paste(mapCVec, collapse = ",\n\t\t")
  if (class(color) != "character") {
    stop("Color should be a character object!")
  }
  if (length(color) == 1) {
    color = c(color, "white")
  }
  ColorData = paste0("['", paste(color, collapse = "', '"), "']")
  if (is.na(maxdata)) {
    maxData = round(max(data[, 2]) + (max(data[, 2]) - min(data[, 2]))/15)
  } else {
    maxData = maxdata
  }
  if (is.na(mindata)) {
    minData = round(min(data[, 2]) - (max(data[, 2]) - min(data[, 2]))/15)
  } else {
    minData = mindata
  }
  markLineLogi = (length(dim(markLineData)) == 2)
  markPointLogi = class(markPointData) != "logical"
  geoDataLogi = class(geoData) != "logical"
  
  ## ------------------------------------------------------
  if (all(markLineLogi & markPointLogi & !geoDataLogi)) {
    cityNames = c(as.character(markLineData[, 1]), as.character(markLineData[, 2]))
    if (is.data.frame(markPointData)) {
      cityNames = c(cityNames, as.character(markPointData[, 1]))
    } else {
      cityNames = c(cityNames, as.character(markPointData))
    }
    geoData = get_geo_position(unique(cityNames))
  }
  if (is.null(markLineData)) {
    markLineData = ""
  } else {
    markLineData = markLineStr(markLineData, markLineTheme, geoData)
  }
  if (is.null(markPointData)) {
    markPointData = ""
  } else {
    markPointData = markPointStr(markPointData, markPointTheme, 
                                 geoData)
  }
  if (maptype == "world") {
    theme$labelShow = "false"
  }
  output = new("remap")
  output@id = paste("ID", format(Sys.time(), "%Y%m%d%H%M%S"), 
                    round(proc.time()[3] * 100), sep = "_")
  output@theme = theme
  output@maptype = "SVG"
  output@option = html.data.C$option
  head = html.data.C$head
  foot = html.data.C$foot
  if (.Platform$OS.type == "windows") {
    Sys.setlocale("LC_CTYPE", "chs")
  }
  output@option = sub("forChange", "一",uoutput@option)
  output@option = sub("labelShowData", theme$labelShow, output@option)
  output@option = sub("pointShowData", theme$pointShow, output@option)
  output@option = sub("pointColorData", theme$pointColor, output@option)
  output@option = gsub("backgroundColorData", theme$backgroundColor, 
                       output@option)
  output@option = sub("titleData", title, output@option)
  output@option = sub("subtitleData", subtitle, output@option)
  output@option = gsub("titleColorData", theme$titleColor, 
                       output@option)
  output@option = sub("minData", minData, output@option)
  output@option = sub("maxData", maxData, output@option)
  output@option = sub("colorData", ColorData, output@option)
  output@option = sub("mapTypeData", maptype, output@option)
  output@option = sub("borderColorData", theme$borderColor, 
                      output@option)
  output@option = sub("mapCData", mapCData, output@option)
  output@option = sub("//markLineData", markLineData, output@option)
  output@option = sub("//markPointData", markPointData, output@option)
  outputHead = sub("optionNameData", paste0("option", output@id), 
                   head)
  outputFoot = sub("optionNameData", paste0("option", output@id), 
                   foot)
  output@option = strsplit(output@option, "kkkmmm")[[1]][2]
  output@content = paste(outputHead, output@option, outputFoot, 
                         sep = "\n")
  if (.Platform$OS.type == "windows") {
    Sys.setlocale("LC_CTYPE", locate)
  }
  return(output)
}

### =====================================================

## 读取从maps::world.cities程序包翻译并储存中文地名文件
#source('data/geoname.R')
经纬度 <- read_csv('data/地图数据.csv', show_col_types = FALSE)

诸国 <- 经纬度$国家 |> 
  unique()

## 随即设置区域号
随机国号 <- data.frame(
  国家 = 诸国, 
  国号 = 5 * sample(length(诸国)) + 200)

## 城镇矢量
诸城镇 <- 经纬度$城镇

## 城镇经纬度
经纬度 <- 经纬度 |> 
  dplyr::select(经度, 纬度, 城镇) #因为呈现出来的夜光导航图只显示地名和随机国号，故此文件名、纬经度并无翻译为繁体

## 描画彩色霓虹导航线
夜光导航线 <- data.frame(
  出发点 = rep('郑州市', (nrow(经纬度) - 1)), 
  抵达点 = 经纬度$城镇[!经纬度$城镇 %in% '郑州市'])

data = 随机国号; maptype = 'world'; markLineData = 夜光导航线; markPointData = 诸城镇; 
color = c('black', 'black'); theme = get_theme(backgroundColor = 'black'); 
title = '量化圈'; subtitle = '金融计量经济学'; markLineTheme = markLineControl(); 
markPointTheme = markPointControl(); geoData = 经纬度; mindata = NA; maxdata = NA


## 绘制 REmap 夜光导航图 
夜光导航图 <- remapC(随机国号, maptype = 'world', 
                    color = c('black', 'black'),
                    theme = get_theme(backgroundColor = 'black'), 
                    title = '量化圈', subtitle = '金融计量经济学', 
                    markPointData = 诸城镇, markLineData = 夜光导航线, 
                    geoData = 经纬度)
knitrREmap(夜光导航图, local = FALSE)


### =====================================================

mapdata; title = ""; subtitle = ""; theme = get_theme("Dark")





expect_length <- function(object, n) {
  # 1. Capture object and label
  act <- quasi_label(rlang::enquo(object), arg = "object")
  
  # 2. Call expect()
  act$n <- length(act$val)
  expect(
    act$n == n,
    sprintf("%s has length %i, not length %i.", act$lab, act$n, n)
  )
  
  # 3. Invisibly return the value
  invisible(act$val)
}

lib('testthat', 'usethis', 'withr')
expect_length <- function(object, n) {
  act <- quasi_label(rlang::enquo(object), arg = "object")
  
  act$n <- length(act$val)
  if (act$n == n) {
    succeed()
    return(invisible(act$val))
  }
  
  message <- sprintf("%s has length %i, not length %i.", act$lab, act$n, n)
  fail(message)
}

mtcars %>%
  expect_type("list") %>%
  expect_s3_class("data.frame") %>% 
  expect_length(11)





