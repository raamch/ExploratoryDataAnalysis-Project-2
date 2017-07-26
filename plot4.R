library(ggplot2)

# Download Source Files, Read files and cleans data
source('DataPrep.R')

# Filter for Coal Combustion related data
SCCCoal<-grepl(pattern = "coal", SCC$SCC.Level.Four, ignore.case = TRUE)
SCCComb<-grepl(pattern = "comb", SCC$SCC.Level.One, ignore.case = TRUE)

SCCCoalComb<-SCC[SCCComb & SCCCoal, ]$SCC
NIECoalComb<-NEI[NEI$SCC %in% SCCCoalComb,]

# Aggregate Emissions by year
TotNIECoalCombEm<-aggregate(Emissions~year, NIECoalComb, sum)

# Open PNG Device
 png(filename='plot4.png', width=480, height=480, units='px')

# Generate Plot4
ggp<-ggplot(aes(year, Emissions/1000), data=TotNIECoalCombEm)+
  geom_bar(stat="identity",fill="grey",width=0.75) +
  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

# Print Plot
print(ggp)

# close PNG Device
dev.off()
