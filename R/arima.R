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
arima_forecast[, "ano"] <- c(rep(2013, 8), rep(2014, 12))
arima_forecast[, "mes"] <- c(5:12, 1:12)
arima_forecast[, "modelo"] <- "arima"
arima_forecast <- melt(arima_forecast, id.vars = c("modelo", "ano", "mes"), variable.name = "estado", value.name = "previsao")    


accuracy_arima <- lapply(states, 
                        function(x) { 
                            
                            stats <- accuracy(arima_forecast[arima_forecast$estado == x, "previsao"], 
                                              out_sample_rcl[[x]])
                            rownames(stats) <- x
                            stats
                            
                        })

accuracy_arima <- data.frame(do.call("rbind", accuracy_arima))
accuracy_arima[, "modelo"] <- "arima"
accuracy_arima[, "estado"] <- row.names(accuracy_arima)
row.names(accuracy_arima) <- NULL