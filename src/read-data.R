library("readxl")

path <- "./data-raw/RCL_CAMBIO_IPV_IBC_IGPDI_BRASIL Patricia_Luciano.xlsx"

raw_data <- lapply(excel_sheets(path), FUN = read_excel, path = path, col_names = FALSE, skip = 1)

names(raw_data) <- tolower(excel_sheets(path))

clean_data <- function(x) {
    x <- x[37:180, 1:2]
    names(x) <- c("mes", "rcl")
    return(x)
}

data <- lapply(raw_data, clean_data)

rcl_estados <- do.call("rbind", data)

rcl_estados <- cbind(estado = substr(row.names(rcl_estados), start = 1, stop = 2), rcl_estados)

row.names(rcl_estados) <- NULL

missing <- rcl_estados[!complete.cases(rcl_estados), ]

rcl_estados <- rcl_estados[!rcl_estados$estado %in% unique(missing$estado), ]

rm(path, raw_data, clean_data, data)
