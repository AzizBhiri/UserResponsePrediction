##importing the data
library(openxlsx)
preprocessed_data <- read.xlsx('Preprocessed_Data.xlsx')
# my_data <- read.xlsx('Raw_Data.xlsx')
# colnames(my_data)[3] <- "Ad_name"
# colnames(my_data)[12] <- "Result_type"

##Split the data
set.seed(101)
sample <- sample.int(n = nrow(preprocessed_data), size = floor(.8*nrow(preprocessed_data)), replace = F)
train <- preprocessed_data[sample, ]
test  <- preprocessed_data[-sample, ]
# sample <- sample.int(n = nrow(my_data), size = floor(.8*nrow(my_data)), replace = F)
# train <- my_data[sample, ]
# test  <- my_data[-sample, ]

##Building the model
Logit_Model <- glm(Result_typeWebsite.leads ~ Age18.24 + Age25.34 + Age35.44 + Age45.54, data = train, family="binomial")
glm.probs <- predict(Logit_Model, newdata=test, type = "response")
# min(glm.probs)
# max(glm.probs)
#glm.probs
#plot(glm.probs)
glm.pred <- ifelse(glm.probs > 0.5, 1, 0)
# attach(preprocessed_data)
# table(glm.pred,as.factor(preprocessed_data$Result_typeWebsite.leads))
#mean(glm.pred == preprocessed_data$Result_typeWebsite.leads)
#summary(Logit_Model)
# x <- data.frame(Age18.24 = 0, Age25.34 = 0, Age35.44 = 0, Age45.54 = 1)
# p <- predict(Logit_Model, x)
# p

##Plot the model
#range(preprocessed_data$Amount_spent_USD)
# xAmount_spent_USD <- seq(0, 300, 0.1)
# yAmount_spent_USD <- predict(Logit_Model, list(Amount_spent_USD = xAmount_spent_USD),type="response")

# plot(preprocessed_data$Amount_spent_USD, preprocessed_data$Results, pch = 16, xlab = "Amount_spent_USD", ylab = "Website Leads")
# lines(xAmount_spent_USD, yAmount_spent_USD)
#plot the residuals
# res <- residuals(Logit_Model, type = "deviance")
# plot(predict(Logit_Model), res, xlab="Fitted values", ylab = "Residuals", ylim = max(abs(res)) * c(-1,1))
# abline(h = 0, lty = 2)
#plot the model
# library(ggplot2)
# require(ggiraph)
# require(ggiraphExtra)
# require(plyr)
# ggPredict(Logit_Model,se=TRUE,interactive=TRUE,digits=3)
# ggsave("logit_model.png")
