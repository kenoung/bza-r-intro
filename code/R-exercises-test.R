
cat("
#####################
# Testing your code #
#####################\n
")

# Initialize scores
q1 <- 0
q2 <- 0
q3 <- 0
q4 <- 0
q5 <- 0
q6 <- 0
q7 <- 0

########
# Qn 1 #
########
cat("Testing Qn1....")

# Check iris dataset exists
if (!exists("iris")) {
  warning(paste("'iris' dataset not found. Did you import and save the",
                "dataset to 'iris'"))

# Check the headings
} else if (!all(names(iris) == c("Sepal.Length", 
                                "Sepal.Width", 
                                "Petal.Length", 
                                "Petal.Width", 
                                "Species"))) {
  warning("The iris dataframe has the wrong headings")
  
# Check number of rows of dataset
} else if (nrow(iris) != 150) {
  warning("The iris dataframe has the wrong number of rows")

# Passed all tests
} else {
  q1 <- 1
}

if (q1) cat("Passed\n") else  cat("Failed\n")

########
# Qn 2 #
########
cat("Testing Qn2....")

# Check iris dataset exists
if (!exists("iris_dt")) {
  warning(paste("'iris_dt' does not exist. Did you remember to save it as",
                "'iris_dt'?"))

# Check object is a data.table
} else if (!("data.table" %in% class(iris_dt))) {
  warning("iris_dt is not a data.table")
  
  # Passed all tests
} else {
  q2 <- 1
}

if (q2) cat("Passed\n") else  cat("Failed\n")

########
# Qn 3 #
########
cat("Testing Qn3....")

# Check number of rows
if (nrow(iris_dt) != 150) {
  warning("'iris_dt' has the wrong number of rows.")

# Check number of columns
} else if (ncol(iris_dt) <= 5) {
  warning(paste("'iris_dt' has the wrong number of columns. Have you added", 
                "the 'Color' column?"))
  
# Check for Color column
} else if (!("Color" %in% names(iris_dt))) {
  warning("'iris_dt' does not have the column 'Color'. Did you mispell it?")
  
# Check if the setosa color is correct
} else if (any(iris_dt[Species=='setosa', Color] != "green")) {
  warning("'setosa' should be green")
  
# Check if the versicolor color is correct
} else if (any(iris_dt[Species=='versicolor', Color] != "blue")) {
  warning("'versicolor' should be blue")

# Check if the virginica color is correct
} else if (any(iris_dt[Species=='virginica', Color] != "red")) {
  warning("'virginica' should be red")
  
# All tests passed
} else {
  q3 <- 1
  
}

if (q3) cat("Passed\n") else  cat("Failed\n")

########
# Qn 4 #
########
cat("Testing Qn4....")

# Check fit_1 exists
if (!(exists("fit_1"))) {
  warning(paste("'fit_1' does not exist. Did you make sure to save your model",
                "to the variable 'fit_1'?"))

# Check fit_1 has 4 coefficients
} else if (length(coefficients(fit_1)) != 4) {
  warning("'fit_1' has the wrong number of regressors!")

# Check the coefficients of fit_1     
} else if (!(all.equal(as.numeric(coefficients(fit_1)), 
                       c(1.85600, 0.70913, -0.55648, 0.65084), 
                       tolerance=1e-3))) {
  warning("Check your model. It seems to have the wrong coefficients.")
  
} else {
  q4 <- 1
  
}

if (q4) cat("Passed\n") else  cat("Failed\n")

########
# Qn 5 #
########
cat("Testing Qn5....")

# Check that fit_2 exists
if (!exists("fit_2")) {
  warning(paste("'fit_2' does not exist. Did you make sure to save your model",
                "to the variable 'fit_2'?"))
  
# Check fit_2 has 4 coefficients
} else if (length(coefficients(fit_2)) != 4) {
  warning("'fit_2' has the wrong number of regressors!")
  
# Check the coefficients of fit_2     
} else if (!(all.equal(as.numeric(coefficients(fit_2)), 
                       c(2.0883, 0.0339, 0.6634, 0.6087), 
                       tolerance=1e-3))) {
  warning("Check your model. It seems to have the wrong coefficients.")
  
} else {
  q5 <- 1
  
}

if (q5) cat("Passed\n") else  cat("Failed\n")

#######
# Qn6 #
#######
cat("Testing Qn6....")

q6_t <- function(species) {
  species.name = deparse(substitute(species))
  
  # Check species exists
  if (!(exists(species.name))){
    warning(paste(species.name, 
                  "has not been defined\n"))
  }
  
  # Check object is a data.table
  else if (!("data.table" %in% class(species))) {
    warning(paste(species.name,
                  "is not a data.table\n"))
  }
  
  # Check object is of correct type
  else if (!(all(species[, Species] == species.name))) {
    warning(paste(species.name,
                  "has the wrong species in the table"))
  } 
  
  # Check table has correct number of rows
  else if (nrow(species) != 50) {
    warning(paste(species.name,
                  "has the wrong number of rows"))
  }
  
  # Passed all tests
  else {
    return(1)
  }
  
  return(0)
}

# Marking
q6 <- min(q6_t(setosa), q6_t(versicolor), q6_t(virginica))
if (q6) cat("Passed\n") else  cat("Failed\n")

########
# Qn 7 #
########
cat("Testing Extra Qn....")

# Test function exists
if (!exists("SumOfSquares")) {
  warning("The function 'SumOfSquares' does not exist.")

# Check that SumOfSquares is a function
} else if (class(SumOfSquares) != "function") {
  warning("'SumOfSquares' is not defined as a function. Check your syntax.")
  
# Test Case 1
} else if (SumOfSquares(3, 4) != 25) {
  warning(paste("SumOfSquares(3,4) should produce 25, but it currently returns",
                SumOfSquares(3,4)))

# Test Case 2
} else if (SumOfSquares(123, 32) != 16153) {
  warning(paste("SumOfSquares is not returning the right value for the hidden",
                "test case."))
  
} else {
  q7 <- 1
}

if (q7) cat("Passed\n") else  cat("Failed\n")

###########
# Grading #
###########

# Barplot results
barplot(rep(1, 7), col="red", axes=F)
par(new=TRUE)
barplot(c(q1, q2, q3, q4, q5, q6, q7), 
        names.arg = 1:7,
        col="green",
        main="Progress", 
        xlab = "Tests",
        axes=F)

############
# Clean up #
############
rm(q1, q2, q3, q4, q5, q6, q7)

