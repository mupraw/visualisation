dive.depth.hg22k09 <- read.table("C:/Users/mupraw/Documents/PhD/DATA/profile.hg22k09.depth.csv", sep =",", row.names =  NULL, header = TRUE)
dive.depth.hg22k09$time <- format(as.POSIXct(strptime(dive.depth.hg22k09$time,"%Y-%m-%d %H:%M:%S")) , format = "%Y-%m-%d %H:%M:%S")
dive.depth.hg22k09$time <- as.POSIXct(dive.depth.hg22k09$time, format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")