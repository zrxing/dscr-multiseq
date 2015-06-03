#define your methods in .R files like this one in the methods subdirectory
#each method should take arguments input and args, like the example
#the output should be a list of the appropriate "output" format (defined in the README)

#source the preprocess file
source("WaveQTL_preprocess_funcs.R")



#runs waveqtl on a give dataset with a set of specified parameters
#inputs:
#input: a list containing sim.data: the matrix of simulated counts, and g: a vector of group indicators
#args: a list containing specified waveqtl options
#
#returns the results from waveqtl
waveqtl.wrapper = function(input, args){
  wave.pre=WaveQTL_preprocess(Data = input$sim.data, library.read.depth = args$read.depth, meanR.thresh = args$meanR.thresh)
  setwd("waveqtl")
  write.table(wave.pre$WCs, file = "wc.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)
  cat(wave.pre$filtered.WCs, file = "use.txt")
  write(c("rs", "A", "T", input$g), file = "geno.txt", ncolumns = 3 + length(input$g))
  waveqtl.params = as.integer(dim(input$sim.data)[2])
  write(waveqtl.params, file = "waveqtl.params", ncolumns = 1)
  system("sh ../methods/run_waveqtl.sh < waveqtl.params" )
  loglr = read.table("output/wave_out.fph.logLR.txt", header=FALSE)
  loglr = loglr[1, 2]
  setwd("..")
  return(loglr)
}