BB <- read_excel("dataset/BANCO BEBES DENGUE ESTATISTICO_12062017_kaplan Meier.xlsx", 2)
BB <- data.table(BB)
BB$soroconversao <- factor(BB$soroconversao)
setkey(BB, "ID de registro")
BB$`ID de registro` <- factor(BB$`ID de registro`)
BB$Idade.cat <- cut(BB$Idade, breaks = c(seq(0, 12, 2), Inf), right = F, 
                    labels = c("nasc.", "2m a 4 m", "4m a 6m", "6m a 8m","8m a 10m", "10m a 12m", "12m ou mais"), ordered_result = T)

le <- BB[soroconversao == "não"]

# la <- data.table(
#   ID = c(le$`ID de registro`,
#          le$`ID de registro`,
#          le$`ID de registro`,
#          le$`ID de registro`),
# 
#   Idade=c(rep(0, length(le$`ID de registro`)),
#           le$`IDADE EM MESES`,
#           le$`IDADE EM MESES 2`,
#           le$`IDADE EM MESES 3`),
# 
#   Titulo = c(le$SC,
#              le$`título da coleta 1`,
#              le$`título da coleta 2`,
#              le$`coleta 3`)
# )

# la[`soroconversão 1` == "não" & `soroconversão 2` == "não" & `soroconversão 3` == "não"]
# la$Idade.cat <- cut(la$Idade, breaks = c(2,4,6,8,10,12, Inf), right = T)

png("figuras/dengue-cinetica.png")
par(mfrow = c(1,2))

with(BB, plot(Idade.cat, Titulo, log = "y"))
abline(h = 50, lwd = 2, col = "red")
title("Todos", ylab = "Título", xlab = "Idade (meses)")

with(le, plot(Idade.cat, Titulo, log = "y"))
abline(h = 50, lwd = 2, col = "red")
title("Sem soroconversao", ylab = "Título", xlab = "Idade (meses)")

dev.off()

# ggplot(le, aes(Idade.cat, Titulo)) + geom_boxplot() + geom_hline(yintercept = 50, col = "red", size = 1.5) + scale_y_log10()
