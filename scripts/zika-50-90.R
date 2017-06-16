source("scripts/zika-input.R")


qual.cutoff.min <- 10
# qual.cutoff.min.ref <- 10
# qual.cutoff.min.new <- 50
quant.cutoff.min <- 10
quant.cutoff.max <- 31250

source("../../PDPIV/bridging/bridging-analysis.R")
source("../../PDPIV/bridging/plots.R")

# zika 50 x zika 90 2015 --------------------------------------------------

ZK.2015.brid <- ZK.2015[,.(Sample = reg, REF = `PRNT 50`, NEW = `PRNT 90`)]
zkqldata <- qual.data(ZK.2015.brid)
zkqndata <- quant.data(ZK.2015.brid)

zkqlresults <- qual.analysis(zkqldata)
zkqnresults <- quant.analysis(zkqndata)

table.print(zkqlresults)

deming.plot(zkqndata, zkqnresults)
bias.plot(zkqndata, zkqnresults)
ratios.plot(zkqndata, zkqnresults)

# zika 50 x zika 90 2016 --------------------------------------------------

ZK.2016.brid <- ZK.2016[,.(Sample = reg, REF = `PRNT 50`, NEW = `PRNT 90`)]
zkqldata <- qual.data(ZK.2016.brid)
zkqndata <- quant.data(ZK.2016.brid)

zkqlresults <- qual.analysis(zkqldata)
zkqnresults <- quant.analysis(zkqndata)

table.print(zkqlresults)

deming.plot(zkqndata, zkqnresults)
bias.plot(zkqndata, zkqnresults)
ratios.plot(zkqndata, zkqnresults)

# zika 90 x dengue 50 2015 ------------------------------------------------

ZD.2015.brid <- ZK.2015[,.(Sample = reg, REF = `PRNT 90`, NEW = `PRNT 50 D1`)]
zkqldata <- qual.data(ZD.2015.brid)
zkqndata <- quant.data(ZD.2015.brid)

zkqlresults <- qual.analysis(zkqldata)
table.print(zkqlresults)

zkqnresults <- quant.analysis(zkqndata)
gmr.print(zkqnresults)

# zika 90 x dengue 50 2016 ------------------------------------------------

ZD.2016.brid <- ZK.2016[,.(Sample = reg, REF = `PRNT 90`, NEW = `PRNT 50 D1`)]
zkqldata <- qual.data(ZD.2016.brid)
zkqndata <- quant.data(ZD.2016.brid)

zkqlresults <- qual.analysis(zkqldata)
table.print(zkqlresults)

zkqnresults <- quant.analysis(zkqndata)
gmr.print(zkqnresults)
