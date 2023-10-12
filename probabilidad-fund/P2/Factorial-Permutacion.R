n_factorial <- function(x) {
  res = 1
  if(x != 0){
    for (i in 1:x) {
      res = res*i
    }
  }
  return(res)
}

perm <- function(n,k) {
  return((n_factorial(n))/(n_factorial(n-k)))
}