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
                          
                          stats <- accuracy(rw_forecast[[x]], out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                          })

accuracy_rw <- do.call("rbind", accuracy_rw)

# ==================================
# star forecasts of adjusted series and calculation of accuracy measures

star_forecast <- lapply(seas_adj_dif_ln_rcl, forecast_star)

accuracy_star <- lapply(setdiff(states, missing), 
                      function(x) { 
                          
                          stats <- accuracy(star_forecast[[x]], out_sample_rcl[[x]])
                          rownames(stats) <- x
                          stats
                          
                          })

accuracy_star <- do.call("rbind", accuracy_star)
