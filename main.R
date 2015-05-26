source("./src/read-data.R")
source("./src/adjustments.R")
source("./src/forecasts.R")
source("./src/forecast-plot.R")


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

accuracy_rw <- do.call("rbind", accuracy_rw)

# ==================================
# ets forecasts of adjusted series and calculation of accuracy measures

ets_forecast <- lapply(seas_adj_dif_ln_rcl, forecast_ets)

accuracy_ets <- lapply(setdiff(states, missing), 
                        function(x) { 
                            
                            stats <- accuracy(ets_forecast[[x]]$forecast, out_sample_rcl[[x]])
                            rownames(stats) <- x
                            stats
                            
                        })

accuracy_ets <- do.call("rbind", accuracy_ets)

# ==================================
# arima forecasts of adjusted series and calculation of accuracy measures

arima_forecast <- lapply(seas_adj_dif_ln_rcl, forecast_arima)

accuracy_arima <- lapply(setdiff(states, missing), 
                        function(x) { 
                            
                            stats <- accuracy(arima_forecast[[x]]$forecast, out_sample_rcl[[x]])
                            rownames(stats) <- x
                            stats
                            
                        })

accuracy_arima <- do.call("rbind", accuracy_arima)

# ==================================
# star forecasts of adjusted series and calculation of accuracy measures

star_forecast <- lapply(seas_adj_dif_ln_rcl, forecast_star)

accuracy_star <- lapply(setdiff(states, missing), 
                      function(x) { 
                          
                          stats <- accuracy(star_forecast[[x]]$forecast, out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                          })

accuracy_star <- do.call("rbind", accuracy_star)
