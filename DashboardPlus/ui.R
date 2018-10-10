
source("util.R")
ui = dashboardPagePlus(
  dashboardHeaderPlus(
    fixed = TRUE,
    title = "LaGuardia Family",
    enable_rightsidebar = TRUE,
    rightSidebarIcon = "bars",
    
    dropdownMenu(
      type = "tasks", 
      badgeStatus = "danger",
      taskItem(value = 20, color = "aqua", "Refactor code"),
      taskItem(value = 40, color = "green", "Design new layout"),
      taskItem(value = 60, color = "yellow", "Another task"),
      taskItem(value = 80, color = "red", "Write documentation")
    )
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Profiles", tabName = "header",
               badgeLabel = "new", badgeColor = "green",
               icon = icon("folder-open")),
      menuItem("Code Share", tabName = "rightsidebar",
                badgeColor = "green",
                icon = icon("gears"))
      
    )
  ),
  dashboardBody(
    setShadow("dropdown-menu"),
    shiny::tags$head(
      shiny::tags$style(
        rel = "stylesheet",
        type = "text/css",
        href = "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/qtcreator_dark.min.css"
      ),
      
      shiny::tags$script(
        src = "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"
      )
      
    ),
    
    tabItems(
      
      tabItem(
        tabName = "rightsidebar",
        
        br(),
        column(
          width = 12,
          #align = "center",
          h2("Code Sharing")
        ),
        br(),
        
        h4("Code Share"),
        aceEditor(
          theme = "vibrant_ink",
          mode = "r",
          height = "600px",
          outputId = "rightsidebar_code",
          readOnly = TRUE,
          value = paste(style_text('library(shiny)
                                   library(shinydashboard)
                                   '), collapse = "\n")
          )
          ),
      
      tabItem(
        tabName = "header",
        br(),
        column(
          width = 12#,
          #align = "center"
        ),
        br(),
        box(
          title = "Data Scientist",
          status = "primary",
          height = "310px",
          #collapsible = TRUE,
          boxProfile(
            src = "Profile.png",
            title = "Juan Carlos LaGuardia",
            #subtitle = "Data Scientist",
            boxProfileItemList(
              bordered = TRUE,
              boxProfileItem(
                title = "Kaiser Permanente",
                description = "2009 - Present"
              ),
              boxProfileItem(
                title = "UC Sata Cruz",
                description = "2006 - 2009"
              )
            )
          )
        ),
        box(
          title = "Meterologist",
          status = "primary",
          collapsible = TRUE,
          boxProfile(
            src = "youngnat1.png",
            title = "Natalie LaGuardia",
            #subtitle = "Meteorologist",
            boxProfileItemList(
              bordered = TRUE,
              boxProfileItem(
                title = "Bay Area Air Quality Management",
                description = "2016 - Present"
              ),
              boxProfileItem(
                title = "Sonoma Technology",
                description = "2010 - 2016"
              )
            )
          )
        ),
        box(
          title = "Son",
          status = "primary",
          collapsible = TRUE,
          boxProfile(
            src = "milo.png",
            title = "Milo LaGuardia",
            #subtitle = "Son",
            boxProfileItemList(
              bordered = TRUE,
              boxProfileItem(
                title = "Nomura",
                description = "July 2018 - Present"
              ),
              boxProfileItem(
                title = "Luci's Day Care",
                description = "2016 - 2018"
              )
            )
          )
        ),
        box(
          title = "Cats",
          status = "primary",
          collapsible = TRUE,
          boxProfile(
            src = "Chalky.png",
            title = "Chalky and Shiva",
            #subtitle = "Cats",
            boxProfileItemList(
              bordered = TRUE,
              boxProfileItem(
                title = "Golden Gate Ave",
                description = "Dec 2010 - Present"
              )
            )
          )
        )
        
        )
        )
      )
  )
