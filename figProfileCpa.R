figProfileCpa <- function(dive,cpa,time.dive){
  
  for (i in 1:nrow(time.dive)) {
    
 
  dive.1 <- subset(dive, dive$time > time.dive$i.date[i] )
  # dive.1 <- subset(dive.1, dive.1$time < time.border$e.date[i])
  cpa.1 <- subset(cpa, cpa$time.stamp > time.dive$i.date[i] & cpa$time.stamp < time.dive$e.date[i])
  
 
  x <-  ggplot(data = cpa.1, aes(x = time.stamp, y = dist.km, colour = name)) + 
    geom_line() +
    xlab(NULL) +
    ylab("Distance to ship [km]") +
    scale_x_datetime( date_labels = "%b %d - %H:%M:%S") +
    xlim(c(time.dive$i.date[i],time.dive$e.date[i] )) +
    ylim(c(0,5)) +
    scale_color_jco() +
    labs(color = "Ship name \n") +
    theme(legend.position = "bottom")
  
  x.1 <- ggplot() +
    geom_segment(data = dive.1,aes(x = time, xend = time.end ,y = depth, yend = depth.end), color = "black") +
    geom_line(data = dive.1,aes(x = time, y = bathy), color = "red") +
    scale_x_datetime( date_labels = "%b %d - %H:%M:%S") +
    xlim(c(time.dive$i.date[i],time.dive$e.date[i] )) +
    ylim(c(-25,0))+
    labs(y = "Depth [m]", color = "Type\n") +
    xlab("TIME [MM:SS]")
    
    
     
  
 
  c <-ggarrange(x,x.1, nrow = 2)
  
  
  print(c)
  }
  return(c)
}
