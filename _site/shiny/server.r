server <- function(input, output){
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins +1)
    hist(x, breaks = bins, col= "#75AADB", border = "white",
         xlab = "waiting time till next (in min)",
         main = "histogram of waiting times")
  })
}