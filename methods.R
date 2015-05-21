sourceDir("methods")

addMethod(dsc_multiseq, "multiseq.default", multiseq.wrapper, outputtype = "ms_output", args = list(ashparam = list(prior = "uniform")))
addMethod(dsc_multiseq, "waveqtl.default", waveqtl.wrapper, outputtype = "loglr_output", args = list(read.depth = NULL, meanR.thresh = 2))