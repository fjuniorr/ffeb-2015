library("readxl")

path <- "./data-raw/RCL_CAMBIO_IPV_IBC_IGPDI_BRASIL Patricia_Luciano.xlsx"

raw_data <- lapply(excel_sheets(path), 
                   FUN = read_excel, 
                   path = path, 
                   col_names = FALSE, 
                   skip = 1) # read all excel sheets and stores it in a list

names(raw_data) <- tolower(excel_sheets(path))

clean <- function(x) {
    x <- x[37:180, 1:2]
    names(x) <- c("mes", "rcl")
    return(x)
} # function to clean each position in the list

clean_data <- lapply(raw_data, clean)

rcl_estados <- do.call("rbind", clean_data) # merging the list into a single data frame

rcl_estados <- cbind(estado = substr(row.names(rcl_estados), start = 1, stop = 2), rcl_estados) # creating a column with the states identification

row.names(rcl_estados) <- NULL

missing <- rcl_estados[!complete.cases(rcl_estados), ] # selecting the missing cases for information purposes

rcl_estados <- rcl_estados[!rcl_estados$estado %in% unique(missing$estado), ] # working initially only with complete cases

rm(path, raw_data, clean, clean_data)
