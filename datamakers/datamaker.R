#pois.2grp generates the specified number samples, each of which is a Poisson process generated from the baseline (null) or baseline*effect (alternative). 
#The samples are automatically classified into two groups, with an equal number of samples in each group

pois.2grp = function(args){
  
  if(m%%2 != 0) stop("The number of samples must be a multiple of 2")

  m = args$m
  type = args$type
  baseline = args$baseline
  effect = args$effect
  
  n = length(baseline)
  g = rep(0:1, each = m/2)
  
  sim.data = matrix(0, nr = m, ncol = n)
  
  if(type == "null"){
    sim.data = matrix(rpois(n * m, baseline), nr = m, ncol = n, byrow = TRUE)
  }else if(type == "alt"){
    sim.data[1:(m/2), ] = matrix(rpois(n * (m/2), baseline), nr = m/2, ncol = n, byrow = TRUE)
    sim.data[((m/2) + 1):m, ] = matrix(rpois(n * (m/2), baseline * effect), nr = m/2, ncol = n, byrow = TRUE)
  }else{
    stop("Error: data type not recognized")
  }
  
  input = list(sim.data = sim.data, g = g)
  return(list(input = input))
}
