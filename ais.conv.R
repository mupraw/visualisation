AIS <- read.table("C:/Users/mupraw/Documents/PhD/DATA/AIS/May2009_January2010_2019_TUT.csv", sep =";", row.names =  NULL , header = TRUE)
AIS$timestamp_pretty <- format(as.POSIXct(strptime(AIS$timestamp_pretty,"%d/%m/%Y %H:%M:%S")), format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")
AIS$timestamp_pretty <- as.POSIXct(AIS$timestamp_pretty, "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn" )

ais.conv <- function(AIS){

g <- subset(AIS, AIS$timestamp_pretty <= as.POSIXct("2009-10-25 02:00:00", format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn"))
g$timestamp_pretty <- format(as.POSIXct(strptime(g$timestamp_pretty,"%Y-%m-%d %H:%M:%S")) + 10800, format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")            

h <- subset(AIS, AIS$timestamp_pretty >= as.POSIXct("2009-10-25 02:00:00", format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")) 
h$timestamp_pretty <- format(as.POSIXct(strptime(h$timestamp_pretty,"%Y-%m-%d %H:%M:%S")) + 7200, format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")


j <- rbind(g,h)
j$timestamp_pretty <- format(as.POSIXct(strptime(j$timestamp_pretty,"%Y-%m-%d %H:%M:%S")), format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")
return(j)
}
#     AIS$timestamp_pretty[i] <- format(as.POSIXct(strptime(AIS$timestamp_pretty[i],"%Y-%m-%d %H:%M:%S")) + 10800, format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")
#   } else if(AIS$timestamp_pretty[i] >= as.POSIXct("2009-10-25 02:00:00", format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")){
#     AIS$timestamp_pretty[i] <- format(as.POSIXct(strptime(AIS$timestamp_pretty[i],"%Y-%m-%d %H:%M:%S")) + 7200, format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")
#   } 
# }
# 
# AIS$timestamp_pretty <- format(as.POSIXct(strptime(AIS$timestamp_pretty,"%d/%m/%Y %H:%M:%S")) +10800, format = "%Y-%m-%d %H:%M:%S")
# AIS$timestamp_pretty <- as.POSIXct(AIS$timestamp_pretty, "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn" )
# AIS$lat <- as.numeric(as.character(AIS$lat))
# AIS$long <- as.numeric(as.character(AIS$long))
# 
# specify_decimal <- function(x, k) trimws(format(round(x, k), nsmall=k))
# 
# AIS$lat <- specify_decimal(AIS$lat,4)
# AIS$long <- specify_decimal(AIS$long,4)
