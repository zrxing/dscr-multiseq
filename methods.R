sourceDir("methods")

addMethod(dsc_multiseq, "multiseq.default", multiseq.wrapper, outputtype = "ms_output", args = list(ashparam = list(prior = "uniform")))