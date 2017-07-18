source("scripts/zika-input.R")

# N total (com dados de DENV1 e DENV4, ZIKA positivos, excluindo 2017)
N <- length((ZK[Data_coleta_Rexames !=2017 &
                  `PRNT 90`>=50 & !is.na(`PRNT 50 D1`) &
                  !is.na(`PRNT 50 D4`)
                ,.(reg, Data_coleta_Rexames,  `PRNT 90`, `PRNT 50 D1`, `PRNT 50 D4`)]$reg))

ZD1 <- ZK[Data_coleta_Rexames != 2017 &
            `PRNT 90` >= 50,
          .(reg, Data_coleta_Rexames,  `PRNT 90`, `PRNT 50 D1`)]
ZD4 <- ZK[Data_coleta_Rexames != 2017 &
            `PRNT 90` >= 50,
          .(reg, Data_coleta_Rexames,  `PRNT 90`, `PRNT 50 D4`)]

ZD1.r3 <- ZD1[`PRNT 90`/`PRNT 50 D1` >= 3,]
ZD1.r4 <- ZD1[`PRNT 90`/`PRNT 50 D1` >= 4,]
ZD4.r3 <- ZD4[`PRNT 90`/`PRNT 50 D4` >= 3,]
ZD4.r4 <- ZD4[`PRNT 90`/`PRNT 50 D4` >= 4,]

# n de cada condição testada
n1.r3 <- length((ZD1.r3$reg)) # Razao >3
n4.r3 <- length((ZD4.r3$reg)) # Razao >3
n1.r4 <- length((ZD1.r4$reg)) # Razao >4
n4.r4 <- length((ZD4.r4$reg)) # Razao >4

# testes binomiais
library(exactci)
binom.exact(n1.r3,N)
binom.exact(n1.r4,N)
binom.exact(n4.r3,N)
binom.exact(n4.r4,N)

# ZD1$`PRNT 50 D1` <- data.replace(ZD1$`PRNT 50 D1`, "<1:10", 5)
# ZD4$`PRNT 50 D4` <- data.replace(ZD4$`PRNT 50 D4`, "<1:10", 5)
