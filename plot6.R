#Change in Vehicle Emissions in Baltimore City between 1999-2008?

library(ggplot2)

# Download Source Files, Read files and cleans data
source('DataPrep.R')

# Filter for vehicle data for Baltimore and LA
NEIVehBaLA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

# Aggregate Emissions by year and city
TotNEIVehBaLAEm <- aggregate(Emissions ~ year + fips, NEIVehBaLA, sum)

# Add City names
TotNEIVehBaLAEm$city[TotNEIVehBaLAEm$fips=="24510"] <- "Baltimore, MD"
TotNEIVehBaLAEm$city[TotNEIVehBaLAEm$fips=="06037"] <- "Los Angeles, CA"

# Open PNG Device
 png(filename='plot6.png', width=480, height=480, units='px')

# Generate Plot6
 ggp<-ggplot(TotNEIVehBaLAEm, aes(x=year, y=Emissions)) +
      geom_bar(stat="identity")  +
      facet_grid(. ~ city) +
      labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
      ggtitle('Total Motor Vehicle Emissions From Baltimore and Los Angeles')

 # Print Plot
print(ggp)

# close PNG Device
dev.off()
