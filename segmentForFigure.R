segmentForFigure <- function(dive,dive.time){
  

  dive <- dive[order(dive$time),]
  
  time.end <- c(dive$time[-1],dive$time[nrow(dive)])
  
  depth.end <- c(dive$depth[-1], dive$depth[nrow(dive)])
  
  n.row <- seq(11,nrow(dive),11)
  
  note <-rep("diving",nrow(dive))
  j <- seq(11,nrow(dive),11)
  note[j] <- "surfacing"
  i <- seq(1,nrow(dive),11)
  note[i] <- "surfacing"
  
  end_lat <- c(dive$start_lat[-1],dive$start_lat[nrow(dive)])
  end_lat <- data.frame(end_lat)
  
  end_lon <- c(dive$start_lon[-1],dive$start_lon[nrow(dive)])
  end_lon <- data.frame(end_lon)
  
  dive <- cbind(dive,end_lat,end_lon,time.end,depth.end,note)
  
  return(dive)
}