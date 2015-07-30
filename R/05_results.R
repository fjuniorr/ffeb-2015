forecast_plot <- function(state, rw_forecast, ets_forecast, arima_forecast, star_forecast) {

    ts.plot(rcl[[state]], 
        rw_forecast[[state]]$forecast,
        ets_forecast[[state]]$forecast,
        arima_forecast[[state]]$forecast,
        star_forecast[[state]]$forecast,
          gpars = list(
              col = c("black", "red", "green", "blue", "pink"),
              lty = c(1, 2, 2, 2, 2)))

#     legend("bottomright", # places a legend at the appropriate place
#        
#        c("RCL","RW","ETS","ARIMA","STAR"), # puts text in the legend 
#        
#        lty=c(1, 2, 2, 2, 2), # gives the legend appropriate symbols (lines)
#        
#        lwd=c(2.5,2.5,2.5,2.5,2.5),col=c("black","red","green","blue","pink")) # gives the legend lines the correct color and width
}