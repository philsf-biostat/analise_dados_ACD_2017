# Ler BB1, BB2, BB3, BB4
source("scripts/dengue-cinetica-input.R")

# la <- data.table(
#   ID = c(BB.not$`ID de registro`,
#          BB.not$`ID de registro`,
#          BB.not$`ID de registro`,
#          BB.not$`ID de registro`),
# 
#   Idade=c(rep(0, length(BB.not$`ID de registro`)),
#           BB.not$`IDADE EM MESES`,
#           BB.not$`IDADE EM MESES 2`,
#           BB.not$`IDADE EM MESES 3`),
# 
#   Titulo = c(BB.not$SC,
#              BB.not$`título da coleta 1`,
#              BB.not$`título da coleta 2`,
#              BB.not$`coleta 3`)
# )

# la[`soroconversão 1` == "não" & `soroconversão 2` == "não" & `soroconversão 3` == "não"]
# la$Idade.cat <- cut(la$Idade, breaks = c(2,4,6,8,10,12, Inf), right = T)

png("figuras/dengue-cinetica.png")
par(mfrow = c(1,2))

with(BB1, plot(Idade.cat, Titulo, log = "y"))
abline(h = 50, lwd = 2, col = "red")
title("Todos", ylab = "Título", xlab = "Idade (meses)")

with(BB1[soroconversao == "não"], plot(Idade.cat, Titulo, log = "y"))
abline(h = 50, lwd = 2, col = "red")
title("Sem soroconversao", ylab = "Título", xlab = "Idade (meses)")

dev.off()

# ggplot(BB1[soroconversao == "não"], aes(Idade.cat, Titulo)) + geom_boxplot() + geom_hline(yintercept = 50, col = "red", size = 1.5) + scale_y_log10()
png("figuras/soroconv-dengue1.png", 500, 800)
par(mfrow = c(3,1))
barplot(with(BB1[soroconversao == "não"], table(Titulo.cat, Idade.cat )), beside = T, legend.text = T, ylim = c(0, 60))
title(("não"))
barplot(with(BB1[soroconversao == "sim"], table(Titulo.cat, Idade.cat )), beside = T, legend.text = T, ylim = c(0, 60))
title(("sim"))
barplot(with(BB1, table(Titulo.cat, Idade.cat )), beside = T, legend.text = T, ylim = c(0, 60))
title("xerau")
dev.off()
