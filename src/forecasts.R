library("forecast")
library("tsDyn")


forecast_rw <- function(x) {

    rw_model <- rwf(x, h = 24, drift = TRUE)
    
    forecast <- rw_model$mean
    
    return(forecast)
    
}

forecast_star <- function(x) {
    
    star_model <- star(x)
    
    forecast <- predict(star_model, n.ahead = 24)
    
    return(forecast)
}