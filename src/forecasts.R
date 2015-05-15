library("forecast")
library("tsDyn")


forecast_rw <- function(x) {

    rw_model <- rwf(x$series, h = 24, drift = TRUE)
    
    forecast <- rw_model$mean
    
    index <- ts(x$figure, start = start(forecast), end = end(forecast), frequency = frequency(forecast))
    
    seasonaly_adjusted_forecast <- forecast + index
    
    window(x$series)
    
    return(forecast)
    
}

forecast_star <- function(x) {
    
    star_model <- star(x$series)
    
    forecast <- predict(star_model, n.ahead = 24)
    
    return(forecast)
}

# method1 <- c(as.numeric(window(original_series, 
#                start = end(original_series), 
#                end = end(original_series), frequency = 12)), as.numeric(exp(forecast)))
# 
# method2 <- c(as.numeric(log(window(original_series, 
#                start = end(original_series), 
#                end = end(original_series), frequency = 12))), as.numeric(forecast))
# 
# cbind(cumprod(method1)[-1], 
#       exp(cumsum(method2))[-1])