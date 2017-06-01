library(readxl)
library(data.table)
source("scripts/data-replace.R")

DT <- read_excel("data-raw/concordancia dengue soro materno e sangue de cordao.xlsx", skip = 1)
DT <- as.data.table(DT)
DT <- DT[, lapply(.SD, data.replace, 250, ">250")]
DT <- DT[, lapply(.SD, data.replace, 10, "<10")]
DT <- DT[, lapply(.SD, as.numeric)]
DT$`ID de registro` <- factor(DT$`ID de registro`)

cor.test(DT$`sangue de cordão`, DT$`soro materno`, method = "spearman" ) # r = 0.1821501, p = 0.1712
cor.test(DT$`sangue de cordão__1`, DT$`soro materno__1`, method = "spearman") # r = -0.04581803, p = 0.7327
cor.test(DT$`sangue de cordão__2`, DT$`soro materno__2`, method = "spearman") # r = 0.01408245, p = 0.9164
cor.test(DT$`sangue de cordão__3`, DT$`soro materno__3`, method = "spearman") # r = -0.005848243, p = 0.9652

DT2 <- DT[, lapply(.SD, data.replace, NA, c(250, 10))]

cor.test(DT2$`sangue de cordão`, DT2$`soro materno`, method = "spearman") # r = 0.1821501, p = 0.1712
cor.test(DT2$`sangue de cordão__1`, DT2$`soro materno__1`, method = "spearman") # r = -0.04581803, p = 0.7327
cor.test(DT2$`sangue de cordão__2`, DT2$`soro materno__2`, method = "spearman") # r = 0.01408245, p = 0.9164
cor.test(DT2$`sangue de cordão__3`, DT2$`soro materno__3`, method = "spearman") # r = -0.005848243, p = 0.9652
