################################################################################
#   Plot3.R
#
#   Question 3
#   ==========
#   Of the four types of sources indicated by the type (point, nonpoint, onroad,
#   nonroad) variable, which of these four sources have seen decreases in 
#   emissions from 1999–2008 for Baltimore City? 
#   Which have seen increases in emissions from 1999–2008? 
#
#   Use the ggplot2 plotting system to make a plot answer this question.
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

png (filename="plot3.png", width=480, height=480, units="px")

pm25_yearly_by_type <- NEI %>% filter (fips == 24510) %>% 
                        group_by(year, type) %>% 
                        summarize (total=sum(Emissions)/1000)

ggplot(data = pm25_yearly_by_type, 
       aes(x=factor(year), y=total, group=type, col=factor(type))) + 
        geom_line() + 
        labs(x="Year", y="PM 2.5 (Kilo tonnes)", title="PM2.5 in Baltimore by Type & Year") + 
        geom_point() + guides(col=guide_legend("Emission Type")) + theme_bw()

dev.off()

