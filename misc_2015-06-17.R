# =======================================================
# plots sazonais

serie <- diff(log(rcl[["MG"]]))
seas_adj_serie <- serie - decompose(serie, type = "additive")$seasonal
decompose(serie, type = "additive")$figure

plot(serie)
plot(seas_adj_serie)

monthplot(serie)
monthplot(seas_adj_serie)

seasonplot(serie)
seasonplot(seas_adj_serie)

boxplot(serie ~ cycle(serie))
boxplot(seas_adj_serie ~ cycle(seas_adj_serie))

# =======================================================
# implementação STAR manual para estado individual

x <- seas_adj_dif_ln_rcl[["MG"]]
y <- seas_adj_dif_ln_rcl[["SP"]]$seas_adj_ts

star_model <- star(x$seas_adj_ts, thVar = y)

# star.predefined(x$seas_adj_ts, m = 1, noRegimes = 2)

forecast <- predict(star_model, n.ahead = 24)

index <- ts(x$figure, start = start(x$seas_adj_ts), end = end(forecast), frequency = 12)

tmp <- ts.intersect(forecast, index)

seas_unadjusted_forecast <- tmp[, "forecast"] + tmp[, "index"]

init <- window(x$original_ts, start = end(x$original_ts), end = end(x$original_ts), frequency = 12)

level_forecast <- exp(cumsum(c(log(init), as.numeric(seas_unadjusted_forecast))))[-1]

level_forecast <- ts(level_forecast, start = start(seas_unadjusted_forecast), end = end(seas_unadjusted_forecast), frequency = 12)

accuracy(level_forecast, out_sample_rcl[["PR"]])



# =======================================================
# implementação STAR manual todos estados

star(seas_adj_dif_ln_rcl[["ES" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["PA" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["PR" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["SP" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["SC" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["RS" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["AM" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["MG" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["RJ" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["GO" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["AC" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["MS" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["MT" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["DF" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["BA" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["RO" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["TO" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["CE" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["PE" ]]$seas_adj_ts) # erro
star(seas_adj_dif_ln_rcl[["SE" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["MA" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["RN" ]]$seas_adj_ts)
star(seas_adj_dif_ln_rcl[["AL"]]$seas_adj_ts)
