server <- function(input, output){
  #get the data for each dataset
  beerDF <- read.csv('..\\datasets\\Beers.csv')
  breweriesDF <- read.csv('..\\datasets\\Breweries.csv')
  
  #rename the brewery_id and name columns so we can merge later
  beerDF <- beerDF %>% rename(Brew_ID = 'Brewery_id', Beer_Name = 'Name')
  breweriesDF <- breweriesDF %>% rename(Brew_Name = 'Name')
  
  #merge the data on Brew_ID column name
  beerBrewDF<- merge(beerDF,breweriesDF,by=c("Brew_ID"))
  
  #ibu data  
  allIBU <- repBeerBrewDF %>% select(State, IBU)
  allIBU[allIBU==0] <- NA
  ibuOmit <- na.omit(allIBU)
  
  #abv data
  allABV <- repBeerBrewDF %>% select(State, ABV)
  allABV[allABV==0] <- NA
  abvOmit <- na.omit(allABV)
  #ibu histogram
  output$ibuHPlot <- renderPlot({
        x <- ibuOmit$IBU
        bins <- seq(min(x), max(x), length.out = input$bins+1)
        hist(x, breaks = bins, col= "#75AADB", border = "white",
             xlab = "IBU Values",
             main = "histogram of IBU values")
      })
  
  output$ibuBPlot <- renderPlot({
        x <- ibuOmit$IBU
        bins <- seq(min(x), max(x), length.out = input$bins+1)
        boxplot(x, xlab = "IBU Values", main = "Boxplot of IBU values")
      })

  output$abvHPlot <- renderPlot({
        x <- abvOmit$ABV
        bins <- seq(min(x), max(x), length.out = input$bins+1)
        hist(x, breaks = bins, col= "#75AADB", border = "white",
             xlab = "ABV Values",
             main = "histogram of ABV values")
      })

    output$abvBPlot <- renderPlot({
        x <- abvOmit$ABV
        bins <- seq(min(x), max(x), length.out = input$bins+1)
        boxplot(x, xlab = "ABV Values", main = "Boxplot of ABV values")
      })

}