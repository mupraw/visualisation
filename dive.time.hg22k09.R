i.date <- c("2009-05-29 15:15:16",
            "2009-07-08 13:47:40", 
            "2009-07-14 18:59:00", 
            "2009-08-18 12:04:12", 
            "2009-09-02 15:42:40", 
            "2009-09-12 13:50:48", 
            "2009-09-18 15:54:36", 
            "2009-09-30 17:13:48") 

e.date <- c("2009-05-29 15:59:32" , 
            "2009-07-08 14:26:56" , 
            "2009-07-14 20:08:28" , 
            "2009-08-18 12:46:44" , 
            "2009-09-02 17:02:48" ,
            "2009-09-12 14:40:24" , 
            "2009-09-18 16:43:44" ,
            "2009-09-30 18:15:56")

i.date <- format(as.POSIXct(strptime(i.date,"%Y-%m-%d %H:%M:%S")), format = "%Y-%m-%d %H:%M:%S")
i.date <- as.POSIXct(i.date, format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn")
e.date <- format(as.POSIXct(strptime(e.date,"%Y-%m-%d %H:%M:%S")), format = "%Y-%m-%d %H:%M:%S")
e.date <- as.POSIXct(e.date, format = "%Y-%m-%d %H:%M:%S", tz = "Europe/Tallinn") 
dive.time.hg22k09 <- data.frame(i.date,e.date)