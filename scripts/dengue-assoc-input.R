library(readxl)
library(data.table)
source("scripts/data-replace.R")

DT <- read_excel("dataset/concordancia dengue soro materno e sangue de cordao.xlsx")
DT <- as.data.table(DT)
DT <- DT[, lapply(.SD, data.replace, 2500, c(">1250", 1250))]
DT <- DT[, lapply(.SD, data.replace, 5, c("<10", 10))]
DT <- DT[, lapply(.SD, as.numeric), .SDcols = c(1,3:10)]
setkey(DT, "ID de registro")
DT$`ID de registro` <- factor(DT$`ID de registro`)
