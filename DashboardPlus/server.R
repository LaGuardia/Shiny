server = function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
  
  output$distPlot2 <- renderPlot({
    hist(rnorm(input$obs2))
  })
  
  output$flipPlot <- renderPlot({
    hist(rnorm(input$flip_obs))
  })
  
  output$data <- renderTable({
    head(mtcars[, c("mpg", input$variable), drop = FALSE])
  }, rownames = TRUE)
  
  output$value <- renderText({input$somevalue})
  
  output$boxSidebarPlot <- renderPlot({
    hist(rnorm(input$slider_boxsidebar))
  })
  
}