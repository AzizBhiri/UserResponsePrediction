# library(openxlsx)
# device_data <- read.xlsx('Device_Raw_Data.xlsx')
# colnames(device_data)[1] <- "Conversion_Device"
# colnames(device_data)[2] <- "Result_type"

# ##replacing empty Result cells by 0
# device_data$Results[is.na(device_data$Results)] <- 0

# ##replacing empty Result_type cells by "No leads"
# device_data$Result_type[is.na(device_data$Result_type)] <- "No leads"

# ##Encoding categorical data
# library(caret)
# dmy <- dummyVars(" ~ .", data = device_data, fullRank = T)
# encoded_data <- data.frame(predict(dmy, newdata = device_data))

# write.xlsx(encoded_data, 'Preprocessed_Device_Data.xlsx', overwrite = TRUE)

library(openxlsx)
preprocessed_data <- read.xlsx('Preprocessed_Data.xlsx')
##Density Plots
library(caret)
x <- preprocessed_data[,9:37]
y <- as.factor(preprocessed_data[,86])
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

# ##Split the data
# set.seed(101)
# sample <- sample.int(n = nrow(preprocessed_device_data), size = floor(.8*nrow(preprocessed_device_data)), replace = F)
# train <- preprocessed_device_data[sample, ]
# test  <- preprocessed_device_data[-sample, ]
# # sample <- sample.int(n = nrow(my_data), size = floor(.8*nrow(my_data)), replace = F)
# # train <- my_data[sample, ]
# # test  <- my_data[-sample, ]

# ##Building the model
# Logit_Model <- glm(Result_typeWebsite.leads~Conversion_Deviceandroid_tablet + Conversion_Devicedesktop + Conversion_Deviceipad + Conversion_Deviceiphone + Conversion_Deviceipod + Conversion_Deviceother, data = train, family="binomial")
# glm.probs <- predict(Logit_Model, newdata=test, type = "response")
# #glm.probs[1:100]
# glm.pred <- ifelse(glm.probs > 0.5, 1, 0)
# # attach(preprocessed_data)
# # table(glm.pred,as.factor(preprocessed_data$Result_typeWebsite.leads))
# mean(glm.pred == preprocessed_device_data$Result_typeWebsite.leads)
# #plot(glm.probs)
# #summary(Logit_Model)
