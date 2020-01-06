dive.hg22k09<-read.table("C:/Users/mupraw/Documents/PhD/DATA/profile.full.hg22k09.csv", sep =",", row.names =  NULL, header = TRUE)
dive.hg22k09$time <- as.POSIXct(dive.hg22k09$time, "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn" )
dive.hg22k09 <- dive.hg22k09[which(!is.na(dive.hg22k09$start_lat)),]