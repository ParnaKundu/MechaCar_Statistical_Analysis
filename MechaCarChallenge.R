library(dplyr)

# Part 1: Linear Regression to Predict MPG

# Import the Mechacar.csv to a dataframe
mechacar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F, stringsAsFactors=F)

# Multiple Linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_table) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_table)) # Generate summary statistics

# Part 2: Create Visualizations for the Trip Analysis

# Import and Read the Suspension_Coil.csv as a dataframe
suspension_table <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# Get the mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- suspension_table %>% summarize(Mean = mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
total_summary

# Get the mean, median, variance and standard deviation of the suspension coil's PSI column for each manufacturing lot
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary
