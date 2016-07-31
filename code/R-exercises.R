# Practice Problems
# Using the classic 'iris' dataset

#####################
# Prepping the data #
#####################
# Set your working environment
setwd("C:/Users/Ken/Dropbox/Academics/2016/Sem2/R Intro/bza-r-intro/code")

##############
# Question 1 #
##############
# Import dataset from iris.csv
iris <- read.csv("C:/Users/Ken/Dropbox/Academics/2016/Sem2/R Intro/bza-r-intro/data/iris.csv", skip=2)

##############
# Question 2 #
##############
# iris is now a data.frame. Convert it to a data.table and name it iris_dt
# install.packages("data.table")
library(data.table)
iris_dt <- as.data.table(iris)

##############
# Question 3 #
##############
# Add a new column named 'Color' to iris
# All rows belonging to the 'setosa' species should have the color 'green'
# versicolor --> 'blue'
# virginica --> 'red'
iris_dt[Species == "setosa", Color := "green"]
iris_dt[Species == "versicolor", Color := "blue"]
iris_dt[Species == "virginica", Color := "red"]

##############
# Question 4 #
##############
# Perform linear regression and save the linear model to 'fit_1'
# Use Petal.Width, Petal.Length and Sepal.Width to predict Sepal.Length 
fit_1 <- lm(Sepal.Length ~ Petal.Length + Petal.Width + Sepal.Width, data = iris_dt)
summary(fit_1)

# What do the coefficients imply?
# Plot three scatterplot to confirm your guess about the coefficients. 
plot(iris_dt$Sepal.Length, iris_dt$Sepal.Width)
plot(iris_dt$Sepal.Length, iris_dt$Petal.Width)
plot(iris_dt$Sepal.Length, iris_dt$Petal.Length)

##############
# Question 5 #
##############
# Check the multi-collinearity of the model 'fit_1'
library(car)
vif(fit_1)

# Is multi-collinearity a problem with your dataset?
# Two possible solutions:
#  1 - Remove problematic variable
#  2 - Transform variable

# Let's try transforming the two variables into Petal.Area and Petal.Diff, 
# adding these two new columns to the 'iris_dt' dataset.
iris_dt[, Petal.Area := Petal.Length * Petal.Width]
iris_dt[, Petal.Diff := Petal.Length - Petal.Width]

# And redoing the linear regression using the new variables
# Specifically, we want to regress Sepal.Length again Petal.Area, Petal.Diff
# and Sepal.Width
fit_2 <- lm(Sepal.Length ~ Petal.Area + Petal.Diff + Sepal.Width, data = iris_dt)
summary(fit_2)

# Check coefficients
pairs(iris_dt[, .(Sepal.Length, Petal.Area, Petal.Diff, Sepal.Width)], 
      main = "Iris Data -- Verifying coefficients", 
      bg = iris_dt$Color,
      pch = 21)

# Do the coefficients match up with the plots?

# Verify no multi-collinearity in this model
vif(fit_2)

##############
# Question 6 #
##############
# Subset the data.table 'iris_dt' to get only the species 'setosa'
setosa <- iris_dt[Species=="setosa"]

# Now repeat the above with versicolor and virginica
versicolor <- iris_dt[Species=="versicolor"]
virginica <- iris_dt[Species=="virginica"]

# Use a boxplot to compare the Petal.Area of the different Species
boxplot(setosa[, Petal.Area], versicolor[, Petal.Area], virginica[, Petal.Area],
        main = "Comparing Estimated Petal Area Between Species",
        names = c("setosa", "versicolor", "virginica"))

#########
# Extra #
#########
# If you're quick and done with the first 6 questions, try this.
# Define a function "SumOfSquares that takes two arguments 'x' and 'y', and 
# returns the sum of x-squared and y-squared.
# 
# > SumOfSquares(3, 4) 
# 25
#
# > SumOfSquares(0, 1) 
# 1
# 
# > SumOfSquares(100, 200)
# 50000
SumOfSquares <- function(x, y) {
  return(x**2 + y**2)
}



###########
# Grading #
###########
# Check answer by running test cases
source("R-exercises-test.R")

