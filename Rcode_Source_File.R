# Load necessary libraries
library(Amelia)
library(dplyr)
library(ggplot2)
library(stats)

# Load and inspect the datasets
countries <- read.csv("C:/Users/rache/OneDrive/Desktop/Countries.csv")
regions <- read.csv("C:/Users/rache/OneDrive/Desktop/Region.csv")

# Merge datasets based on the 'Country.Name' column from "Countries.csv" and the 'Country' column from "Region.csv"
merged_data <- merge(countries, regions, by.x = "Country.Name", by.y = "Country", all = TRUE)

# Clean and rename the columns for consistency
colnames(merged_data) <- gsub(" ", "", colnames(merged_data))
colnames(merged_data) <- gsub("\\(\\%GDP\\)", "PercentGDP", colnames(merged_data))

# Inspect the structure of the merged data
str(merged_data)

# Check for missing values in the merged data
missing_values <- sapply(merged_data, function(x) sum(is.na(x)))

# Visualize missing data using Amelia package
missmap(merged_data, main = "Missing values map")

# Check for duplicate rows in the merged data
duplicates <- duplicated(merged_data)

# Print the structure of the final dataset
str(merged_data)

# Generate a summary of the dataset
summary(merged_data)

# Create a scatter plot of GDP Per Capita vs Happiness Score, colored by Region
ggplot(merged_data, aes(x = GDP.Per.Capita, y = Happiness.Score, color = Region)) + 
  geom_point() + 
  theme_minimal() + 
  labs(title = "GDP per Capita vs. Happiness Score by Region",
       x = "GDP per Capita",
       y = "Happiness Score")

# Perform linear regression analysis with Happiness Score as the response variable and GDP Per Capita as the predictor
fit <- lm(Happiness.Score ~ GDP.Per.Capita, data = merged_data)

# Group data by region and calculate average GDP and happiness scores
regional_averages <- merged_data %>%
  group_by(Region) %>%
  summarize(Average_GDP = mean(GDP.Per.Capita, na.rm = TRUE),
            Average_Happiness = mean(Happiness.Score, na.rm = TRUE))

# Create a bar plot for average GDP per Capita by region
ggplot(regional_averages, aes(x = Region, y = Average_GDP, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Average GDP per Capita by Region",
       x = "Region",
       y = "Average GDP per Capita (USD)") +
  theme_minimal()

# Create a bar plot for average Happiness Score by region
ggplot(regional_averages, aes(x = Region, y = Average_Happiness, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Happiness Score by Region",
       x = "Region",
       y = "Average Happiness Score") +
  theme_minimal()

# Load the datasets
countries <- read.csv("C:/Users/rache/OneDrive/Desktop/Countries.csv")
world_data <- read.csv("C:/Users/rache/OneDrive/Desktop/world_data_2023.csv")

# Merge countries and world_data datasets on 'Country'
new_data <- merge(countries, world_data, by.x = "Country.Name", by.y = "Country")

# Inspect the structure of the new merged dataset
str(new_data)

# Check and visualize missing values in new_data
sum(is.na(new_data))
missmap(new_data, main = "Missing values map", col = c("yellow", "black"), legend = FALSE)

# Remove duplicate rows from new_data, if any
new_data <- new_data[!duplicated(new_data), ]

# Print the structure of the final new_data dataset
str(new_data)

# Generate a summary of new_data to check for anomalies
summary(new_data)

# Load data set
whr2023 <- read.csv("C:/Users/rache/OneDrive/Desktop/WHR2023.csv")

# Merge the new_data with WHR2023 dataset on 'Country' column
additional_data <- merge(new_data, whr2023[, c("Country.name", "Social.support")], by.x = "Country.Name", by.y = "Country.name", all.x = TRUE)

# Check the structure of the additional_data
str(additional_data)

# Join the 'Happiness.Score' and 'Freedom' columns from merged_data to additional_data
additional_data <- left_join(additional_data, 
                             merged_data %>% select(Country.Name, Happiness.Score, Freedom), 
                             by = "Country.Name")

# Perform multivariate linear regression analysis with Happiness Score as the response variable and several predictors
fit <- lm(Happiness.Score ~ GDP.Per.Capita + Life.expectancy + Freedom + Social.support, data = additional_data)
summary(fit)