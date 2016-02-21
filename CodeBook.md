## Coursera DataSciences Exploratory Data Analysis Course Project 2 - Code Book

The purpose of this document is to describe the Data Files and the steps included to draw plots

### Data Description
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. 
In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. 
Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI).

EPA National Emissions Website :- http://www.epa.gov/air-emissions-inventories/national-emissions-inventory

The data for this assignment are available from the course web site as a single zip file:

"Data for Peer Assessment.zip"

The zip file contains two files:

#####PM2.5 Emissions Data (summarySCC_PM25.rds): 

This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.

#######Column Descriptions

- fips: A five-digit number (represented as a string) indicating the U.S. county
- SCC: The name of the source as indicated by a digit string (see source code classification table)
- Pollutant: A string indicating the pollutant
- Emissions: Amount of PM2.5 emitted, in tons
- type: The type of source (point, non-point, on-road, or non-road)
- year: The year of emissions recorded

#####Source Classification Code Table (Source_Classification_Code.rds):
This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific. 
For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.



### Implementation Steps

Implementation is broken down into six files to answer each question.
Each file can run by itself, loads the required data summarized it based on the question and presents the plot output as a png file.

Files are loaded using the readRDS() function in R.

1. plot1.R - Plot Total P2.5 Emissions in US from 1999 to 2008 - Output plot1.png
2. plot2.R - Total P2.5 Emissions in Baltimore City, Maryland from 1999 to 2008 - Output plot2.png
3. plot3.R - Total P2.5 Emissions by Source in Baltimore City, Maryland from 1999 to 2008 - Output plot3.png
4. plot4.R - Total P2.5 Emissions Coal Combustion Sources (Category Level Four) from 1999 to 2008 - Output plot4.png 
5. plot5.R - Total P2.5 Emissions Motor Vehicle Sources (Category Level 2) for Baltimore City from 1999 to 2008 - Output plot5.png
6. plot6.R - Total P2.5 Emissions Motor Vehicle Sources Los Angeles Vs Baltimore City from 1999 to 2008 - Output plot6.png
