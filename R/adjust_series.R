adjust_series <- function(x, dif = TRUE) {
    
    series <- log(in_sample_rcl[[x]])
    
    if(dif) {
        series <- diff(series, lag = 1)
    }
    
    decomposition <- decompose(series, type = "additive")
    
    seas_adj <- series - decomposition$seasonal
    
    return(list(original_ts = in_sample_rcl[[x]], 
                seas_adj_ts = seas_adj, 
                figure = decomposition$figure,
                is_dif = dif))
}