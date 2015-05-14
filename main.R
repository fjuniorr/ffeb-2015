rm(list = ls())

source("./src/read-data.R")
source("./src/adjustments.R")
source("./src/forecasts.R")


plot(rcl[["MG"]])

plot(adjustments(rcl[["MG"]]))

plot(forecast_rw(rcl[["MG"]]))

plot(forecast_star(rcl[["MG"]]))



adjusted_rcl <- lapply(rcl, adjustments)

rw_rcl <-  lapply(rcl, forecast_rw)

star_rcl <- lapply(rcl, forecast_star)
