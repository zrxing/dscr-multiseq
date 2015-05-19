#define your methods in .R files like this one in the methods subdirectory
#each method should take arguments input and args, like the example
#the output should be a list of the appropriate "output" format (defined in the README)
library(multiseq)

setMSparam = function(msparam){
  if(is.null(reflect)){
    reflect = FALSE    
  }
  if(is.null(baseline)){
    baseline = "inter"
  }
  if(is.null(minobs)){
    minobs = 1
  }
  if(is.null(pseudocounts)){
    pseudocounts = 0.5
  }
  if(is.null(all)){
    all = FALSE
  }
  if(is.null(center)){
    center = FALSE
  }
  if(is.null(repara)){
    repara = TRUE
  }
  if(is.null(forcebin)){
    forcebin = FALSE
  }
  if(is.null(lm.approx)){
    lm.approx = TRUE
  }
  if(is.null(disp)){
    disp = "add"
  }
  if(is.null(shape.eff)){
    shape.eff = FALSE
  }
  if(is.null(cxx)){
    cxx = TRUE
  }
  if(is.null(smoothing)){
    smoothing = TRUE
  }
  if(is.null(cyclespin)){
    cyclespin = TRUE
  }
  if(is.null(reverse)){
    reverse = TRUE
  }
  if(is.null(get.fitted.g)){
    get.fitted.g = TRUE
  }
  if(is.null(verbose)){
    verbose = TRUE
  }
  if(is.null(ashparam)){
    ashparam = list()
  }
}

#runs wavelet shrinkage method SMASH assuming a constant variance
#inputs:
#input: a list containing x: the data, sig.true the true sigma values, and sig.est: the estimated sigma values
#args: a list containing family and filter.number, which determine the wavelet basis used
#
#returns the estimated (posterior mean) mean function
multiseq.wrapper = function(input, args){
    msparam = setMSparam(args)
    res = do.call(multiseq, c(list(x = input$sim.data, g = input$g), msparam))
    return(res)
}