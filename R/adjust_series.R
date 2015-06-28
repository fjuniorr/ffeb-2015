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

seas_adj_ln_rcl <- lapply(states, adjust_series, dif = FALSE)
names(seas_adj_ln_rcl) <- states

seas_adj_dif_ln_rcl <- lapply(states, adjust_series, dif = TRUE)
names(seas_adj_dif_ln_rcl) <- states