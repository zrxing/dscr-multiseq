#ms2loglr selects the loglr from the output of multiseq

ms2loglr = function(output){
  return(list(loglr = output$logLR$value))  
}

addOutputParser(dsc_multiseq, "ms2loglr", ms2loglr, "ms_output", "loglr_output")


score.loglr = function(data, output){
  loglr = output
  return(list(loglr = loglr))
}
addScore(dsc_multiseq, score.loglr, "loglr", outputtype = "loglr_output")
