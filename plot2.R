# Download Source Files, Read files and cleans data
source('DataPrep.R')

# Filter for Baltimore City, Maryland 
NEIBalM<-subset(NEI, fips == "24510")

# Aggregate Emissions by year
TotBalMEmisbyYear <- aggregate(Emissions ~ year, NEIBalM, sum)

# Open PNG Device
png(filename='plot2.png', width=480, height=480, units='px')

# Generate Plot2
barplot(
  (TotBalMEmisbyYear$Emissions)/1000,
  names.arg=TotBalMEmisbyYear$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Kilo Tons)",
  main="Total PM2.5 Emissions From Baltimore City between 1999 to 2008"
)
# close PNG Device
dev.off()
