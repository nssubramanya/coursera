################################################################################
#   Plot4.R
#
#   Question 4
#   ==========
#   Across the United States, how have emissions from coal combustion-related 
#   sources changed from 1999–2008?
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

png (filename="plot4.png", width=480, height=480, units="px")

coalRows <- grepl("*Coal$", SCC$EI.Sector)
coalSCC <- SCC[coalRows, "SCC"]

pm25_yearly_coal <- NEI %>% filter (SCC %in% coalSCC) %>% group_by(year) %>% 
                    summarize(total=sum(Emissions)/1000)

ggplot(data=pm25_yearly_coal, aes(x=factor(year), y=total, label=round(total, 2))) + 
    geom_bar(stat="identity") + theme_bw() + geom_label() + 
    labs(x="Year", y="PM 2.5 (Kilo Tonnes)", title="PM 2.5 Emissions from Coal Sources")

dev.off()

