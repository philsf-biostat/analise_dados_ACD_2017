library(data.table)
library(lubridate)

DT <- data.table(read.csv("dataset/dados.csv"))

## Idade
DT$Idade <- DT[, .( Idade = year(as.period(interval(DN, Data_coleta_Rexames))) ) ]
