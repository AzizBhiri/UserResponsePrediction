##importing the data
library(openxlsx)
my_data <- read.xlsx('Raw_Data.xlsx')

##deleting spaces in column names
colnames(my_data)[1] <- "Campaigne_name"
colnames(my_data)[2] <- "Ad_set_name"
colnames(my_data)[3] <- "Ad_name"
colnames(my_data)[6] <- "Delivery_status"
colnames(my_data)[7] <- "Delivery_level"
colnames(my_data)[11] <- "Attribution_setting"
colnames(my_data)[12] <- "Result_type"
colnames(my_data)[14] <- "Amount_spent_USD"
colnames(my_data)[15] <- "Cost_per_result"
colnames(my_data)[18] <- "Reporting_starts"
colnames(my_data)[19] <- "Reporting_ends"

##replacing empty Result cells by 0
my_data$Results[is.na(my_data$Results)] <- 0

##replacing empty Result_type cells by "No leads"
my_data$Result_type[is.na(my_data$Result_type)] <- "No leads"

##replacing empty Cost_per_result cells by 0
my_data$Cost_per_result[is.na(my_data$Cost_per_result)] <- 0

##replacing empty Amount_spent_(USD) cells by 0
my_data$Amount_spent_USD[is.na(my_data$Amount_spent_USD)] <- 0

##Deleting columns with only One value to enable encoding
my_data$Delivery_level <- NULL
my_data$Attribution_setting <- NULL
my_data$Ends <- NULL
my_data$Reporting_starts <- NULL
my_data$Reporting_ends <- NULL

##Encoding categorical data
library(caret)
dmy <- dummyVars(" ~ .", data = my_data, fullRank = T)
encoded_data <- data.frame(predict(dmy, newdata = my_data))

write.xlsx(encoded_data, 'Preprocessed_Data.xlsx', overwrite = TRUE)








