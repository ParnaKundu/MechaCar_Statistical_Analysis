library(dplyr)

# Part 1: Linear Regression to Predict MPG

# Import the Mechacar.csv to a dataframe
mechacar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F, stringsAsFactors=F)

# Multiple Linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_table) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_table)) # Generate summary statistics
