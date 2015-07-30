# ==================================
# salva a rcl executada em um arquivo xls
# somente precisa ser executado novamente caso haja alteracao nos dados brutos da rcl
# lapply(states, function(x) {
#     
#     dt <- data.frame(rcl[[x]])
#     names(dt) <- "rcl"
#     dt$ano <- as.numeric(substr(time(rcl[[x]]), 1, 4))
#     dt$mes <- cycle(rcl[[x]])
#     dt <- dt[, c(2, 3, 1)]
#     
#     write.xlsx(dt, 
#                file = "./data/rcl_estados.xls", 
#                sheetName = x,
#                row.names = FALSE,            
#                append = TRUE)
# })

# ==================================
# salva as previsoes de acuracia em um arquivo xls

dt_forecast <- rbind(naive_forecast, rw_forecast, ets_forecast, arima_forecast, star_forecast)

execucao <- data.frame(do.call("cbind", out_sample_rcl))
execucao[, "ANO"] <- c(rep(2013, 8), rep(2014, 12))
execucao[, "MES"] <- c(5:12, 1:12)
execucao[, "QUAD"] <- c(rep("2013-2", 4), rep("2013-3", 4), rep("2014-1", 4), rep("2014-2", 4), rep("2014-3", 4))
execucao <- melt(execucao, id.vars = c("ANO", "MES", "QUAD"), variable.name = "ESTADO", value.name = "EXECUTADO")

dt_forecast <- merge(dt_forecast, execucao)

dt_forecast <- dt_forecast[, c("ESTADO", "MODELO", "ANO", "MES", "QUAD", "PREVISTO", "EXECUTADO")]
dt_forecast <- dt_forecast[order(dt_forecast$ESTADO, dt_forecast$MODELO, dt_forecast$ANO, dt_forecast$MES), ]

write.xlsx(dt_forecast, file = "./data/forecast.xls", row.names = FALSE)

# ==================================
# salva as medidas de acuracia em um arquivo xls

dt_accuracy <- rbind(naive_accuracy, rw_accuracy, ets_accuracy, arima_accuracy, star_accuracy)

write.xlsx(dt_accuracy, file = "./data/accuracy.xls", row.names = FALSE)
