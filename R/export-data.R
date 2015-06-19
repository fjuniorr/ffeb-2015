library("xlsx")

# ==================================
# salva a rcl executada em um arquivo xls

lapply(states, function(x) {
    
    dt <- data.frame(rcl[[x]])
    names(dt) <- "rcl"
    dt$ano <- as.numeric(substr(time(rcl[[x]]), 1, 4))
    dt$mes <- cycle(rcl[[x]])
    dt <- dt[, c(2, 3, 1)]
    
    write.xlsx(dt, 
               file = "./data/rcl_estados.xls", 
               sheetName = x,
               row.names = FALSE,            
               append = TRUE)
})


# ==================================
# salva as medidas de acuracia em um arquivo xls

accuracy <- rbind(accuracy_rw, accuracy_ets, accuracy_arima, accuracy_star)

write.xlsx(accuracy, file = "./data/accuracy.xls", row.names = FALSE)
