rm(list = ls())

source("./src/read-data.R")
source("./src/adjustments.R")
source("./src/forecasts.R")


adjusted_rcl <- lapply(rcl, seasonal_adjustment)

decompose(diff(log(rcl[["ES"]]), lag = 1), type = "additive")$x - ts(decompose(diff(log(rcl[["ES"]]), lag = 1), type = "additive")$figure, start = c(2003, 2), end = c(2014, 12), frequency = 12)
adjusted_rcl[["ES"]]$adjusted_series


decompose(diff(log(rcl[["ES"]]), lag = 1), type = "additive")$figure
adjusted_rcl[["ES"]]$figure


rw_rcl <-  lapply(adjusted_rcl, forecast_rw)

star_rcl <- lapply(adjusted_rcl, forecast_star)
