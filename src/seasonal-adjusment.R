library("reshape2")
library("dplyr")
library("forecast")

#rcl_estados$ln_rcl <- log(rcl_estados[, "rcl"])

#rcl_estados$diff_ln_rcl <- c(NA, diff(rcl_estados[, "ln_rcl"]))
                                    
data <- dcast(rcl_estados, mes ~ estado, value.var = "rcl")

rcl <- ts(data[, -1], start = c(2003, 1), frequency = 12)

seasonaly_adjusted <- sapply(seq_len(ncol(rcl)), function(x) stl(rcl[, x], s.window = "periodic"))
                
colnames(seasonaly_adjusted) <- colnames(rcl)


random_walk_forecasts <- sapply(seq_len(ncol(rcl)), function(x) rwf(rcl[, x], h = 12, drift = TRUE)$mean)
    
colnames(random_walk_forecasts) <- colnames(rcl)    

           
rm(data, rcl)

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