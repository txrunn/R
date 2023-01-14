# R
This folder contains R scripts and data for various data analysis and machine learning tasks. The scripts showcase my experience and skills in data pre-processing, model building, and performance evaluation. Each script demonstrates a different technique or algorithm for solving a specific problem.

## Contents

#
### [iris_classification.R](R/iris-classification.R)
This script demonstrates building classification models using the Support Vector Machine (SVM) algorithm with a polynomial kernel. The script uses the popular iris dataset, which contains 150 observations of iris flowers, with four features (sepal length, sepal width, petal length, and petal width) and three different species of iris (setosa, versicolor, and virginica).

The script first imports the necessary libraries, including datasets to import the iris dataset, and caret which contains various machine learning algorithms and tools for data pre-processing and model evaluation.

The script then loads the iris dataset and checks for missing values. To ensure reproducible results, the script sets the seed for random number generation.

Next, the script splits the dataset into a training set (80%) and a test set (20%). This allows for the model to be trained on the majority of the data, and then tested on unseen data to evaluate its performance.

The script then uses the train function from the caret library to build the SVM model with a polynomial kernel. The train function uses the iris dataset, with species as the response variable and all other features as predictors. The model also includes pre-processing steps such as centering and scaling the data, as well as using a grid search to tune the parameters of the model.

After training the model, the script applies it to make predictions on both the training set and the test set. The script also performs cross-validation on the training set using the trainControl function from caret. Cross-validation is an important step to evaluate the stability and generalization of the model.

Finally, the script evaluates the performance of the model by calculating the confusion matrix and other statistics on the training set, test set and cross-validation set. The script also plots feature importance of the model using the varImp function from caret to understand which features have the most impact on the model.

#### Dependencies
- `datasets`
- `caret`

#### Usage
1. Install the required libraries by running `install.packages(c("datasets", "caret"))` in R or Rstudio.
2. Run the script in R or Rstudio by navigating to the script directory and running `source("iris_classification.R")`

#

### [boston-housing-linear-regression.R](R/boston-housing-linear-regression.R)
This script demonstrates building a linear regression model using the Boston Housing dataset from the mlbench library. The dataset contains information on various features of houses in the Boston area, including crime rate, average number of rooms per dwelling, property tax rate, and median value of owner-occupied homes (the target variable).

The script first imports the necessary libraries, including mlbench to import the Boston Housing dataset and caret which contains various machine learning algorithms and tools for data pre-processing and model evaluation.

The script then loads the Boston Housing dataset and checks for missing values. To ensure reproducible results, the script sets the seed for random number generation.

Next, the script splits the dataset into a training set (80%) and a test set (20%). This allows for the model to be trained on the majority of the data, and then tested on unseen data to evaluate its performance.

The script then uses the train function from the caret library to build the linear regression model. The train function uses the Boston Housing dataset, with median value of owner-occupied homes as the response variable and all other features as predictors. The model also includes pre-processing steps such as centering and scaling the data.

### Dependencies
- `mlbench`
- `caret`
#### Usage
1. Install the required libraries by running `install.packages(c("mlbench", "caret"))` in R or Rstudio.
2. Run the script in R or Rstudio by navigating to the script directory and running `source("boston-housing-linear-regression.R")`

### Additional files
- Additional scripts and data will continue to be added to this folder as they are created and will be documented in this readme.


