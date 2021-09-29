library(openxlsx)
#my_data <- read.xlsx('Raw_Data.xlsx')
preprocessed_data <- read.xlsx('Preprocessed_Data.xlsx')

##deleting spaces in column names
# colnames(my_data)[1] <- "Campaigne_name"
# colnames(my_data)[2] <- "Ad_set_name"
# colnames(my_data)[3] <- "Ad_name"
# colnames(my_data)[6] <- "Delivery_status"
# colnames(my_data)[7] <- "Delivery_level"
# colnames(my_data)[11] <- "Attribution_setting"
# colnames(my_data)[12] <- "Result_type"
# colnames(my_data)[14] <- "Amount_spent_USD"
# colnames(my_data)[15] <- "Cost_per_result"
# colnames(my_data)[18] <- "Reporting_starts"
# colnames(my_data)[19] <- "Reporting_ends"

##data distribution
library(corrplot)
##Correlations for preprocessed data
correlations <- cor(preprocessed_data[,c(74,75,76,77,83,84,87,88)])
colnames(correlations) <- c("18-24", "24-34", "35-44", "45-54", "Reach", "Impressions", "Number Of Clicks", "Cost Of Ad ($US)")
rownames(correlations) <- c("18-24", "24-34", "35-44", "45-54", "Reach", "Impressions", "Number Of Clicks", "Cost Of Ad ($US)")
corrplot(correlations, method="circle", tl.col = 'black', cl.ratio = 0.2, addCoef.col = 'black')

##Density Plots
library(caret)
x <- preprocessed_data[,c(74,75,76,77,83,84,87,88)]
y <- as.factor(preprocessed_data[,86])
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

##Correlations for raw data
# correlations <- cor(my_data[,c(8,9,14,15)])
# colnames(correlations) <- c("Reach", "Impressions","Number Of Clicks", "Cost Of Ad ($US)")
# rownames(correlations) <- c("Reach", "Impressions","Number Of Clicks", "Cost Of Ad ($US)")
# corrplot(correlations, method="circle", tl.col = 'black', cl.ratio = 0.2)

##Plotting
# plot(my_data$Results, my_data$Amount_spent_USD, xlab = "Clicks", ylab = "Amount Spent On Ad in $US", main  = "Clicks Per $US Spent", col = "#2E9FDF")

# plot(my_data$Reach, my_data$Amount_spent_USD, xlab = "Reach", ylab = "Amount Spent On Ad in $US", main  = "Reach Per $US Spent", col = "#2E9FDF")

# plot(my_data$Impressions, my_data$Amount_spent_USD, xlab = "Impressions", ylab = "Amount Spent On Ad in $US", main  = "Impressions Per $US Spent", col = "#2E9FDF")

# plot(my_data$Results, my_data$Impressions, xlab = "Clicks", ylab = "Impressions", main  = "Clicks Per Impressions", col = "#2E9FDF")
