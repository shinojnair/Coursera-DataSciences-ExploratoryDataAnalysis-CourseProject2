## Plot 3 - Task Statement
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##      which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##      Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a 
##      plot answer this question.

## Load dplyr and ggplot2 Librarys
library(dplyr)
library(ggplot2)

## Load the PM2.5 Emissions Data for years 1999, 2002, 2005, 2008
NEI <- readRDS("summarySCC_PM25.rds")

## Summarize the data by finding total PM2.5 emissions by the year and source
##      only for Baltimore City, Maryland (fips == "24510")
SummarizedData <- NEI %>%
                        filter(fips == "24510")%>%        
                        group_by(year, type) %>%
                        summarise(total = sum(Emissions)) %>%
                        arrange(year, type)

## Open PNG device
png("plot3.png", width = 800, height = 600)

## Plot line for each source and draw a regression line to show increase or decrease for each source
##      Format with title and labels and increase size of title and bold
ggplot(SummarizedData, aes(year, total)) + 
        geom_line() + 
        facet_grid(. ~ type) + 
        geom_smooth(method = "lm", col = "red") + 
        ggtitle("Total P2.5 Emissions by Source in Baltimore City, Maryland from 1999 to 2008") +
        theme(plot.title = element_text(lineheight=3, face="bold", color="black", size=15)) +
        xlab("Year") + 
        ylab("Total PM2.5 Emission")

## Close the device  
dev.off()
