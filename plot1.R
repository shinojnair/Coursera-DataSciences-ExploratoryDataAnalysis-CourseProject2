## Plot 1 - Task Statement
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##      Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
##      for each of the years 1999, 2002, 2005, and 2008.

## Load dplyr Library
library(dplyr)

## Load the PM2.5 Emissions Data for years 1999, 2002, 2005, 2008
NEI <- readRDS("summarySCC_PM25.rds")

## Summarize the data by finding total PM2.5 emissions by the year
SummarizedData <- NEI %>%
        group_by(year) %>%
        summarise(total = sum(Emissions)) 

## Open PNG device
png("plot1.png", width = 480, height = 480)

## Barplot with labels and titles
barplot(
        SummarizedData$total
        , names.arg = SummarizedData$year
        , xlab = "Year"
        , ylab = "Total PM2.5 Emission"
        , main = "Total P2.5 Emissions in US from 1999 to 2008"
        )

## Close the device
dev.off()
