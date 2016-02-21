## Plot 2 - Task Statement
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
##      from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Load dplyr Library
library(dplyr)

## Load the PM2.5 Emissions Data for years 1999, 2002, 2005, 2008
NEI <- readRDS("summarySCC_PM25.rds")

## Summarize the data by finding total PM2.5 emissions by the year
##      only for Baltimore City, Maryland (fips == "24510")
SummarizedData <- NEI %>%
                        filter(fips == "24510")%>%        
                        group_by(year) %>%
                        summarise(total = sum(Emissions)) 

## Open PNG device
png("plot2.png", width = 600, height = 480)

## Barplot with labels and titles
barplot(
        SummarizedData$total
        , names.arg = SummarizedData$year
        , xlab = "Year"
        , ylab = "Total PM2.5 Emission"
        , main = "Total P2.5 Emissions in Baltimore City, Maryland from 1999 to 2008"
        )

## Close the device
dev.off()
