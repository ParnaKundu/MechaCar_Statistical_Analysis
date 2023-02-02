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

# Part 3: T-Tests on Suspension Coils

sample_table <- suspension_table %>%  sample_n(50) # select sample data from population
t.test(sample_table$PSI, mu=total_summary$Mean)

# Select each manufacturing lot
lot1_table <- subset(suspension_table, Manufacturing_Lot == 'Lot1')
lot2_table <- subset(suspension_table, Manufacturing_Lot == 'Lot2')
lot3_table <- subset(suspension_table, Manufacturing_Lot == 'Lot3') 

t.test(lot1_table$PSI, mu=total_summary$Mean) # t-test for Lot1

t.test(lot2_table$PSI, mu=total_summary$Mean) # t-test for Lot2

t.test(lot3_table$PSI, mu=total_summary$Mean) # t-test for Lot3
