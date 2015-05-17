

adjust_series <- function(x) {
    
    series <- x
    
    series <- diff(log(series), lag = 1)
    
    decomposition <- decompose(series, type = "additive")
    
    seasonaly_adjusted_series <- series - decomposition$seasonal
    
    return(list(unadjusted_series = x, 
                adjusted_series = seasonaly_adjusted_series, 
                figure = decomposition$figure))
}



# rm()