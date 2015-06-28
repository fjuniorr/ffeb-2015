rm(list = ls())
# leitura e limpeza dos dados originais da rcl
source("./R/read-data.R")

# aplicação de dessazonalização, transformação logaritma e dif na rcl
source("./R/adjust_series.R")

# passeio aleatório (rw) - previsão e medidas de acurácia 
source("./R/rw.R")

# suavizacao exponencial (ets) - previsão e medidas de acurácia 
source("./R/ets.R")

# arima  - previsão e medidas de acurácia
source("./R/arima.R")

# star - previsão e medidas de acurácia
source("./R/star.R")
