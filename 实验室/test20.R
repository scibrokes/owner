## https://stackoverflow.com/a/70093686/3806250

library(shiny)
library(shinydashboard)

ui <- function(request) {
  dashboardPage(
    header = dashboardHeader(title = "Simple tabs"),
    sidebar = dashboardSidebar(
      sidebarMenu(
        id = "sidebarID",
        menuItem(
          "Dashboard",
          tabName = "dashboard",
          icon = icon("tachometer-alt")
        ),
        menuItem(
          "Widgets",
          icon = icon("th"),
          tabName = "widgets",
          badgeLabel = "🚧",
          badgeColor = "blue"
        )
      )
    ),
    body = dashboardBody(tabItems(
      tabItem(tabName = "dashboard",
              h2("Dashboard tab content")),
      tabItem(tabName = "widgets",
              h2("Widgets tab content"))
    ))
  )
}


server <- function(input, output, session) {
  bookmarkingWhitelist <- c("sidebarID")
  
  observe({
    setBookmarkExclude(setdiff(names(input), bookmarkingWhitelist))
  })
  
  observeEvent(input$sidebarID, {
    # http://127.0.0.1:6172/?_inputs_&sidebarID=%22dashboard%22
    # http://127.0.0.1:6172/?_inputs_&sidebarID=%22widgets%22
    
    newURL <- paste0(
        session$clientData$url_protocol,
        "//",
        session$clientData$url_hostname,
        ":",
        session$clientData$url_port,
        session$clientData$url_pathname,
        "?_inputs_&sidebarID=%22",
        input$sidebarID,
        "%22"
      )
    
    updateQueryString(newURL,
                      mode = "replace",
                      session)
  })
}

shinyApp(ui, server, enableBookmarking = "url")
