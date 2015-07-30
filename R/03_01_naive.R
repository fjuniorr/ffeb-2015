naive_forecast <- lapply(states, function(x) {
    
    level_forecast <- ts(start = c(2013, 5), 
                         end = c(2014, 12), 
                         frequency = 12)
    
    Y <- ts.union(in_sample_rcl[[x]], level_forecast)[, 1]
    
    for(i in seq_along(level_forecast)) {
        
        # notacao matematica traduzida para o R
        # Y_t = Y_{t-1} + (Y_{t-12} - Y_{t-13})
        # Y <- lag(Y, -1) + (lag(Y, -12) - lag(Y, -13))
        
        Y[length(in_sample_rcl[[x]]) + i] <- (lag(Y, -1) + (lag(Y, -12) - lag(Y, -13)))[length(in_sample_rcl[[x]]) + i - 13]
    }
    
    level_forecast <- ts.intersect(Y, level_forecast)[, 1]
    
    level_forecast
    
    })

names(naive_forecast) <- states
naive_forecast <- data.frame(do.call("cbind", naive_forecast))
naive_forecast[, "ANO"] <- c(rep(2013, 8), rep(2014, 12))
naive_forecast[, "MES"] <- c(5:12, 1:12)
naive_forecast[, "QUAD"] <- c(rep("2013-2", 4), rep("2013-3", 4), rep("2014-1", 4), rep("2014-2", 4), rep("2014-3", 4))
naive_forecast[, "MODELO"] <- "naive"
naive_forecast <- melt(naive_forecast, id.vars = c("MODELO", "ANO", "MES", "QUAD"), variable.name = "ESTADO", value.name = "PREVISTO")    


naive_accuracy <- lapply(states, 
                      function(x) { 
                          
                          stats <- accuracy(naive_forecast[naive_forecast$ESTADO == x, "PREVISTO"], 
                                            out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                      })

naive_accuracy <- data.frame(do.call("rbind", naive_accuracy))
naive_accuracy[, "MODELO"] <- "naive"
naive_accuracy[, "ESTADO"] <- row.names(naive_accuracy)
row.names(naive_accuracy) <- NULL

