# Import necessary libraries
library(mlbench) # Contains several benchmark datasets
library(caret) # For machine learning algorithms - classification and regression trees

# Importing dataset
data(BostonHousing)

# Check if there are any missing values
sum(is.na(BostonHousing))

# To achieve reproducible results, we set the seed
set.seed(42)

# Stratified splitting the dataset into the Training set and Test set
TrainingIndex <- createDataPartition(BostonHousing$medv, p = 0.8, list = FALSE)
Training_set <- BostonHousing[TrainingIndex, ] # Training set
Test_set <- BostonHousing[-TrainingIndex, ] # Test set

############################################
# Build Training model
Model <- train(medv ~ ., data = Training_set, 
                method = "lm", 
                na.action = na.omit,
                preProcess = c("center", "scale"),
                trControl = trainControl(method = "none")
)

# Apply model for prediction
Model.training <- predict(Model, Training_set) # Apply model to make prediction on training set
Model.testing <- predict(Model, Test_set) # Apply model to make prediction on test set

# Model performance (Display scatter plot and performance statistics)
plot(Training_set$medv, Model.training, col = "blue", pch = 19, cex = 2)
plot(Test_set$medv, Model.testing, col = "red", pch = 19, cex = 2)
legend("topright", legend = c("Training set", "Test set"), col = c("blue", "red"), pch = 19)

# Model performance summary
summary(Model)

# Calculate Pearson correlation coefficient
R.training <- cor(Training_set$medv, Model.training)
R.testing <- cor(Test_set$medv, Model.testing)

R2.training <- R.training^2
R2.testing <- R.testing^2

