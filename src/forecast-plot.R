forecast_plot <- function(state, rw_forecast, star_forecast) {

    ts.plot(rcl[[state]], 
        rw_forecast[[state]],
        star_forecast[[state]],
          gpars = list(
              col = c("black", "red", "green"),
              lty = c(1, 2, 2)))

    legend("bottomright", # places a legend at the appropriate place
       
       c("RCL","RW", "STAR"), # puts text in the legend 
       
       lty=c(1, 2, 2), # gives the legend appropriate symbols (lines)
       
       lwd=c(2.5,2.5,2.5),col=c("black","red","green")) # gives the legend lines the correct color and width
}