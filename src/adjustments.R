adjust_series <- function(x, dif = TRUE) {
     
    series <- log(x)
    
    if(dif) {
        series <- diff(series, lag = 1)
    }
    
    decomposition <- decompose(series, type = "additive")
    
    seas_adj <- series - decomposition$seasonal
    
    return(list(original_ts = x, 
                seas_adj_ts = seas_adj, 
                figure = decomposition$figure,
                is_dif = dif))
}