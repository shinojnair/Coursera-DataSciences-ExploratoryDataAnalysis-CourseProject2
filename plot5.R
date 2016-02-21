## Plot 5 - Task Statement
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

## Load dplyr Library
library(dplyr)

## Load the PM2.5 Emissions Data for years 1999, 2002, 2005, 2008
NEI <- readRDS("summarySCC_PM25.rds")
## Load Soure Specification Code Data
SCC <- readRDS("Source_Classification_Code.rds")

## Filter the Sources based on presence of Vehicle in specific categoty SCC.Level.Two
CoalCombSrc <- SCC %>%
                        filter(grepl('Vehicle', SCC.Level.Two, ignore.case = TRUE)) %>%
                        select(SCC, SCC.Level.Two)

## Merge the Coal Source id with the Source id in the Emissions data to filter out only
##      vehicle related sources
NEICoalSrc <- merge(NEI, CoalCombSrc, by.x = "SCC", by.y = "SCC")

## Summarize the data by finding total PM2.5 emissions by the year
##      only for Baltimore City, Maryland (fips == "24510")
SummarizedData <- NEICoalSrc %>%
                                filter(fips == "24510")%>% 
                                group_by(year) %>%
                                summarise(total = sum(Emissions)) 

## Open PNG device
png("plot5.png", width = 800, height = 600)


## Barplot with labels and titles for Coal combusison related sources
barplot(
        SummarizedData$total
        , names.arg = SummarizedData$year
        , xlab = "Year"
        , ylab = "Total PM2.5 Emission"
        , main = "Total P2.5 Emissions Motor Vehicle Sources (Category Level 2) for Baltimore City from 1999 to 2008"
)

## Close the device  
dev.off()
