# Read the data
ch6 <- read.table("data/H938_Euro_chr6.geno", header = TRUE)
dim(ch6)
head(ch6)
tail(ch6)

# Check the number of individuals sampled
unique(ch6$nA1A1 + ch6$nA1A2 + ch6$nA2A2)
# there are some polymorphisms with missing data from a few individuals, thus we use max().
max(ch6$nA1A1 + ch6$nA1A2 + ch6$nA2A2)

# We can achieve the same with rowSums()
max(rowSums(ch6[5:7]))

# For how many SNPs are all sampled individuals are homozygous, i.e., all A1A1 or all A2A2?
homozygous <- ch6[ch6$nA1A2 == 0,"SNP"]
length(homozygous)

# For how many SNPs are more than 99% of the sampled individuals homozygous?
sampledIndividuals = 124
targetPercentile = 0.99
homozygous99 <- ch6[ch6$nA1A2 < (1-targetPercentile)*sampledIndividuals,"SNP"]
length(homozygous99)

# Let's take into account that for some SNPs there are less data points...
sampledIndividuals = rowSums(ch6[5:7])
targetPercentile = 0.99
homozygous99 <- ch6[ch6$nA1A2 < (1-targetPercentile)*sampledIndividuals,"SNP"]
length(homozygous99)

# in this case, it doesn't make a difference, both answers are 3368 SNPs