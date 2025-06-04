# Create a vector x containing all the even numbers between 2 and 100 (inclusive)
x <- seq(from = 2, to = 100, by = 2)
x
# extract all the elements of x that are divisible by 12 and count them.
x[(x %% 12) == 0]
length(x[(x %% 12) == 0])
# What is the sum and the average of all the elements of x?
sum(x)
mean(x)
x
# Create a vector y that contains all numbers between 0 and 30
y <- seq(from = 1, to = 29, by = 1)
# that are divisible by 3
y <- y[(y %% 3) == 0]
y
# and find the elements of y that are also elements of x.
intersect(x,y)

# Does seq(2,100,by=2) produce the same vector as (1:50)*2?
seq(2,100,by=2)
(1:50)*2
identical((1:50)*2,seq(2,100,by=2))