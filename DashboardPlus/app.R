ui = dashboardPagePlus(
  dashboardHeaderPlus(
    fixed = TRUE,
    title = "shinydashboardPlus",
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
      menuItem("New rightSidebar", tabName = "rightsidebar",
               badgeLabel = "new", badgeColor = "green",
               icon = icon("gears")),
      menuItem("Improved header", tabName = "header",
               badgeLabel = "new", badgeColor = "green",
               icon = icon("folder-open"))
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
          align = "center",
          h1("rightsideBar(): additional dashboardSidebar!")
        ),
        br(),
        
        h4("To activate the right sidebar, you must replace dashboardPage with
           dashboardPagePlus and dashboardHeader by dashboardHeaderPlus:"),
        
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
          width = 12,
          align = "center",
          h1("Add a left menu in the navbar!")
        ),
        br(),
        
        h4("To activate this feature, you must replace dashboardHeader by dashboardHeaderPlus.
           Pass all your arguments in the left_menu argument. You can also decide whether
           the navbar should be fixed-top or not using the fixed argument. 
           To include custom input elements, such as sliderInput, ... wrap them in a
           dropdownBlock, which was specially built for the left menu."),
        
        aceEditor(
          theme = "vibrant_ink",
          mode = "r",
          outputId = "left_menu_header_code",
          readOnly = TRUE,
          value = paste(
            style_text(
              'library(shiny)
              library(shinyWidgets)'
            ), 
            collapse = "\n"
            )
          ),
        box(
          title = "Profile",
          status = "primary",
          boxProfile(
            src = "/Users/LaGuardia/Shiny/DashboardPlus/www/Profile.png",
            title = "Juan Carlos LaGuardia",
            subtitle = "Data Scientist",
            boxProfileItemList(
              bordered = TRUE,
              boxProfileItem(
                title = "Kaiser Permanente",
                description = "Apr 09 - Present"
              ),
              boxProfileItem(
                title = "UC Sata Cruz",
                description = "Sep 06 - Apr 09"
              )
              )
            )
          )
        
        
          )
    )
  )
)

server = function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
}

shinyApp(ui=ui,server=server)