

seasonal_adjustment <- function(x, ln = TRUE, dif = TRUE) {
    
    if(ln) x <- log(x)
    
    if(dif) x <- diff(x, lag = 1)
    
    decomposition <- decompose(x, type = "additive")
    
    figure <- ts(decomposition$figure, 
                 start = start(x), 
                 end = end(x), 
                 frequency = frequency(x))
    
    seasonaly_adjusted_series <- x - figure
    
    return(list(series = seasonaly_adjusted_series, figure = decomposition$figure))
}

revert_forecast <- function(x, figure, ln = TRUE, dif = TRUE) {
    
    s <- window(rcl[["MG"]], start = c(2012, 1), end = c(2013, 12))
    
    m <- Arima(s, order = c(1, 1, 0), lambda = 0)
    
    f <- forecast.Arima(m, h = 6)$mean
    
    
    s2 <- window(rcl[["MG"]], start = c(2012, 1), end = c(2013, 12))
    
    s2 <- diff(log(s2), lag = 1)
    
    m2 <- Arima(s3, order = c(1, 0, 0))
    
    f2 <- forecast.Arima(m2, h = 6)$mean
    
    return(FALSE)
}

# rm()