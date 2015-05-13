source("./src/read-data.R")
source("./src/outlier-analysis.R")
source("./src/seasonal-adjusment.R")
source("./src/forecasts.R")

rm(list = ls())

sapply(rcl, forecast_rw)

sapply(rcl, adjustments)


