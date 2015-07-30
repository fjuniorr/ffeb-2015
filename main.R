library("readxl")
library("xlsx")
library("reshape2")
library("forecast")
library("tsDyn")

# leitura e limpeza dos dados originais da rcl
source("./R/01_read_data.R")

# aplicação de dessazonalização, transformação logaritma e dif na rcl
source("./R/02_adjust_series.R")

# previsão e medidas de acurácia
source("./R/03_01_naive.R")
source("./R/03_02_rw.R")
source("./R/03_03_ets.R")
source("./R/03_04_arima.R")
source("./R/03_05_star.R")


# exportacao das bases com os resultados
source("./R/04_export_data.R")

