library("forecast")
library("reshape2")

# previsao
rw_forecast <-  lapply(states,
                       function(x) {

                          rw_model <- rwf(seas_adj_ln_rcl[[x]]$seas_adj_ts, h = 20, drift = TRUE)
    
                          forecast <- rw_model$mean
    
                          index <- ts(seas_adj_dif_ln_rcl[[x]]$figure, 
                                      start = start(seas_adj_ln_rcl[[x]]$seas_adj_ts), 
                                      end = end(forecast), 
                                      frequency = 12)
    
                          tmp <- ts.intersect(forecast, index)
    
                          seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]
    
                          level_forecast <- exp(seas_unadjusted_forecast)
    
                          level_forecast
                        })

names(rw_forecast) <- states
rw_forecast <- data.frame(do.call("cbind", rw_forecast))
rw_forecast[, "ano"] <- c(rep(2013, 8), rep(2014, 12))
rw_forecast[, "mes"] <- c(5:12, 1:12)
rw_forecast[, "modelo"] <- "rw"
rw_forecast <- melt(rw_forecast, id.vars = c("modelo", "ano", "mes"), variable.name = "estado", value.name = "previsao")    


# medidas de acuracia
rw_accuracy <- lapply(states, 
                      function(x) { 
                          
                          stats <- accuracy(rw_forecast[rw_forecast$estado == x, "previsao"], 
                                            out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                      })

rw_accuracy <- data.frame(do.call("rbind", rw_accuracy))
rw_accuracy[, "modelo"] <- "rw"
rw_accuracy[, "estado"] <- row.names(rw_accuracy)
row.names(rw_accuracy) <- NULL

