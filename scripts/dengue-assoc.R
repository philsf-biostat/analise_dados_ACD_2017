source("scripts/dengue-assoc-input.R")

cor.test(log10(DT$sc.d1), log10(DT$sm.d1)) # r = 0.8308448, p = <0.001
cor.test(log10(DT$sc.d2), log10(DT$sm.d2)) # r = 0.4262882, p = <0.001
cor.test(log10(DT$sc.d3), log10(DT$sm.d3)) # r = 0.5217896, p = <0.001
cor.test(log10(DT$sc.d4), log10(DT$sm.d4)) # r = 0.2314973, p = 0.0804

# cor.test(DT$sc.d1, DT$sm.d1, method = "spearman") # rho = 0.5262571, p = <0.001
# cor.test(DT$sc.d2, DT$sm.d2, method = "spearman") # rho = 0.2761045, p = 0.0359
# cor.test(DT$sc.d3, DT$sm.d3, method = "spearman") # rho = 0.5174988, p = <0.001
# cor.test(DT$sc.d4, DT$sm.d4, method = "spearman") # rho = 0.5062238, p = <0.001

library(ggplot2)

dengue.assoc.lin.plot <- function(x,y) {
  ggplot(DT, aes(x, y)) +
    scale_x_log10() + scale_y_log10() +
    geom_jitter(alpha = .3) +
    geom_smooth(method = "lm", se = F) +
    xlab("Título soro materno") + ylab("Título sangue de cordão") +
    theme(plot.subtitle = element_text(hjust = .5))
}

d1.assoc.lin <- dengue.assoc.lin.plot(DT$sm.d1, DT$sc.d1) + labs(title = "A", subtitle = "DENV1")
ggsave("figuras/assoc-linear-dengue1.png")
d2.assoc.lin <- dengue.assoc.lin.plot(DT$sm.d2, DT$sc.d2) + labs(title = "B", subtitle = "DENV2")
ggsave("figuras/assoc-linear-dengue2.png")
d3.assoc.lin <- dengue.assoc.lin.plot(DT$sm.d3, DT$sc.d3) + labs(title = "C", subtitle = "DENV3")
ggsave("figuras/assoc-linear-dengue3.png")
d4.assoc.lin <- dengue.assoc.lin.plot(DT$sm.d4, DT$sc.d4) + labs(title = "D", subtitle = "DENV4")
ggsave("figuras/assoc-linear-dengue4.png")

library(cowplot)
theme_set(theme_gray())
plot_grid(d1.assoc.lin, d2.assoc.lin, d3.assoc.lin, d4.assoc.lin, labels = "AUTO")
ggsave("figuras/assoc-linear-all.png", width = 12, height = 14)

dengue.assoc.nl.plot <- function(x,y) {
  ggplot(DT, aes(x, y)) +
    scale_x_log10() +
    scale_y_log10() +
    geom_jitter(alpha = .3) +
    geom_smooth(span = 2, se = F) +
    xlab("Título soro materno") + ylab("Título sangue de cordão") +
    theme(plot.subtitle = element_text(hjust = .5))
}

d1.assoc.nl <- dengue.assoc.nl.plot(DT$sm.d1, DT$sc.d1) + labs(title = "A", subtitle = "DENV1")
ggsave("figuras/assoc-nlinear-dengue1.png")
d2.assoc.nl <- dengue.assoc.nl.plot(DT$sm.d2, DT$sc.d2) + labs(title = "B", subtitle = "DENV2")
ggsave("figuras/assoc-nlinear-dengue2.png")
d3.assoc.nl <- dengue.assoc.nl.plot(DT$sm.d3, DT$sc.d3) + labs(title = "C", subtitle = "DENV3")
ggsave("figuras/assoc-nlinear-dengue3.png")
d4.assoc.nl <- dengue.assoc.nl.plot(DT$sm.d4, DT$sc.d4) + labs(title = "D", subtitle = "DENV4")
ggsave("figuras/assoc-nlinear-dengue4.png")

plot_grid(d1.assoc.nl, d2.assoc.nl, d3.assoc.nl, d4.assoc.nl, labels = "AUTO")
ggsave("figuras/assoc-nlinear-all.png", width = 12, height = 14)

ylim <- c(0,60)
png("figuras/hist-dengue1.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d1, ylim = ylim)); with(DT, hist(sc.d1, ylim = ylim)); dev.off()
png("figuras/hist-dengue2.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d2, ylim = ylim)); with(DT, hist(sc.d2, ylim = ylim)); dev.off()
png("figuras/hist-dengue3.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d3, ylim = ylim)); with(DT, hist(sc.d3, ylim = ylim)); dev.off()
png("figuras/hist-dengue4.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d4, ylim = ylim)); with(DT, hist(sc.d4, ylim = ylim)); dev.off()
