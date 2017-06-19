D1.pw <- with(BB1[soroconversao == "não"], pairwise.wilcox.test(Titulo,Idade.cat))$p.value
D2.pw <- with(BB2[soroconversao == "não"], pairwise.wilcox.test(Titulo,Idade.cat))$p.value
D3.pw <- with(BB3[soroconversao == "não"], pairwise.wilcox.test(Titulo,Idade.cat))$p.value
D4.pw <- with(BB4[soroconversao == "não"], pairwise.wilcox.test(Titulo,Idade.cat))$p.value


D1.p <- matrix(format.pval(D1.pw, digits = 3, 0.001), ncol = 6, byrow = F)
dimnames(D1.p) <- dimnames(D1.pw)
D2.p <- matrix(format.pval(D2.pw, digits = 3, 0.001), ncol = 6, byrow = F)
dimnames(D2.p) <- dimnames(D2.pw)
D3.p <- matrix(format.pval(D3.pw, digits = 3, 0.001), ncol = 6, byrow = F)
dimnames(D3.p) <- dimnames(D3.pw)
D4.p <- matrix(format.pval(D4.pw, digits = 3, 0.001), ncol = 6, byrow = F)
dimnames(D4.p) <- dimnames(D4.pw)
