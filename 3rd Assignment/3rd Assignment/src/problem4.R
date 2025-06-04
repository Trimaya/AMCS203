# i) For each of the probability distributions U(0,1), Exp(1), N(0,1) and Poisson(5), generate 105 random deviates
yUniform <- runif(1e5, min = 0, max = 1)
yExponential <- rexp(1e5, rate = 1)
yNormal <- rnorm(1e5, mean = 0, sd = 1)
yPoisson <- rpois(1e5, lambda = 5)

# and plot the resulting histogram using the command hist with 20 equally spaced bins.
par(mfrow=c(2,2))
hist(yUniform, breaks = 20)
hist(yExponential, breaks = 20)
hist(yNormal, breaks = 20)
hist(yPoisson, breaks = 20)

# ii) Histograms with Z for different values of n.

# calculating
N = c(1, 2, 3, 6, 12, 30)

# Uniform Distribution
zUniform <- matrix(NA, nrow = 1e5, ncol = length(N))
for (i in 1:length(N)) {
  zUniform[,i] <- replicate(1e5, sum(runif(N[i], min = 0, max = 1)))
}

# Exponential Distribution
zExponential <- matrix(NA, nrow = 1e5, ncol = length(N))
for (i in 1:length(N)) {
  zExponential[,i] <- replicate(1e5, sum(rexp(N[i], rate = 1)))
}

# Normal Distribution
zNormal <- matrix(NA, nrow = 1e5, ncol = length(N))
for (i in 1:length(N)) {
  zNormal[,i] <- replicate(1e5, sum(rnorm(N[i], mean = 0, sd = 1)))
}

# Poisson Distribution
zPoisson <- matrix(NA, nrow = 1e5, ncol = length(N))
for (i in 1:length(N)) {
  zPoisson[,i] <- replicate(1e5, sum(rpois(N[i], lambda = 5)))
}

# Plotting Uniform Distribution
par(mfrow = c(2, 3))
for (i in 1:length(N)) {
  hist(zUniform[,i], breaks = 20, main = sprintf("Uniform: N = %i", N[i]), col = 'skyblue', xlab = "Sum of Uniform(0,1)")
}

# Plotting Exponential Distribution
par(mfrow = c(2, 3))
for (i in 1:length(N)) {
  hist(zExponential[,i], breaks = 20, main = sprintf("Exponential: N = %i", N[i]), col = 'lightgreen', xlab = "Sum of Exp(1)")
}

# Plotting Normal Distribution
par(mfrow = c(2, 3))
for (i in 1:length(N)) {
  hist(zNormal[,i], breaks = 20, main = sprintf("Normal: N = %i", N[i]), col = 'lightcoral', xlab = "Sum of N(0,1)")
}

# Plotting Poisson Distribution
par(mfrow = c(2, 3))
for (i in 1:length(N)) {
  hist(zPoisson[,i], breaks = 20, main = sprintf("Poisson: N = %i", N[i]), col = 'lightgoldenrod', xlab = "Sum of Poisson(5)")
}

# we can use breaks = seq(min(zUniform[,i]), max(zUniform[,i]), length.out = 21) to force 20 bins.
# By default R chooses "pretty" values

# iii) Central Limit Theorem

# we use probability = TRUE parameter so that the height of the histogram and normal curve of the graph is the same.

par(mfrow=c(2,2))

# Uniform
mu_uniform <- mean(zUniform[,6])
sigma_uniform <- sd(zUniform[,6])

# Plotting the histogram (normalized) and the normal curve
hist(zUniform[,6], breaks = 20, probability = TRUE, main = "Uniform: n = 30", col = 'skyblue', xlab = "Sum of Uniform(0,1)")
curve(dnorm(x, mean = mu_uniform, sd = sigma_uniform), add = TRUE, col = "blue", lwd = 2)

# Exponential
mu_exponential <- mean(zExponential[,6])
sigma_exponential <- sd(zExponential[,6])

# Plotting the histogram (normalized) and the normal curve
hist(zExponential[,6], breaks = 20, probability = TRUE, main = "Exponential: n = 30", col = 'lightgreen', xlab = "Sum of Exp(1)")
curve(dnorm(x, mean = mu_exponential, sd = sigma_exponential), add = TRUE, col = "blue", lwd = 2)

# Normal
mu_normal <- mean(zNormal[,6])
sigma_normal <- sd(zNormal[,6])

# Plotting the histogram (normalized) and the normal curve
hist(zNormal[,6], breaks = 20, probability = TRUE, main = "Normal: n = 30", col = 'lightcoral', xlab = "Sum of N(0,1)")
curve(dnorm(x, mean = mu_normal, sd = sigma_normal), add = TRUE, col = "blue", lwd = 2)

# Poisson
mu_poisson <- mean(zPoisson[,6])
sigma_poisson <- sd(zPoisson[,6])

# Plotting the histogram (normalized) and the normal curve
hist(zPoisson[,6], breaks = 20, probability = TRUE, main = "Poisson: n = 30", col = 'lightgoldenrod', xlab = "Sum of Poisson(5)")
curve(dnorm(x, mean = mu_poisson, sd = sigma_poisson), add = TRUE, col = "blue", lwd = 2)
