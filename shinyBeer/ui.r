library(shiny)
ui <- fluidPage(
  titlePanel("Shiny Beer+Breweries Dataset"), 
  sidebarLayout(
    sidebarPanel(
      checkboxInput("doHist", "Histogram plots", value = T),
      sliderInput(inputId = 'bins',
                  label = "Number of bins:",
                  min = 1, 
                  max = 50, 
                  value = 30)
    ),
    mainPanel(
      fluidRow(
        column(6,plotOutput(outputId="abvHPlot", width="300px",height="300px")),  
        column(6,plotOutput(outputId="abvBPlot", width="300px",height="300px")),
        column(6,plotOutput(outputId="ibuHPlot", width="300px",height="300px")),  
        column(6,plotOutput(outputId="ibuBPlot", width="300px",height="300px"))
        )
    ) #end main panel
  ) # end sidebar
)#end fluid page