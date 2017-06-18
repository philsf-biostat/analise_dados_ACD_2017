library(lubridate)
source("scripts/data-replace.R")
ZK <- read_excel("dataset/Banco AC ZIKA PRNT 50 x 90.xlsx", na = "ND")
ZK <- data.table(ZK)

ZK$reg <- factor(ZK$reg)
ZK$Febril <- factor(ZK$Febril)
ZK$Exantema <- factor(ZK$Exantema)
ZK$`PRNT 50` <- as.numeric(data.replace(ZK$`PRNT 50`, 5, c("NEG", "neg")))
ZK$`PRNT 50 D1` <- as.numeric(data.replace(ZK$`PRNT 50 D1`, 5, c("NEG", "neg")))
ZK$`PRNT 50 D4` <- as.numeric(data.replace(ZK$`PRNT 50 D4`, 5, c("NEG", "neg")))
ZK$`PRNT 90` <- as.numeric(data.replace(ZK$`PRNT 90`, 5, c("NEG", "neg")))
ZK$`PRNT 90 D1` <- as.numeric(data.replace(ZK$`PRNT 90 D1`, 5, c("NEG", "neg")))
ZK$`PRNT 90 D4` <- as.numeric(data.replace(ZK$`PRNT 90 D4`, 5, c("NEG", "neg")))
ZK$Idade <- ZK[, .( Idade = year(as.period(interval(DN, Data_coleta_Rexames))) ) ]

ZK.2015 <- ZK[Data_coleta_Rexames >= "2015-01-01" & Data_coleta_Rexames <= "2015-12-31"]
ZK.2016 <- ZK[Data_coleta_Rexames >= "2016-01-01" & Data_coleta_Rexames <= "2016-12-31"]
