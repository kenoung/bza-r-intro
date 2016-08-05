# Import libraries
library(data.table)

# Set working directory
setwd("C:/Users/Ken/Dropbox/Academics/2016/Sem2/R Intro/bza-r-intro")

# Import data
student.mat <- read.csv("data/student/student-mat.csv", sep=";")

# Convert to data.table
student.mat <- as.data.table(student.mat)

summary(student.mat)

################
# Student Ages #
################
# Convert age to factor
student.mat$age <- as.factor(student.mat$age)
ms_age <- table(student.mat[school=="MS", age])
gp_age <- table(student.mat[school=="GP", age])

# Plotting
barplot(ms_age, col="red", border="red", density=10, ylim=c(0,100))
par(new=TRUE)
barplot(gp_age, col="blue", border="blue", density=11, ylim=c(0, 100),
        main="Student Ages in MS vs GP", xlab="Age", ylab="Number of Students")
legend("topright", legend = c("MS", "GP"), fill = c("red", "blue"), density=50)

###############
# GP Students #
###############
gp <- student.mat[school=="GP"]
pairs(gp[, c(7:15, 32), with=FALSE])
