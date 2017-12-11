################################################################################
#   Plot6.R
#
#   Question 6
#   ==========
#   Compare emissions from motor vehicle sources in Baltimore City with emissions 
#   from motor vehicle sources in Los Angeles County, California 
#   (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?
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

png (filename="plot6.png", width=480, height=480, units="px")

pm25_vehicles_BM_LA <- NEI %>% filter((fips == "24510" | fips == "06037" ) & type =="ON-ROAD") %>% 
                        group_by(fips, year) %>% 
                        summarize(total=sum(Emissions))

pm25_vehicles_BM_LA <- pm25_vehicles_BM_LA %>% 
                        mutate(County=ifelse(fips=="24510", "Baltimore", "Los Angeles"))


ggplot(data = pm25_vehicles_BM_LA, 
        aes(x=factor(year), y=total, group=factor(County), col=factor(County))) + 
        geom_point() + geom_line() + theme_bw() + 
        labs(x="Year", y="PM 2.5 (Tonnes)", title="Total Vehicular PM 2.5 Emissions in Baltimore Vs Los Angeles") + 
        guides(col=guide_legend("City Code"))

dev.off()

