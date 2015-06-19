library("xlsx")

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
