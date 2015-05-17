library("forecast")
library("tsDyn")


forecast_rw <- function(x) {

    rw_model <- rwf(x$adjusted_series, h = 24, drift = TRUE)
    
    forecast <- rw_model$mean
    
    index <- ts(x$figure, start = start(x$adjusted_series), end = end(forecast), frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seasonaly_adjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    init <- window(x$unadjusted_series, start = end(x$unadjusted_series), end = end(x$unadjusted_series), frequency = 12)
    
    level_forecast <- exp(cumsum(c(log(init), as.numeric(forecast))))[-1]
    
    level_forecast <- ts(level_forecast, start = start(forecast), end = end(forecast), frequency = 12)

    return(level_forecast)
    
}

forecast_star <- function(x) {
    
    star_model <- star(x$adjusted_series)
    
    forecast <- predict(star_model, n.ahead = 24)
    
    index <- ts(x$figure, start = start(x$adjusted_series), end = end(forecast), frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seasonaly_adjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    init <- window(x$unadjusted_series, start = end(x$unadjusted_series), end = end(x$unadjusted_series), frequency = 12)
    
    level_forecast <- exp(cumsum(c(log(init), as.numeric(forecast))))[-1]
    
    level_forecast <- ts(level_forecast, start = start(forecast), end = end(forecast), frequency = 12)
    
    return(level_forecast)
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