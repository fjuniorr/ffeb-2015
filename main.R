source("./R/read-data.R")
source("./R/adjustments.R")
source("./R/forecasts.R")
source("./R/forecast-plot.R")


# ==================================
# transformations applied to original series

seas_adj_ln_rcl <- lapply(in_sample_rcl, adjust_series, dif = FALSE)

seas_adj_dif_ln_rcl <- lapply(in_sample_rcl, adjust_series, dif = TRUE)


# ==================================
# random walk forecasts of transformed series and calculation of accuracy measures

rw_forecast <-  lapply(seas_adj_ln_rcl, forecast_rw)

accuracy_rw <- lapply(setdiff(states, missing), 
                      function(x) { 
                          
                          stats <- accuracy(rw_forecast[[x]]$forecast, out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                          })

accuracy_rw <- data.frame(do.call("rbind", accuracy_rw))
accuracy_rw[, "model"] <- "rw"
accuracy_rw[, "estado"] <- row.names(accuracy_rw)
row.names(accuracy_rw) <- NULL

# ==================================
# ets forecasts of adjusted series and calculation of accuracy measures

ets_forecast <- lapply(seas_adj_dif_ln_rcl, forecast_ets)

accuracy_ets <- lapply(setdiff(states, missing), 
                        function(x) { 
                            
                            stats <- accuracy(ets_forecast[[x]]$forecast, out_sample_rcl[[x]])
                            rownames(stats) <- x
                            stats
                            
                        })

accuracy_ets <- data.frame(do.call("rbind", accuracy_ets))
accuracy_ets[, "model"] <- "ets"
accuracy_ets[, "estado"] <- row.names(accuracy_ets)
row.names(accuracy_ets) <- NULL


# ==================================
# arima forecasts of adjusted series and calculation of accuracy measures

arima_forecast <- lapply(seas_adj_dif_ln_rcl, forecast_arima)

accuracy_arima <- lapply(setdiff(states, missing), 
                        function(x) { 
                            
                            stats <- accuracy(arima_forecast[[x]]$forecast, out_sample_rcl[[x]])
                            rownames(stats) <- x
                            stats
                            
                        })

accuracy_arima <- data.frame(do.call("rbind", accuracy_arima))
accuracy_arima[, "model"] <- "arima"
accuracy_arima[, "estado"] <- row.names(accuracy_arima)
row.names(accuracy_arima) <- NULL


# ==================================
# star forecasts of adjusted series and calculation of accuracy measures

star_forecast <- lapply(seas_adj_dif_ln_rcl, forecast_star)

accuracy_star <- lapply(setdiff(states, missing), 
                      function(x) { 
                          
                          stats <- accuracy(star_forecast[[x]]$forecast, out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                          })

accuracy_star <- data.frame(do.call("rbind", accuracy_star))
accuracy_star[, "model"] <- "star"
accuracy_star[, "estado"] <- row.names(accuracy_star)
row.names(accuracy_star) <- NULL



