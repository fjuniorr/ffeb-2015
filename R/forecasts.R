library("forecast")
library("tsDyn")


forecast_rw <- function(x) {

    rw_model <- rwf(x$seas_adj_ts, h = 24, drift = TRUE)
    
    forecast <- rw_model$mean
    
    index <- ts(x$figure, start = start(x$seas_adj_ts), end = end(forecast), frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    level_forecast <- exp(seas_unadjusted_forecast)
    
    return(list(model = rw_model, forecast = level_forecast))
        
}

forecast_ets <- function(x) {
    
    ets_model <- ets(x$seas_adj_ts)
    
    forecast <- forecast(ets_model, h = 24)$mean
    
    index <- ts(x$figure, start = start(x$seas_adj_ts), end = end(forecast), frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    init <- window(x$original_ts, start = end(x$original_ts), end = end(x$original_ts), frequency = 12)
    
    level_forecast <- exp(cumsum(c(log(init), as.numeric(seas_unadjusted_forecast))))[-1]
    
    level_forecast <- ts(level_forecast, start = start(seas_unadjusted_forecast), end = end(seas_unadjusted_forecast), frequency = 12)
    
    return(list(model = ets_model, forecast = level_forecast))
}

forecast_arima <- function(x) {
    
    arima_model <- auto.arima(x$seas_adj_ts)
    
    forecast <- forecast(arima_model, h = 24)$mean
    
    index <- ts(x$figure, start = start(x$seas_adj_ts), end = end(forecast), frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    init <- window(x$original_ts, start = end(x$original_ts), end = end(x$original_ts), frequency = 12)
    
    level_forecast <- exp(cumsum(c(log(init), as.numeric(seas_unadjusted_forecast))))[-1]
    
    level_forecast <- ts(level_forecast, start = start(seas_unadjusted_forecast), end = end(seas_unadjusted_forecast), frequency = 12)
    
    return(list(model = arima_model, forecast = level_forecast))
}


forecast_star <- function(x) {

    star_model <- star(x$seas_adj_ts)
    
    forecast <- predict(star_model, n.ahead = 24)
    
    index <- ts(x$figure, start = start(x$seas_adj_ts), end = end(forecast), frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    init <- window(x$original_ts, start = end(x$original_ts), end = end(x$original_ts), frequency = 12)
    
    level_forecast <- exp(cumsum(c(log(init), as.numeric(seas_unadjusted_forecast))))[-1]
    
    level_forecast <- ts(level_forecast, start = start(seas_unadjusted_forecast), end = end(seas_unadjusted_forecast), frequency = 12)
    
    return(list(model = star_model, forecast = level_forecast))
}