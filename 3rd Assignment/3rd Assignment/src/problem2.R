# load trees
girth <- trees[,1] # actually diameter, in inches
height <- trees[,2] # in feet
volume <- trees[,3] # in cubic feet
# What is the average height of the cherry trees?
mean(height)
# What is the average girth of trees that are more than 75 ft tall?
mean(girth[(height > 75)])
# What is the maximum height of trees with a volume between 15 and 35 ft3?
max(height[(volume>15)&(volume<35)])