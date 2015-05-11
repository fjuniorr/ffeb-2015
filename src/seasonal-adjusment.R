library("reshape2")
library("dplyr")
source("./src/read-data.R")

rcl_estados$ln_rcl <- log(rcl_estados[, "rcl"])

rcl_estados$diff_ln_rcl <- c(NA, diff(rcl_estados[, "ln_rcl"]))

group_by(rcl_estados, estado) %>% 
    do(stl(ts(.$rcl, start = c(2003, 1), frequency = 12), s.window = "periodic", na.action = na.contiguous))
                                    
stl(ts(rcl_estados[rcl_estados$estado == "mg", "rcl"], start = c(2003, 1), frequency = 12)
    , s.window = "periodic")


data <- dcast(rcl_estados, mes ~ estado, value.var = "rcl")

rcl <- ts(data[, -1], start = c(2003, 1), frequency = 12)

seasonaly_adjusted <- ts(sapply(seq_len(ncol(rcl)), 
       function(x) stl(rcl[, x], s.window = "periodic")$time.series[, "trend"]),
       start = c(2003, 1), frequency = 12)

colnames(seasonaly_adjusted) <- colnames(rcl)

plot(seasonaly_adjusted[, c("mg", "sp", "rj")])

           
rm(data)

# 
# library(dplyr)
# library(forecast)
# model_fits <- group_by(df, cty) %>% do(fit=auto.arima(.$tl))
# 
# OR
# 
# library(data.table)
# library(forecast)
# temp <- setDT(temp)[, list(AR = list(auto.arima(tl))), by = cty]

# http://stackoverflow.com/questions/13583817/using-apply-family-of-functions-on-mts-objects