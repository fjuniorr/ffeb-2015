

adjustments <- function(time_series){
    #browser()
    adjustments <- stl(diff(log(time_series), lag = 1), s.window = "periodic")
    
    adjusted_series <- adjustments$time.series[, "trend"] + adjustments$time.series[, "remainder"]
    
    return(adjusted_series)
}


# rm()