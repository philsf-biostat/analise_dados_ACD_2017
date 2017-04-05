library(readxl)
DF <- read_excel("data-raw/Cópia de Banco_AnaClaudia_16032017.xls")
write.csv(DF, "dataset/dados.csv", row.names = F)
