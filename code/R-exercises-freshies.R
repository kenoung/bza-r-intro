# Practice Problems
# Using the classic 'iris' dataset

#####################
# Prepping the data #
#####################
# Set your working environment

#****************#
#*YOUR CODE HERE*#
#****************#

##############
# Question 1 #
##############
# Import dataset from iris.csv

#****************#
#*YOUR CODE HERE*#
#****************#

##############
# Question 2 #
##############
# iris is now a data.frame. Convert it to a data.table and name it iris_dt

#****************#
#*YOUR CODE HERE*#
#****************#

##############
# Question 3 #
##############
# Add a new column named 'Color' to iris
# All rows belonging to the 'setosa' species should have the color 'green'
# versicolor --> 'blue'
# virginica --> 'red'

#****************#
#*YOUR CODE HERE*#
#****************#

##############
# Question 4 #
##############
# Perform linear regression and save the linear model to 'fit_1'
# Use Petal.Width, Petal.Length and Sepal.Width to predict Sepal.Length 

#****************#
#*YOUR CODE HERE*#
#****************#

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

#****************#
#*YOUR CODE HERE*#
#****************#


# Is multi-collinearity a problem with your dataset?
# Two possible solutions:
#  1 - Remove problematic variable
#  2 - Transform variable

# In this case, we'll use (2) - transforming the variable.
# Let's try transforming the two variables into Petal.Area and Petal.Diff, 
# adding these two new columns to the 'iris_dt' dataset.
# Petal Area is the product of Petal.Length and Petal.Width
# Petal Diff is the difference btwn Petal Length and Petal Width

#****************#
#*YOUR CODE HERE*#
#****************#

# And redoing the linear regression using the new variables
# Specifically, we want to regress Sepal.Length again Petal.Area, Petal.Diff
# and Sepal.Width. Save this to fit_2

#****************#
#*YOUR CODE HERE*#
#****************#

summary(fit_2)

# Check coefficients
pairs(iris_dt[, .(Sepal.Length, Petal.Area, Petal.Diff, Sepal.Width)], 
      main = "Iris Data -- Verifying coefficients", 
      bg = iris_dt$Color,
      pch = 21)

# Do the coefficients match up with the plots?

# Verify no multi-collinearity in this model

#****************#
#*YOUR CODE HERE*#
#****************#

##############
# Question 6 #
##############
# Subset the data.table 'iris_dt' to get only the species 'setosa'

#****************#
#*YOUR CODE HERE*#
#****************#

# Now repeat the above with versicolor and virginica

#****************#
#*YOUR CODE HERE*#
#****************#

# Use a boxplot to compare the Petal.Area of the different Species

#****************#
#*YOUR CODE HERE*#
#****************#

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


#****************#
#*YOUR CODE HERE*#
#****************#

###########
# Grading #
###########
# Check answer by running test cases
source("~/R Intro/bza-r-intro/code/R-exercises-test.R")

