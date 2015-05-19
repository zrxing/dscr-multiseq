datamaker = function(args){
  
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
    sim.data[1:(m/2)] = matrix(rpois(n * (m/2), baseline), nr = m/2, ncol = n, byrow = TRUE)
    sim.data[((m/2) + 1):m] = matrix(rpois(n * (m/2), baseline * effect), nr = m/2, ncol = n, byrow = TRUE)
  }else{
    stop("Error: data type not recognized")
  }
  
  input = list(sim.data = sim.data, g = g)
  return(input)
}
