################################################################################
#   Plot5.R
#
#   Question 5
#   ==========
#   How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#
################################################################################

# Load Libraries
library(dplyr) # For Data manipulation
library(ggplot2)

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

png (filename="plot5.png", width=480, height=480, units="px")

pm25_baltimore_vehicles <- NEI %>% filter(fips == 24510 & type =="ON-ROAD") %>% 
                            group_by(year) %>% summarize(total=sum(Emissions))

ggplot(data=pm25_baltimore_vehicles, aes(x=factor(year), y=total, group=1)) + 
    geom_line(col="red", size=2) + theme_bw() + 
    labs(x="Year", y="PM 2.5 (Tonnes)", title="Total Vehicular PM 2.5 Emissions in Baltimore") + 
    geom_point()

dev.off()

