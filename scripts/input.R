library(data.table)
library(lubridate)

DT <- data.table(read.csv("dataset/dados.csv"))

## Idade
DT$DN <- as.Date(DT$DN)
DT$Data_coleta_Rexames <- as.Date(DT$Data_coleta_Rexames)
DT$Idade <- DT[, .( Idade = year(as.period(interval(DN, Data_coleta_Rexames))) ) ]
