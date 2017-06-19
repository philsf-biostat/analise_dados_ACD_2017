# Ler BB1, BB2, BB3, BB4
source("scripts/dengue-cinetica-input.R")

library(ggplot2)
library(ggpmisc)

kin.plot <- function(dataframe) {
  ggplot(dataframe, aes(Idade, Titulo,
                        color = soroconversao,
                        group = soroconversao,
                        shape = soroconversao)) +
    labs(color = "Soroconversão", shape = "Soroconversão") +
    scale_y_log10(limits = c(1,3500)) +
    scale_x_continuous(breaks = seq(0,12,2)) +
    geom_hline(yintercept = c(10, 1250), linetype = "dashed") +
    # geom_boxplot() +
    geom_hline(yintercept = 50, col = "red") +
    geom_jitter(width = .1, alpha = .3) +
    geom_smooth(method = "lm", size = .7) +
    stat_summary(fun.y = geomean, geom = "point", mapping = aes(y = Titulo), size = 2) +
    stat_poly_eq(formula = y~x,
                 aes(label = paste(paste(..eq.label.., ..rr.label.., sep = "~~~~"))),
                 parse = TRUE,
                 label.x.npc = .675) +
    scale_color_brewer(palette="Dark2") +
    theme(plot.subtitle = element_text(hjust = 0.5),
          legend.position = "bottom")
}

bb1 <- kin.plot(BB1) + labs(title = "A", subtitle = "Cinética de DENV1")
ggsave("figuras/cinetica-dengue1.png")
bb2 <- kin.plot(BB2) + labs(title = "B", subtitle = "Cinética de DENV2")
ggsave("figuras/cinetica-dengue2.png")
bb3 <- kin.plot(BB3) + labs(title = "C", subtitle = "Cinética de DENV3")
ggsave("figuras/cinetica-dengue3.png")
bb4 <- kin.plot(BB4) + labs(title = "D", subtitle = "Cinética de DENV4")
ggsave("figuras/cinetica-dengue4.png")



# obsoleto ----------------------------------------------------------------

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

# png("figuras/dengue-cinetica.png")
# par(mfrow = c(1,2))
# 
# with(BB1, plot(Idade.cat, Titulo, log = "y"))
# abline(h = 50, lwd = 2, col = "red")
# title("Todos", ylab = "Título", xlab = "Idade (meses)")
# 
# with(BB1[soroconversao == "não"], plot(Idade.cat, Titulo, log = "y"))
# abline(h = 50, lwd = 2, col = "red")
# title("Sem soroconversao", ylab = "Título", xlab = "Idade (meses)")
# 
# dev.off()

# ggplot(BB1[soroconversao == "não"], aes(Idade.cat, Titulo)) + geom_boxplot() + geom_hline(yintercept = 50, col = "red", size = 1.5) + scale_y_log10()
# png("figuras/soroconv-dengue1.png", 500, 800)
# par(mfrow = c(3,1))
# barplot(with(BB1[soroconversao == "não"], table(Titulo.cat, Idade.cat )), beside = T, legend.text = T, ylim = c(0, 60))
# title(("não"))
# barplot(with(BB1[soroconversao == "sim"], table(Titulo.cat, Idade.cat )), beside = T, legend.text = T, ylim = c(0, 60))
# title(("sim"))
# barplot(with(BB1, table(Titulo.cat, Idade.cat )), beside = T, legend.text = T, ylim = c(0, 60))
# title("xerau")
# dev.off()
