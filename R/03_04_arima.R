arima_forecast <- lapply(states, function(x) {

    arima_model <- auto.arima(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts)
    
    forecast <- forecast(arima_model, h = 20)$mean
    
    index <- ts(seas_adj_dif_ln_rcl[[x]]$figure, 
                start = start(seas_adj_dif_ln_rcl[[x]]$seas_adj_ts), 
                end = end(forecast), frequency = 12)
    
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


names(arima_forecast) <- states
arima_forecast <- data.frame(do.call("cbind", arima_forecast))
arima_forecast[, "ANO"] <- c(rep(2013, 8), rep(2014, 12))
arima_forecast[, "MES"] <- c(5:12, 1:12)
arima_forecast[, "QUAD"] <- c(rep("2013-2", 4), rep("2013-3", 4), rep("2014-1", 4), rep("2014-2", 4), rep("2014-3", 4))
arima_forecast[, "MODELO"] <- "arima"
arima_forecast <- melt(arima_forecast, id.vars = c("MODELO", "ANO", "MES", "QUAD"), variable.name = "ESTADO", value.name = "PREVISTO")    


arima_accuracy <- lapply(states, 
                        function(x) { 
                            
                            stats <- accuracy(arima_forecast[arima_forecast$ESTADO == x, "PREVISTO"], 
                                              out_sample_rcl[[x]])
                            rownames(stats) <- x
                            stats
                            
                        })

arima_accuracy <- data.frame(do.call("rbind", arima_accuracy))
arima_accuracy[, "MODELO"] <- "arima"
arima_accuracy[, "ESTADO"] <- row.names(arima_accuracy)
row.names(arima_accuracy) <- NULL