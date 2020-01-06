dive.hg22N09<-read.table("C:/Users/mupraw/Documents/PhD/DATA/profile.full.hg22N09.csv", sep =",", row.names =  NULL, header = TRUE)
dive.hg22N09$time <- as.POSIXct(dive.hg22N09$time, "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn" )
dive.hg22N09 <- dive.hg22N09[which(!is.na(dive.hg22N09$start_lat)),]