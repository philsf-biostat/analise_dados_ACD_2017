library(ggplot2)
ggplot(DT, aes(Data_coleta_Rexames, PRNT.50)) + geom_line(aes(color = Febril, group = reg))
ggplot(DT, aes(Data_coleta_Rexames, PRNT.90)) + geom_line(aes(color = Febril, group = reg))

ggplot(DT, aes(Data_coleta_Rexames, PRNT.50)) + geom_line(aes(color = Exantema, group = reg))
ggplot(DT, aes(Data_coleta_Rexames, PRNT.90)) + geom_line(aes(color = Exantema, group = reg))

ggplot(DT, aes(Data_coleta_Rexames, PRNT.50)) + geom_line(aes(color = reg, group = reg))
ggplot(DT, aes(Data_coleta_Rexames, PRNT.90)) + geom_line(aes(color = reg, group = reg))
