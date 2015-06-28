naive_forecast <- lapply(states, function(x) {
    
    level_forecast <- ts(start = c(2013, 5), 
                         end = c(2014, 12), 
                         frequency = 12)
    
    level_forecast
    
    ts.union(in_sample_rcl[[x]], level_forecast)
    
    # MG
    # Y_t = Y_{t-1} + (Y_{t-12} - Y_{t-13})
    # Y_5 = 3570825617 + (3036377742 - 3239446685)
    # y <- lag(Y, -1) + (lag(Y, -12) - lag(Y, -13))
    
    Y <- window(in_sample_rcl[[x]], start = c(2012, 4))
    
    ts.intersect(lag(Y, -1), lag(Y, -12), lag(Y, -13))
    
    
    
    })

    


naive_accuracy <- lapply(states, 
                      function(x) { 
                          
                          stats <- accuracy(naive_forecast[naive_forecast$ESTADO == x, "PREVISTO"], 
                                            out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                      })

naive_accuracy <- data.frame(do.call("rbind", naive_accuracy))
naive_accuracy[, "MODELO"] <- "rw"
naive_accuracy[, "ESTADO"] <- row.names(naive_accuracy)
row.names(naive_accuracy) <- NULL

