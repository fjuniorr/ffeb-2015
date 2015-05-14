

adjustments <- function(x) {
    
    series <- diff(log(x), lag = 1)
    
    seasonal_adjustment <- decompose(series, type = "additive")
    
    figure <- ts(seasonal_adjustment$figure, 
                 start = start(series), 
                 end = end(series), 
                 frequency = frequency(series))
    
    series <- series - figure
    
    return(series)
}


# rm()