BB <- data.table(read_excel("dataset/BANCO BEBES DENGUE ESTATISTICO.xlsx"))
setkey(BB, "ID de registro")
BB$`ID de registro` <- factor(BB$`ID de registro`)
