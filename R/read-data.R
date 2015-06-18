library("readxl")

path <- "./data-raw/RCL_CAMBIO_IPV_IBC_IGPDI_BRASIL Patricia_Luciano.xlsx"

states <- excel_sheets(path)

raw_data <- lapply(states, 
                   FUN = read_excel, 
                   path = path, 
                   col_names = FALSE, 
                   skip = 1) 


clean <- function(x) {
    x <- x[37:180, 2]
    names(x) <- c("rcl")
    x <- ts(x, start = c(2003, 1), end = c(2014, 12), frequency = 12)
    return(x)
} 


rcl <- lapply(raw_data, clean)

names(rcl) <- states

#===========================================
# ajuste horizonte das series com dados missing

rcl[["AP"]] <- window(rcl[["AP"]], start = c(2004, 1), end = c(2014, 12), frequency = 12)

rcl[["RR"]] <- window(rcl[["RR"]], start = c(2006, 1), end = c(2014, 12), frequency = 12)

rcl[["PI"]] <- window(rcl[["PI"]], start = c(2004, 1), end = c(2014, 12), frequency = 12)

# rcl[["PB"]] <- window(rcl[["PB"]], start = c(2003, 1), end = c(2013, 12), frequency = 12) # dados para 2014 obtidos no portal da transparencia http://www.siaf.cge.pb.gov.br/CGE/jspServMenuPrincipal_aux?EXERCICIO=2014&opcao=7

#===========================================
# ajuste de outliers

ajuste_rcl_BA <- c(-384412186, -324328233, 	-319768455, 1028508874)

window(rcl[["BA"]], start = c(2013, 1), end = c(2013, 4), frequency = 12) <- 
    window(rcl[["BA"]], start = c(2013, 1), end = c(2013, 4), frequency = 12) + ajuste_rcl_BA

#===========================================
# checking for missing values

# check_missing <- function(x) {
#     any(is.na(x))
# }
# 
# missing <- do.call("rbind", lapply(rcl, check_missing))
# 
# missing <- cbind(states, missing)[missing == TRUE, 1]
# 
# names(missing) <- NULL
# 
# rcl <- rcl[setdiff(states, missing)]

#===========================================
# in sample and out of sample definitions

in_sample_rcl <- lapply(rcl, window, start = c(2003, 1), end = c(2013, 4), frequency = 12)
    
out_sample_rcl <- lapply(rcl, window, start = c(2013, 5), end = c(2014, 12), frequency = 12)     

#===========================================
# cleaning the enviroment

rm(path, raw_data, clean, check_missing, ajuste_rcl_BA)
