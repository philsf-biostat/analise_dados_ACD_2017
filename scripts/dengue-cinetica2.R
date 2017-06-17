library(ggplot2)
kin.plot <- function(dataframe) {
  ggplot(dataframe, aes(Idade, Titulo,
                        color = soroconversao,
                        group = soroconversao,
                        shape = soroconversao)) +
    labs(color = "Soroconversão", shape = "Soroconversão") +
    scale_y_log10() +
    scale_x_continuous(breaks = seq(0,12,2)) +
    geom_hline(yintercept = c(10, 1250), linetype = "dashed") +
    # geom_boxplot() +
    geom_hline(yintercept = 50, col = "red") +
    geom_jitter(width = .1, alpha = .15) +
    geom_smooth(method = "lm") +
    stat_summary(fun.y = geomean, geom = "point", mapping = aes(y = Titulo), size = 2) +
    scale_color_brewer(palette="Dark2") +
    theme(plot.subtitle = element_text(hjust = 0.5))
}

bb1 <- kin.plot(BB1) + labs(title = "A", subtitle = "Cinética de DENV1")
ggsave("figuras/cinetica-dengue1.png")
bb2 <- kin.plot(BB2) + labs(title = "B", subtitle = "Cinética de DENV2")
ggsave("figuras/cinetica-dengue2.png")
bb3 <- kin.plot(BB3) + labs(title = "C", subtitle = "Cinética de DENV3")
ggsave("figuras/cinetica-dengue3.png")
bb4 <- kin.plot(BB4) + labs(title = "D", subtitle = "Cinética de DENV4")
ggsave("figuras/cinetica-dengue4.png")
