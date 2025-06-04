data <- read.csv("data/NicSolstatus.csv")


# Manually counting the statuses
count_status_0 <- 0
count_status_1 <- 0
count_status_2 <- 0
count_status_3 <- 0
count_status_4 <- 0
count_status_5 <- 0

for (i in 1:nrow(data)) {
  if (data$Status[i] == 0) {
    count_status_0 <- count_status_0 + 1
  } else if (data$Status[i] == 1) {
    count_status_1 <- count_status_1 + 1
  } else if (data$Status[i] == 2) {
    count_status_2 <- count_status_2 + 1
  } else if (data$Status[i] == 3) {
    count_status_3 <- count_status_3 + 1
  } else if (data$Status[i] == 4) {
    count_status_4 <- count_status_4 + 1
  } else if (data$Status[i] == 5) {
    count_status_5 <- count_status_5 + 1
  }
}

# Compare your results with those obtained from the buil-in command table
status_counts <- table(data$Status)

# and plot a barplot of the results obtained.
status_counts <- c(count_status_0,count_status_1,count_status_2,count_status_3,count_status_4,count_status_5)

barplot(status_counts, 
        main = "Status Counts",
        xlab = "Status",
        ylab = "Counts",
        col = "lightblue",
        names.arg = c("0","1", "2", "3", "4", "5"),
        ylim = c(0, max(status_counts) + 10))

# Species status counts per genus

# extract the genus from the species names
data$Genus <- sapply(strsplit(as.character(data$Species), "_"), `[`, 1)

# create a table for counts
genus_status_counts <- table(data$Genus, data$Status)

# Now we convert it into a dataframe!
data_frame_counts <- as.data.frame.matrix(genus_status_counts)
