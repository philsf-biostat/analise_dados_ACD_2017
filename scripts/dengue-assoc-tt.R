source("../../PDPIV/bridging/bridging-analysis.R")
source("../../PDPIV/bridging/plots.R")
source("scripts/dengue-assoc-input.R")

dados1 <- data.table(Sample= DT$`ID de registro`,
                    NEW = DT[, sc.d1],
                    REF = DT[, sm.d1])
qndata1 <- quant.data(dados1)
qnresults1 <- quant.analysis(qndata1)

dados2 <- data.table(Sample= DT$`ID de registro`,
                     NEW = DT[, sc.d2],
                     REF = DT[, sm.d2])
qndata2 <- quant.data(dados2)
qnresults2 <- quant.analysis(qndata2)

dados3 <- data.table(Sample= DT$`ID de registro`,
                     NEW = DT[, sc.d3],
                     REF = DT[, sm.d3])
qndata3 <- quant.data(dados3)
qnresults3 <- quant.analysis(qndata3)

dados4 <- data.table(Sample= DT$`ID de registro`,
                     NEW = DT[, sc.d4],
                     REF = DT[, sm.d4])
qndata4 <- quant.data(dados4)
qnresults4 <- quant.analysis(qndata4)

png("figuras/tt-d1.png",900, 500)
par(mfrow = c(1,2))
ratios.plot(qndata1, qnresults1)
bias.plot(qndata1, qnresults1)
dev.off()

png("figuras/tt-d2.png",900, 500)
par(mfrow = c(1,2))
ratios.plot(qndata2, qnresults2)
bias.plot(qndata2, qnresults2)
dev.off()

png("figuras/tt-d3.png",900, 500)
par(mfrow = c(1,2))
ratios.plot(qndata3, qnresults3)
bias.plot(qndata3, qnresults3)
dev.off()

png("figuras/tt-d4.png",900, 500)
par(mfrow = c(1,2))
ratios.plot(qndata4, qnresults4)
bias.plot(qndata4, qnresults4)
dev.off()

gmr.print(qnresults1)
gmr.print(qnresults2)
gmr.print(qnresults3)
gmr.print(qnresults4)
