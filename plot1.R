# Download Source Files, Read files and cleans data
source('DataPrep.R')

# Aggregate Emissions by year
TotEmisbyYear <- aggregate(Emissions ~ year, NEI, sum)

# Open PNG Device
png(filename='plot1.png', width=480, height=480, units='px')

# Generate Plot1
barplot(
  (TotEmisbyYear$Emissions)/1000,
  names.arg=TotEmisbyYear$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Kilo Tons)",
  main="Total PM2.5 Emissions From United States between 1999 to 2008"
)
# close PNG Device
dev.off()
