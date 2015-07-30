ets_forecast <- lapply(states, function(x) {

    ets_model <- ets(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts)
    
    forecast <- forecast(ets_model, h = 20)$mean
    
    index <- ts(seas_adj_dif_ln_rcl[[x]]$figure, 
                start = start(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts), 
                end = end(forecast), 
                frequency = 12)
    
    tmp <- ts.intersect(forecast, index)
    
    seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
    init <- window(seas_adj_dif_ln_rcl[[x]]$original_ts, 
                   start = end(seas_adj_dif_ln_rcl[[x]]$original_ts), 
                   end = end(seas_adj_dif_ln_rcl[[x]]$original_ts), 
                   frequency = 12)
    
    level_forecast <- exp(cumsum(c(log(init), as.numeric(seas_unadjusted_forecast))))[-1]
    
    level_forecast <- ts(level_forecast, 
                         start = start(seas_unadjusted_forecast), 
                         end = end(seas_unadjusted_forecast), 
                         frequency = 12)

    level_forecast

    })

names(ets_forecast) <- states
ets_forecast <- data.frame(do.call("cbind", ets_forecast))
ets_forecast[, "ANO"] <- c(rep(2013, 8), rep(2014, 12))
ets_forecast[, "MES"] <- c(5:12, 1:12)
ets_forecast[, "QUAD"] <- c(rep("2013-2", 4), rep("2013-3", 4), rep("2014-1", 4), rep("2014-2", 4), rep("2014-3", 4))
ets_forecast[, "MODELO"] <- "ets"
ets_forecast <- melt(ets_forecast, id.vars = c("MODELO", "ANO", "MES", "QUAD"), variable.name = "ESTADO", value.name = "PREVISTO")    


ets_accuracy <- lapply(states, 
                        function(x) { 
                            
                            stats <- accuracy(ets_forecast[ets_forecast$ESTADO == x, "PREVISTO"], 
                                              out_sample_rcl[[x]])
                            rownames(stats) <- x
                            stats
                            
                        })

ets_accuracy <- data.frame(do.call("rbind", ets_accuracy))
ets_accuracy[, "MODELO"] <- "ets"
ets_accuracy[, "ESTADO"] <- row.names(ets_accuracy)
row.names(ets_accuracy) <- NULL
