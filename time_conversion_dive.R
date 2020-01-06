dive <- read_excel("C:/Users/mupraw/Documents/PhD/DATA/SMRUAccessDatabases/hg22/dive.xlsx")
dive$DE_DATE <- format(as.POSIXct(strptime(dive$DE_DATE,"%Y-%m-%d %H:%M:%S")), format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")


# Since daily saving time is ended on 25-10-2009 04:00:00 EEST, time differences between EET and UTC time zone are not constant for all available data.
for (i in 1:nrow(dive)){
  if(dive$DE_DATE[i] <= as.POSIXct("2009-10-25 02:00:00", format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")){
    dive$DE_DATE[i] <- format(as.POSIXct(strptime(dive$DE_DATE[i],"%Y-%m-%d %H:%M:%S")) + 10800, format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")
  } else if(dive$DE_DATE[i] >= as.POSIXct("2009-10-25 02:00:00", format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")){
    dive$DE_DATE[i] <- format(as.POSIXct(strptime(dive$DE_DATE[i],"%Y-%m-%d %H:%M:%S")) + 7200, format = "%Y-%m-%d %H:%M:%S", tz= "Europe/Tallinn")
  } 
}

dive$start_lat <- as.numeric(dive$start_lat)
dive$lat <- as.numeric(dive$lat)
dive$start_lat <- specify_decimal(dive$start_lat,13)
dive$start_lon <- specify_decimal(dive$start_lon,13)
dive$lat <- specify_decimal(dive$lat,13)
dive$lon <- specify_decimal(dive$lon,13)

write.csv(dive, file = "C:/Users/mupraw/Documents/PhD/DATA/dive.csv", row.names = FALSE)