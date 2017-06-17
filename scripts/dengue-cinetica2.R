library(ggplot2)
kin.plot <- function(dataframe) {
  ggplot(dataframe, aes(Idade, Titulo, color = soroconversao)) +
    scale_y_log10() +
    geom_hline(yintercept = c(10, 1250), linetype = "dashed") +
    # geom_boxplot() +
    geom_hline(yintercept = 50, col = "red") +
    geom_jitter(width = .1, alpha = .15) +
    stat_summary(fun.y = geomean, geom = "point", mapping = aes(y = Titulo), size = 2) +
    scale_color_brewer(palette="Dark2")
}

bb1 <- kin.plot(BB1) + geom_smooth(method = "lm")
ggsave("figuras/cinetica-dengue1.png")
bb2 <- kin.plot(BB2) + geom_smooth(method = "lm")
ggsave("figuras/cinetica-dengue2.png")
bb3 <- kin.plot(BB3) + geom_smooth(method = "lm")
ggsave("figuras/cinetica-dengue3.png")
bb4 <- kin.plot(BB4) + geom_smooth(method = "lm")
ggsave("figuras/cinetica-dengue4.png")
