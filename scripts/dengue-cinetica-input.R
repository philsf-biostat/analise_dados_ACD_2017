library(readxl)
library(data.table)
library(bridging)
clean.data <- function(dataframe) {
  dataframe$Titulo <- data_replace(dataframe$Titulo, 2500, 1250)
  dataframe <- data.table(dataframe)
  dataframe <- dataframe[Idade <= 12]
  dataframe$soroconversao <- factor(dataframe$soroconversao)
  dataframe$Coleta <- ordered(dataframe$Coleta)
  # setkey(dataframe, "ID de registro")
  dataframe$`ID de registro` <- factor(dataframe$`ID de registro`)
  dataframe$Idade.cat <- cut(dataframe$Idade, breaks = c(seq(0, 12, 2), Inf), right = F, 
                      labels = c("nasc.", "2m a 4 m", "4m a 6m", "6m a 8m","8m a 10m", "10m a 12m", "12m ou mais"), ordered_result = T)
  dataframe$Titulo.cat  <- cut(dataframe$Titulo, c(0,250,Inf), right = F, labels = c("<250", ">250"), ordered_result = T)
  dataframe
}

BB1 <- read_excel("dataset/BANCO BEBES DENGUE ESTATISTICO_16062017_longo.xlsx", "DENV1")
BB2 <- read_excel("dataset/BANCO BEBES DENGUE ESTATISTICO_16062017_longo.xlsx", "DENV2")
BB3 <- read_excel("dataset/BANCO BEBES DENGUE ESTATISTICO_16062017_longo.xlsx", "DENV3")
BB4 <- read_excel("dataset/BANCO BEBES DENGUE ESTATISTICO_16062017_longo.xlsx", "DENV4")

BB1 <- clean.data(BB1)
BB2 <- clean.data(BB2)
BB3 <- clean.data(BB3)
BB4 <- clean.data(BB4)
