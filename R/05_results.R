forecast_plot <- function(state) {

    ts.plot(rcl[[state]],
            ts(naive_forecast[naive_forecast$ESTADO == state, "PREVISTO"], start = c(2013, 5), frequency = 12),
            ts(rw_forecast[naive_forecast$ESTADO == state, "PREVISTO"], start = c(2013, 5), frequency = 12),
            ts(ets_forecast[naive_forecast$ESTADO == state, "PREVISTO"], start = c(2013, 5), frequency = 12),
            ts(arima_forecast[naive_forecast$ESTADO == state, "PREVISTO"], start = c(2013, 5), frequency = 12),
            ts(star_forecast[naive_forecast$ESTADO == state, "PREVISTO"], start = c(2013, 5), frequency = 12),
          gpars = list(
              col = c("black", "red", "green", "blue", "pink", "yellow"),
              lty = c(1, 2, 2, 2, 2, 2)))

    legend("bottomright", # places a legend at the appropriate place
       
       c("RCL","NAIVE","RW","ETS","ARIMA","STAR"), # puts text in the legend 
       
       lty=c(1, 2, 2, 2, 2, 2), # gives the legend appropriate symbols (lines)
       
       lwd=c(2.5,2.5,2.5,2.5,2.5,2.5),col=c("black","red","green","blue","pink","yellow")) # gives the legend lines the correct color and width
}
