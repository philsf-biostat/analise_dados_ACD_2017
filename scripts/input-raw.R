library(readxl)
library(data.table)
DF <- read_excel("data-raw/Cópia de Banco_AnaClaudia_16032017.xls", 2)
DT <- data.table(DF)

write.csv(DT, "dataset/dados.csv", row.names = F)
