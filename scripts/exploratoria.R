library(ggplot2)
ggplot(DT, aes(Data_coleta_Rexames, PRNT.50)) + geom_line(aes(color = Febril, group = reg)) + scale_y_log10()
ggplot(DT, aes(Data_coleta_Rexames, PRNT.90)) + geom_line(aes(color = Febril, group = reg)) + scale_y_log10()

ggplot(DT, aes(Data_coleta_Rexames, PRNT.50)) + geom_line(aes(color = Exantema, group = reg)) + scale_y_log10()
ggplot(DT, aes(Data_coleta_Rexames, PRNT.90)) + geom_line(aes(color = Exantema, group = reg)) + scale_y_log10()

ggplot(DT, aes(Data_coleta_Rexames, PRNT.50)) + geom_line(aes(color = reg, group = reg)) + scale_y_log10()
ggplot(DT, aes(Data_coleta_Rexames, PRNT.90)) + geom_line(aes(color = reg, group = reg)) + scale_y_log10()
