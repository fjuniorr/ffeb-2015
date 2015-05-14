library("readxl")

path <- "./data-raw/RCL_CAMBIO_IPV_IBC_IGPDI_BRASIL Patricia_Luciano.xlsx"
states <- excel_sheets(path)

raw_data <- lapply(states, 
                   FUN = read_excel, 
                   path = path, 
                   col_names = FALSE, 
                   skip = 1) # read all excel sheets and stores it in a list


clean <- function(x) {
    x <- x[37:180, 2]
    names(x) <- c("rcl")
    x <- ts(x, start = c(2003, 1), end = c(2014, 12), frequency = 12)
    return(x)
} # function to clean each position in the list and create a ts object


rcl <- lapply(raw_data, clean)

names(rcl) <- states


#===========================================
# checking for missing values

check_missing <- function(x) {
    any(is.na(x))
}

missing <- do.call("rbind", lapply(rcl, check_missing))

missing <- cbind(states, missing)[missing == TRUE, 1]

rcl <- rcl[setdiff(states, missing)]

#===========================================
# cleaning the enviroment

rm(path, raw_data, clean, check_missing)
