library("forecast")
library("tsDyn")


forecast_rw <- function(time_series){
    #browser()
    forecasted_series <- rwf(time_series, h = 24, drift = TRUE)
    
    return(forecasted_series$mean)
    
}