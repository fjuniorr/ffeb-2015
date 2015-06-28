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
rw_forecast[, "ANO"] <- c(rep(2013, 8), rep(2014, 12))
rw_forecast[, "MES"] <- c(5:12, 1:12)
rw_forecast[, "QUAD"] <- c(rep("2013-2", 4), rep("2013-3", 4), rep("2014-1", 4), rep("2014-2", 4), rep("2014-3", 4))
rw_forecast[, "MODELO"] <- "rw"
rw_forecast <- melt(rw_forecast, id.vars = c("MODELO", "ANO", "MES", "QUAD"), variable.name = "ESTADO", value.name = "PREVISTO")



rw_accuracy <- lapply(states, 
                      function(x) { 
                          
                          stats <- accuracy(rw_forecast[rw_forecast$ESTADO == x, "PREVISTO"], 
                                            out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                      })

rw_accuracy <- data.frame(do.call("rbind", rw_accuracy))
rw_accuracy[, "MODELO"] <- "rw"
rw_accuracy[, "ESTADO"] <- row.names(rw_accuracy)
row.names(rw_accuracy) <- NULL

