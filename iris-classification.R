# Importing libraries
library(datasets) # for iris dataset
library(caret) # for machine learning algorithms - classification and regression trees

# Importing dataset
data(iris)

# Checking the structure of the dataset
data(iris)

# Check to see if there are any missing values
any(is.na(iris))

# To achieve reproducible results, we set the seed
set.seed(999)

# Splitting the dataset into the Training set and Test set
# 70% of the dataset will be used for training and 30% for testing
TrainingIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
Training_set <- iris[TrainingIndex, ] # Training set
Test_set <- iris[-TrainingIndex, ] # Test set

# Compare the scatterplot of the training and test set
# Training set
plot(Training_set$Petal.Length, Training_set$Petal.Width, col = Training_set$Species, pch = 19, cex = 2)
legend("topright", legend = levels(Training_set$Species), col = 1:3, pch = 19)
# Test set
plot(Test_set$Petal.Length, Test_set$Species, col = Test_set$Species, pch = 19, cex = 2)
legend("topright", legend = levels(Test_set$Species), col = 1:3, pch = 19)


view(Training_set)
view(Test_set)


############################################
# SVM model (polynomial kernel)

# Build Training model
Model <- train(Species ~ ., data = Training_set, 
                method = "svmPoly", 
                na.action = na.omit,
                preProcess = c("center", "scale"),
                trControl = trainControl(method = "none"))
                tuneGrid = data.frame(degree = 1, scale = 1, C = 1)
                )