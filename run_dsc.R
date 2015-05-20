library(dscr)

setwd("~/dscr-multiseq")

system("mkdir waveqtl/")

dsc_multiseq=new.dsc("poisson_count_loglr","~/dscr-multiseq")
source("scenarios.R")
source("methods.R")
source("score.R")
res=run_dsc(dsc_multiseq)

system("rm -r waveqtl/")


save(res,file="res.Robj")
save.image("res.RData")

