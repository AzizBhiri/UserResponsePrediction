library(openxlsx)
preprocessed_data <- read.xlsx('Preprocessed_Data.xlsx')

##Split the data
set.seed(101)
ind <- sample(2, nrow(preprocessed_data), replace=TRUE, prob=c(0.8, 0.2))
preprocessed_data_training <- preprocessed_data[ind==1, 9:79]
preprocessed_data_test <- preprocessed_data[ind==2, 9:79]
preprocessed_data_trainLabels <- preprocessed_data[ind==1,86]
preprocessed_data_testLabels <- preprocessed_data[ind==2, 86]


##Building the model
library(class)
Knn_Model <- knn(train = preprocessed_data_training, test = preprocessed_data_test, cl = preprocessed_data_trainLabels, k=5)

##Evaluationg the model
#library(gmodels)
#ct <- CrossTable(x = preprocessed_data_testLabels, y = Knn_Model, prop.chisq=FALSE)
# Accuracy <-100* (sum(diag(ct)/sum(ct)))
# Accuracy
library(caret)
confusionMatrix(Knn_Model ,as.factor(preprocessed_data_testLabels))

##Plotting the model
