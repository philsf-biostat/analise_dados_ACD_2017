library(readxl)
library(data.table)
source("scripts/data-replace.R")

DT <- read_excel("data-raw/concordancia dengue soro materno e sangue de cordao.xlsx", skip = 1)
DT <- as.data.table(DT)
DT <- DT[, lapply(.SD, data.replace, 250, ">250")]
DT <- DT[, lapply(.SD, data.replace, 10, "<10")]
DT <- DT[, lapply(.SD, as.numeric)]
DT$`ID de registro` <- factor(DT$`ID de registro`)

cor.test(log10(DT$`sangue de cordão`), log10(DT$`soro materno`)) # r = 0.1821501, p = 0.1712
cor.test(log10(DT$`sangue de cordão__1`), log10(DT$`soro materno__1`)) # r = -0.04581803, p = 0.7327
cor.test(log10(DT$`sangue de cordão__2`), log10(DT$`soro materno__2`)) # r = 0.01408245, p = 0.9164
cor.test(log10(DT$`sangue de cordão__3`), log10(DT$`soro materno__3`)) # r = -0.005848243, p = 0.9652

DT2 <- DT[, lapply(.SD, data.replace, NA, c(250, 10))]

cor.test(log10(DT2$`sangue de cordão`), log10(DT2$`soro materno`)) # r = 0.1821501, p = 0.1712
cor.test(log10(DT2$`sangue de cordão__1`), log10(DT2$`soro materno__1`)) # r = -0.04581803, p = 0.7327
cor.test(log10(DT2$`sangue de cordão__2`), log10(DT2$`soro materno__2`)) # r = 0.01408245, p = 0.9164
cor.test(log10(DT2$`sangue de cordão__3`), log10(DT2$`soro materno__3`)) # r = -0.005848243, p = 0.9652

library(ggplot2)

ggplot(DT, aes(`sangue de cordão`, `soro materno`)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
ggplot(DT, aes(`sangue de cordão__1`, `soro materno__1`)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
ggplot(DT, aes(`sangue de cordão__2`, `soro materno__2`)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
ggplot(DT, aes(`sangue de cordão__3`, `soro materno__3`)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
