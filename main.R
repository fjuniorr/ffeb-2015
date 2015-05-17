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


# ==================================
# exploring the results

plot_state = "PA"

ts.plot(in_sample_rcl[[plot_state]], rw_forecast[[plot_state]], star_forecast[[plot_state]], gpars = list(col = c("black", "red", "green"), lty=c(1, 2, 2)))

legend("bottomright", # places a legend at the appropriate place
       
       c("RCL","RW Forecast", "STAR Forecast"), # puts text in the legend 
       
       lty=c(1,2,2), # gives the legend appropriate symbols (lines)
       
       lwd=c(2.5,2.5,2.5),col=c("black","red", "green")) # gives the legend lines the correct color and width


