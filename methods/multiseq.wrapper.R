#define your methods in .R files like this one in the methods subdirectory
#each method should take arguments input and args, like the example
#the output should be a list of the appropriate "output" format (defined in the README)
library(multiseq)


#this function sets the default parameters for function multiseq
setMSparam = function(msparam){
  if(is.null(msparam$reflect)){
    msparam$reflect = FALSE    
  }
  if(is.null(msparam$baseline)){
    msparam$baseline = "inter"
  }
  if(is.null(msparam$minobs)){
    msparam$minobs = 1
  }
  if(is.null(msparam$pseudocounts)){
    msparam$pseudocounts = 0.5
  }
  if(is.null(msparam$all)){
    msparam$all = FALSE
  }
  if(is.null(msparam$center)){
    msparam$center = FALSE
  }
  if(is.null(msparam$verbose)){
    msparam$verbose = TRUE
  }
  if(is.null(msparam$ashparam)){
    msparam$ashparam = list()
  }
  return(msparam)
}

#runs multiseq on a give dataset with a set of specified parameters
#inputs:
#input: a list containing sim.data: the matrix of simulated counts, and g: a vector of group indicators
#args: a list containing specified multiseq options
#
#returns the results from multiseq
multiseq.wrapper = function(input, args){
    msparam = setMSparam(args)
    res = do.call(multiseq, c(list(x = input$sim.data, g = input$g), msparam))
    return(res)
}