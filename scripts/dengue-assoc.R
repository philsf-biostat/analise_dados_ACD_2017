source("scripts/dengue-assoc-input.R")
cor.test(log10(DT$sc.d1), log10(DT$sm.d1)) # r = 0.1821501, p = 0.1712
cor.test(log10(DT$sc.d2), log10(DT$sm.d2)) # r = -0.04581803, p = 0.7327
cor.test(log10(DT$sc.d3), log10(DT$sm.d3)) # r = 0.01408245, p = 0.9164
cor.test(log10(DT$sc.d4), log10(DT$sm.d4)) # r = -0.005848243, p = 0.9652

cor.test(DT$sc.d1, DT$sm.d1, method = "spearman") # r = 0.5262571, p = <0.001
cor.test(DT$sc.d2, DT$sm.d2, method = "spearman") # r = 0.2761045, p = 0.0359
cor.test(DT$sc.d3, DT$sm.d3, method = "spearman") # r = 0.5174988, p = <0.001
cor.test(DT$sc.d4, DT$sm.d4, method = "spearman") # r = 0.5062238, p = <0.001

DT2 <- DT[, lapply(.SD, data.replace, NA, c(250, 10))]

cor.test(log10(DT2$sc.d1), log10(DT2$sm.d1)) # r = 0.1821501, p = 0.1712
cor.test(log10(DT2$sc.d2), log10(DT2$sm.d2)) # r = -0.04581803, p = 0.7327
cor.test(log10(DT2$sc.d3), log10(DT2$sm.d3)) # r = 0.01408245, p = 0.9164
cor.test(log10(DT2$sc.d4), log10(DT2$sm.d4)) # r = -0.005848243, p = 0.9652

library(ggplot2)

ggplot(DT, aes(sm.d1, sc.d1)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
ggsave("figuras/dengue1-linear.png")
ggplot(DT, aes(sm.d2, sc.d2)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
ggsave("figuras/dengue2-linear.png")
ggplot(DT, aes(sm.d3, sc.d3)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
ggsave("figuras/dengue3-linear.png")
ggplot(DT, aes(sm.d4, sc.d4)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(method = "lm", se = F)
ggsave("figuras/dengue4-linear.png")

ggplot(DT, aes(sm.d1, sc.d1)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(span = 10, se = F)
ggsave("figuras/dengue1-naolinear.png")
ggplot(DT, aes(sm.d2, sc.d2)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(span = 10, se = F)
ggsave("figuras/dengue2-naolinear.png")
ggplot(DT, aes(sm.d3, sc.d3)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(span = 10, se = F)
ggsave("figuras/dengue3-naolinear.png")
ggplot(DT, aes(sm.d4, sc.d4)) + geom_point() + scale_x_log10() + scale_y_log10() +geom_jitter() + geom_smooth(span = 10, se = F)
ggsave("figuras/dengue4-naolinear.png")

ylim <- c(0,60)
png("figuras/hist-dengue1.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d1, ylim = ylim)); with(DT, hist(sc.d1, ylim = ylim)); dev.off()
png("figuras/hist-dengue2.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d2, ylim = ylim)); with(DT, hist(sc.d2, ylim = ylim)); dev.off()
png("figuras/hist-dengue3.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d3, ylim = ylim)); with(DT, hist(sc.d3, ylim = ylim)); dev.off()
png("figuras/hist-dengue4.png", 700, 500); par(mfrow = c(1,2))
with(DT, hist(sm.d4, ylim = ylim)); with(DT, hist(sc.d4, ylim = ylim)); dev.off()