#Change in Vehicle Emissions in Baltimore City between 1999-2008?

library(ggplot2)

# Download Source Files, Read files and cleans data
source('DataPrep.R')

# Filter for vehicle data for Baltimore
NEIVehBalM <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

# Aggregate Emissions by year
TotNEIVehBalMEM<-aggregate(Emissions~year, NEIVehBalM, sum)

# Open PNG Device
 png(filename='plot5.png', width=480, height=480, units='px')

# Generate Plot5
 ggp<-ggplot(aes(year, Emissions), data=TotNEIVehBalMEM) +
   geom_bar(stat="identity",fill="grey",width=0.75) +
   guides(fill=FALSE) +
   labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
   labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
# Print Plot
print(ggp)

# close PNG Device
dev.off()
