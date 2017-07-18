source("scripts/zika-input.R")
ZD1 <- ZK[Data_coleta_Rexames != 2017 &
            `PRNT 90` >= 50 &
            `PRNT 90`/`PRNT 50 D1` >= 3,
          .(reg, Data_coleta_Rexames,  `PRNT 90`, `PRNT 50 D1`)]
ZD4 <- ZK[Data_coleta_Rexames != 2017 &
            `PRNT 90` >= 50 &
            `PRNT 90`/`PRNT 50 D4` >= 3,
          .(reg, Data_coleta_Rexames,  `PRNT 90`, `PRNT 50 D4`)]

ZD1$`PRNT 50 D1` <- data.replace(ZD1$`PRNT 50 D1`, "<1:10", 5)
ZD4$`PRNT 50 D4` <- data.replace(ZD4$`PRNT 50 D4`, "<1:10", 5)

N <- length((ZK[Data_coleta_Rexames !=2017 & `PRNT 90`>=50 & !is.na(`PRNT 50 D1`) & !is.na(`PRNT 50 D4`),.(reg, Data_coleta_Rexames,  `PRNT 90`, `PRNT 50 D1`, `PRNT 50 D4`)]$reg))
n1 <- length((ZD1$reg))
n4 <- length((ZD4$reg))

binom.exact(n1,N)
binom.exact(n4,N)
