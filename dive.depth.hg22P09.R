dive.depth.hg22P09 <- read.table("C:/Users/mupraw/Documents/PhD/DATA/profile.hg22P09.depth.csv", sep =",", row.names =  NULL, header = TRUE)
dive.depth.hg22P09$time <- format(as.POSIXct(strptime(dive.depth.hg22P09$time,"%Y-%m-%d %H:%M:%S")) , format = "%Y-%m-%d %H:%M:%S")
dive.depth.hg22P09$time <- as.POSIXct(dive.depth.hg22P09$time, format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")
