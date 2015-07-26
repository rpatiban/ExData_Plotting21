# Exploratory Data Analysis
# Project 2

# setting working directory
setwd("C:/Raghu/Rscipts")


# downloading datazip and unzipping
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl1, destfile = "./data/exdataNEI_data.zip", method="auto")
unzip("./data/exdataNEI_data.zip",exdir = "./expProject2")

library("plyr")

# Load data
NEI <- readRDS("./expProject2/summarySCC_PM25.rds")
SCC <- readRDS("./expProject2/Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))
data2<-data[data$fips=="24510",]

#Plot Data
plotdata2<-ddply(data2,.(year),summarize,sum=sum(Emissions))
png("./expProject2/plot2.png")
plot(plotdata2$year,plotdata2$sum,type="n",xlab="year",ylab="total PM2.5 Emission",
     main="PM2.5 emission in Baltimore City",boxwex=0.05)
lines(plotdata2$year,plotdata2$sum)
dev.off()