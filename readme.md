# R
This folder contains R scripts and data for various data analysis and machine learning tasks. The scripts showcase my experience and skills in data pre-processing, model building, and performance evaluation. Each script demonstrates a different technique or algorithm for solving a specific problem.

## Contents

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

#

### [shiny-network-map.R](R/shiny-network-map.R)
This script is a work in progress and is intended to scan the network and map out the open ports visually. The current script is a skeleton and only includes the basic functionality for running a network scan using the nmap command. The script loads the Shiny library and defines the user interface, which includes an input field for the IP range or hostname, and a button to initiate the scan. The script also defines the server logic, which runs the nmap command with the input IP range or hostname and converts the output to a dataframe. The scan results are then rendered as a table in the output section of the app.

The script also includes an option to launch the browser when the app is run. To run the app, navigate to the script directory and run shinyApp(ui, server, options = "launch.browser").

Please note that the script is still a work in progress and the visual mapping of open ports has not been implemented yet. Once the visual mapping is added, the script will be updated and the readme will reflect the changes.

### Dependencies
- `shiny`
- [`nmap`](https://nmap.org/) (should be locally installed)

#

### [ddos-detection-svm-neural-net.R](R/ddos-detection-svm-neural-net.R)
This script demonstrates building classification models for DDoS detection using the Support Vector Machine (SVM) algorithm with a polynomial kernel. The script uses two datasets, the "final_dataset.csv" and "unbalanced_20_80_dataset.csv"  which contains 12794627 observations of DDoS and benign flows, with 84 features such as flowid, timestamp, fwd seg size min, src IP, dst IP, flow IAT min, src port, tot fwd pkts, init bwd win bytes etc. Thank you @Devendra on Keggle for making the dataset public.

The script first imports the necessary libraries, including datasets to import the DDoS and benign flows dataset, and caret which contains various machine learning algorithms and tools for data pre-processing and model evaluation.

The script then loads the DDoS and benign flows dataset and checks for missing values. To ensure reproducible results, the script sets the seed for random number generation.

Next, the script splits the dataset into a training set (80%) and a test set (20%). This allows for the model to be trained on the majority of the data, and then tested on unseen data to evaluate its performance.

The script then uses the train function from the caret library to build the SVM model with a polynomial kernel. The train function uses the DDoS and benign flows dataset, with DDoS flows as the response variable and all other features as predictors. The model also includes pre-processing steps such as centering and scaling the data, as well as using a grid search to tune the parameters of the model.

After training the model, the script applies it to make predictions on both the training set and the test set. The script also performs cross-validation on the training set using the trainControl function from caret. Cross-validation is an important step to evaluate the stability and generalization of the model.

Finally, the script evaluates the performance of the model by calculating the confusion matrix and other statistics on the training set, test set and cross-validation set. The script also plots feature importance of the model using the varImp function from caret to understand which features have the most impact on the model.

### Dependencies
- `caret`
- `e1071`
- `nnet`
- Kaggle Devendra416 Dataset (Until API call implementation)

#### Usage
1. Install the required libraries by running `install.packages(c("caret", "e1071", "nnet"))` in R or Rstudio.
2. Run the script in R or Rstudio by navigating to the script directory and running `source("ddos-detection-svm-neural-net.R")`

#

### Additional files
- Additional scripts and data will continue to be added to this folder as they are created and will be documented in this readme.
