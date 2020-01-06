shipApproach <- function(dive_1,dive_2,dive_3,cpa_1,cpa_2,cpa_3){

dive.time <- rbind(dive_1,dive_2,dive_3)
cpa.ship <- rbind(cpa_1,cpa_2,cpa_3)

grup <- c()
ship_min_dist <- c()
for (i in 1:nrow(dive.time)) {
  seg <- subset(cpa.ship,cpa.ship$time.stamp >= dive.time$i.date[i] & cpa.ship$time.stamp <= dive.time$e.date[i])
  name <- unique(seg$name)
  for (j in 1:length(name)) {
    x <- seg[which(seg$name == name[j]),]
    min_dist <- x[which.min(x$dist.km),]
    g <- i
    grup <- rbind(grup,g)
    ship_min_dist <- rbind(ship_min_dist,min_dist)
  }
}

ship_min_dist <- cbind(ship_min_dist,grup)
ship_min_dist <- ship_min_dist[which(ship_min_dist$dist.km < 5),]
ship_min_dist$dist.km <- ship_min_dist$dist.km*1000

dist <- c()
for (i in 1:nrow(dive.time)) {
  seg <- subset(ship_min_dist,ship_min_dist$time.stamp >= dive.time$i.date[i] & ship_min_dist$time.stamp <= dive.time$e.date[i])
  x <- seg[which.min(seg$dist.km),]
  dist <- rbind(dist,x)
}


return(dist)
}
#Distance is in meters 