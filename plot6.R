## Plot 6 - Task Statement
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
##      in Los Angeles County, California (fips == "06037"). 
#       Which city has seen greater changes over time in motor vehicle emissions

## Load dplyr and ggplot2 Librarys
library(dplyr)
library(ggplot2)

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
##      for Baltimore City, Maryland (fips == "24510") and Los Angeles (fips == "06037")
##      Add a column to identify city
SummarizedData <- NEICoalSrc %>%
                                filter(fips == "24510" | fips == "06037")%>% 
                                group_by(fips,year) %>%
                                summarise(total = sum(Emissions)) %>%
                                mutate(City = ifelse(fips == "24510", "Baltimore", "Los Angeles")) 

## Open PNG device
png("plot6.png", width = 800, height = 600)

## Plot bar graph by city show the change trends
ggplot(SummarizedData, aes(year, total)) + 
        geom_bar(stat = "identity") + 
        facet_grid(. ~ City) + 
        geom_smooth(method = "lm", col = "red", se=FALSE) + 
        ggtitle("Total P2.5 Emissions Motor Vehicle Sources Los Angeles Vs Baltimore City from 1999 to 2008") +
        theme(plot.title = element_text(lineheight=3, face="bold", color="black", size=15)) +
        xlab("Year") + 
        ylab("Total PM2.5 Emission")

## Close the device  
dev.off()