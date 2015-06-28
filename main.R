library("readxl")
library("xlsx")
library("reshape2")
library("forecast")
library("tsDyn")

# leitura e limpeza dos dados originais da rcl
source("./R/read-data.R")

# aplicação de dessazonalização, transformação logaritma e dif na rcl
source("./R/adjust_series.R")

# previsão e medidas de acurácia
#source("./R/naive.R")
source("./R/rw.R")
source("./R/ets.R")
source("./R/arima.R")
source("./R/star.R")


# exportacao das bases com os resultados
source("./R/export-data.R")

