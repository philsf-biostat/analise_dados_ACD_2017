library(readxl)
DF <- read_excel("data-raw/Cópia de Banco_AnaClaudia_16032017.xls")
library(data.table)
DT <- data.table(DF)
DT[`PRNT 50` == "NEG"]$`PRNT 50` <- "5.0"
DT$`PRNT 50` <- as.numeric(DT$`PRNT 50`)
DT[`PRNT 90` == "NEG", ]$`PRNT 90` <- "5.0"
DT[`PRNT 90` == "neg", ]$`PRNT 90` <- "5.0"
DT$`PRNT 90` <- as.numeric(DT$`PRNT 90`)
DT[PCR == "NEG"]$PCR <- "0"
DT$PCR <- as.numeric(DT$PCR)

write.csv(DT, "dataset/dados.csv", row.names = F)
