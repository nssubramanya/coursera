################################################################################
#   Plot2.R
#
#   Question 2
#   ==========
#   Have total emissions from PM2.5 decreased in the Baltimore City, 
#   Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting 
#   system to make a plot answering this question.
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
pm25_yearly_baltimore <- NEI %>% filter (fips == 24510) %>% group_by(year) %>% 
                        summarize(total=sum(Emissions))

png (filename="plot2.png", width=480, height=480, units="px")

barplot(height=pm25_yearly_baltimore$total/1000, 
        names.arg=pm25_yearly_baltimore$year, 
        col="blue", xlab="Year", ylab="PM2.5 (Kilo tonnes)", 
        main="Total PM2.5 Emissions from 1999 to 2008 in Baltimore", 
        ylim=c(0,4))

dev.off()

