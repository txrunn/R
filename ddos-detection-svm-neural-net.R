# Loading the necessary libraries
library(caret) # For creating the training and testing sets
library(e1071) # For the SVM model
library(nnet)  # For the neural network model

# Loading the balanced DDoS dataset
ddos_data <- read.csv("/data/final_dataset.csv") # Thank you to the author of the dataset (DEVENDRA on kaggle.com) for making it available

# Setting the seed for reproducibility
set.seed(123)

# Creating a partition of the dataset
inTrain <- createDataPartition(ddos_data$label, p = 0.7, list = FALSE) # p = 0.7 means 70% of the dataset will be used for training and 30% for testing

# Using the partition to create the training and testing sets
training <- ddos_data[inTrain, ] # 70% of the dataset
testing <- ddos_data[-inTrain, ] # 30% of the dataset

# Training the One-Class SVM model
svm_model <- svm(label ~ .,                   # The model will be trained to predict the label column which is whether or not the packet is a DDoS attack
                 data = training,             # will be trained on the training set
                 type = "one-classification", # will be trained to detect anomalies
                 kernel = "radial",           # will use a radial kernel meaning the model will be trained to detect anomalies based on the distance between the data points
                 nu = 0.1)                    # will use a nu of 0.1 (the percentage of outliers)

# Making predictions on the testing set
svm_predictions <- predict(svm_model, newdata = testing[, -1]) # The model will predict the label column which is whether or not the packet is a DDoS attack

# Evaluating the One-Class SVM model's performance
confusionMatrix(svm_predictions, testing$label)

# Extract the number of true positives, false positives and false negatives from the confusion matrix
svm_true_positives <- confusionMatrix(svm_predictions, testing$label)$table[1, 1]
svm_false_positives <- confusionMatrix(svm_predictions, testing$label)$table[2, 1]
svm_false_negatives <- confusionMatrix(svm_predictions, testing$label)$table[2, 2]

# Calculate the precision and recall
# The precision is the number of true positives divided by the number of true positives plus the number of false positives
svm_precision <- svm_true_positives / (svm_true_positives + svm_false_positives)
# The recall is the number of true positives divided by the number of true positives plus the number of false negatives
svm_recall <- svm_true_positives / (svm_true_positives + svm_false_negatives)

# Training the neural network model
nn_model <- nnet(label ~ .,                   # The model will be trained to predict the label column which is whether or not the packet is a DDoS attack
                 data = training,             # will be trained on the training set
                 size = 1,                    # will have 1 hidden layer
                 decay = 0.01,                # will use a decay of 0.01
                 linout = FALSE,              # will use a sigmoid activation function
                 maxit = 100)                 # will train for a maximum of 100 iterations

# Making predictions on the testing set
nn_predictions <- predict(nn_model, newdata = testing[, -1], type = "class") # The model will predict the label column which is whether or not the packet is a DDoS attack

# Evaluating the neural network model's performance
confusionMatrix(nn_predictions, testing$label)

# Extract the number of true positives, false positives and false negatives from the confusion matrix
nn_true_positives <- confusionMatrix(nn_predictions, testing$label)$table[1, 1]
nn_false_positives <- confusionMatrix(nn_predictions, testing$label)$table[2, 1]
nn_false_negatives <- confusionMatrix(nn_predictions, testing$label)$table[2, 2]

# Calculate the precision and recall
nn_precision <- nn_true_positives / (nn_true_positives + nn_false_positives)
nn_recall <- nn_true_positives / (nn_true_positives + nn_false_negatives)