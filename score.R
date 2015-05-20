ms2loglr = function(output){
  return(list(loglr = output$logLR$value))  
}

addOutputParser(dsc_multiseq, "ms2loglr", ms2loglr, "ms_output", "loglr_output")


score = function(data, output){
  loglr = output
  return(list(loglr = loglr))
}
addScore(dsc_multiseq, score, "ms.loglr", outputtype = "loglr_output")
addScore(dsc_multiseq, score, "wave.loglr")