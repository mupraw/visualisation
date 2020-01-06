dive.hg22P09<-read.table("C:/Users/mupraw/Documents/PhD/DATA/profile.full.hg22P09.csv", sep =",", row.names =  NULL, header = TRUE)
dive.hg22P09$time <- as.POSIXct(dive.hg22P09$time, "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn" )
dive.hg22P09 <- dive.hg22P09[which(!is.na(dive.hg22P09$start_lat)),]