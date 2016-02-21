## Plot 4 - Task Statement
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

## Load dplyr Library
library(dplyr)

## Load the PM2.5 Emissions Data for years 1999, 2002, 2005, 2008
NEI <- readRDS("summarySCC_PM25.rds")
## Load Soure Specification Code Data
SCC <- readRDS("Source_Classification_Code.rds")

## Filter the Sources based on presence of Coal in specific categoty SCC.Level.Four
CoalCombSrc <- SCC %>%
                        filter(grepl('Coal', SCC.Level.Four, ignore.case = TRUE)) %>%
                        select(SCC, SCC.Level.Four)

## Merge the Coal Source id with the Source id in the Emissions data to filter out only
##      coal related 
NEICoalSrc <- merge(NEI, CoalCombSrc, by.x = "SCC", by.y = "SCC")

## Summarize the data by finding total PM2.5 emissions by the year
SummarizedData <- NEICoalSrc %>%
                                group_by(year) %>%
                                summarise(total = sum(Emissions)) 

## Open PNG device
png("plot4.png", width = 800, height = 600)


## Barplot with labels and titles for Coal combusison related sources
barplot(
        SummarizedData$total
        , names.arg = SummarizedData$year
        , xlab = "Year"
        , ylab = "Total PM2.5 Emission"
        , main = "Total P2.5 Emissions Coal Combustion Sources (Category Level Four) from 1999 to 2008"
)

## Close the device  
dev.off()
