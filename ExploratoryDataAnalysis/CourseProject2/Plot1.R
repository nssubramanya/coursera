################################################################################
#   Plot1.R
#
#   Question 1
#   ==========
#   Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?  
#   Using the base plotting system, make a plot showing the total PM2.5 emission 
#   from all sources for each of the years 1999, 2002, 2005, and 2008.
#
################################################################################

# Load Libraries
library(dplyr) # For Data manipulation

# Dataset is first downloaded & Un-zipped to get the .RDS files
# Load the data from the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Minor Format changes
NEI$SCC <- factor(NEI$SCC)
NEI$fips <- factor(NEI$fips)
NEI$Pollutant <- factor(NEI$Pollutant)
NEI$type <- factor(NEI$type)

# Determine Yearly Total Emissions
pm25_yearly <- NEI %>% group_by(year) %>% summarize(total=sum(Emissions))

png (filename="plot1.png", width=480, height=480, units="px")
barplot(height=pm25_yearly$total/1000, names.arg=pm25_yearly$year, col="red", 
        xlab="Year", ylab="PM2.5 (kilo tonnes)", 
        main="Total PM2.5 from 1999 to 2008", ylim=c(0, 8000))
dev.off()

