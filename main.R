rm(list = ls())

source("./src/read-data.R")
source("./src/adjustments.R")
source("./src/forecasts.R")


# ==================================
# log, diff and seasonal adjusment with additive moving averages applied to level series in this order

adjusted_rcl <- lapply(in_sample_rcl, adjust_series)

# ==================================
# naive forecasts of unadjusted series and calculation of accuracy measures

# ==================================
# random walk forecasts of adjusted series and calculation of accuracy measures

rw_forecast <-  lapply(adjusted_rcl, forecast_rw)

accuracy_rw <- lapply(setdiff(states, missing), 
                      function(x) 
                          accuracy(rw_forecast[[x]], out_sample_rcl[[x]]))

names(accuracy_rw) <- setdiff(states, missing)


# ==================================
# star forecasts of adjusted series and calculation of accuracy measures

star_forecast <- lapply(adjusted_rcl, forecast_star)

accuracy_star <- lapply(setdiff(states, missing), 
                      function(x) 
                          accuracy(star_forecast[[x]], out_sample_rcl[[x]]))

names(accuracy_star) <- setdiff(states, missing)

# ==================================
# exporting the results to an excel file