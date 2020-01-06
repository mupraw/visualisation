cpa <- function(ship,dive){
  
  ship <- subset(ship,ship$time.stamp %in% dive$time)
  shipname <- as.character(unique(ship$name))
  
  f <- c()
  for (i in 1:length(shipname)) {
    ship.fil <- subset(ship,ship$name %in% shipname[i])
    x <- duplicated(ship.fil$time.stamp)
    g <- which(x == "TRUE")
    if (length(g) == 0) {
      ship.fil <- ship.fil 
    } else {
      ship.fil <- ship.fil[-g,]
    }
    h <- timeMatch(ship.fil$time.stamp,dive$time)
    new.dive <- dive[na.omit(h),]
    new.ship.fil <- ship.fil
    dist.km <- CalcDistance(new.dive$start_lat,new.dive$start_lon,new.ship.fil$lat,new.ship.fil$long )
    
    y <- data.frame(new.ship.fil,dist.km)
    f <- rbind(f,y)
  }
  f <- f[,-c(2,6:11)]
  return(f)
}