

seasonal_adjustment <- function(x, ln = TRUE, dif = TRUE) {
    
    series <- x
    
    if(ln) series <- log(series)
    
    if(dif) series <- diff(series, lag = 1)
    
    decomposition <- decompose(series, type = "additive")
    
    figure <- ts(decomposition$figure, 
                 start = start(x), 
                 end = end(x), 
                 frequency = frequency(x))
    
    aux <- ts.intersect(series, figure)
    
    seasonaly_adjusted_series <- aux[, "series"] - aux[, "figure"]
    
    return(list(unadjusted_series = x, adjusted_series = seasonaly_adjusted_series, figure = decomposition$figure))
}



# rm()