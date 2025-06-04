pbd <- function(n) {
  if (n > 365) {
    return(1)  # If there are more people than days, at least 2 share a birthday 100%
  }
  
  noMatch <- 1
  for (i in 0:(n-1)) {
    noMatch <- noMatch * (365 - i) / 365 # Assume no leap years
  }
  
  return(1 - noMatch)
}

# Test call
pbd(23)