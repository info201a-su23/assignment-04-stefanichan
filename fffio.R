install.packages("readr")
library(readr)
#Dataset about prison Population per county/state
url <- "https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true"
prisoncountystate <- read_csv(url)

#Dataset about jail population per county/state
url <- "https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-jail-pop.csv?raw=true"
jailpopcountystate <- read_csv(url)

#Dataset about prison/jail population per 100,000 people(rate) per county/state
url <-"https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true"
jailperthou <- read_csv(url)

#Smaller dataset about prison/jail population per 100,000 people(rate)
# percounty/state starting at 1990
url <- "https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates-1990.csv?raw=true"
smallerdataset <- read_csv(url)

#Smaller dataset about prison/jail population per 100,000 people (rate) per county/state starting at 1990 in Washington
url <- "https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv"
smallerwash <- read_csv(url)

# Display the first few rows of the dataset in a table format
head(prisoncountystate)
# Display the first 10 rows of the dataset
head(prisoncountystate, 10)
# Open a tabular viewer for the dataset
View(prisoncountystate)

# Calculate the total 'black_prison_pop'
total_black_prison_pop <- sum(prisoncountystate$black_prison_pop, na.rm = TRUE)

# Print the result
cat("The total black prison population is:", total_black_prison_pop)
#The total black prison population is: 12113359

# Calculate the total 'male_prison_pop'
total_male_prison_pop <- sum(prisoncountystate$male_prison_pop, na.rm = TRUE)

# Print the result
cat("The total male prison population is:", total_male_prison_pop)
#The total male prison population is: 25189045

# Find the index of the maximum 'aapi_prison_pop'
max_aapi_prison_pop_index <- which.max(prisoncountystate$aapi_prison_pop)

# Get the state with the highest 'aapi_prison_pop'
state_with_highest_aapi_prison_pop <- prisoncountystate$state[max_aapi_prison_pop_index]

# Print the result
cat("The state with the highest AAPI prison population is:", state_with_highest_aapi_prison_pop)
#The state with the highest AAPI prison population is: HI

# Find the index of the year with the most 'female_prison_pop'
max_female_prison_pop_year_index <- which.max(prisoncountystate$female_prison_pop)

# Get the year with the most 'female_prison_pop'
year_with_most_female_prison_pop <- prisoncountystate$year[max_female_prison_pop_year_index]

# Print the result
cat("The year with the most female prison population is:", year_with_most_female_prison_pop)
#The year with the most female prison population is: 1998

# Find the index of the year with the most 'male_prison_pop'
max_male_prison_pop_year_index <- which.max(prisoncountystate$male_prison_pop)

# Get the year with the most 'male_prison_pop'
year_with_most_male_prison_pop <- prisoncountystate$year[max_male_prison_pop_year_index]

# Print the result
cat("The year with the most male prison population is:", year_with_most_male_prison_pop)
#The year with the most male prison population is: 2007

install.packages("ggplot2", repos = "http://cran.us.r-project.org")
library(ggplot2)

# Create a line chart showing 'black_prison_pop' over the years
ggplot(prisoncountystate, aes(x = year, y = black_prison_pop)) +
  geom_line() +
  labs(title = "Black Prison Population Over the Years",
       x = "Year",
       y = "Black Prison Population")

# Create a line chart using base R plotting functions
ggplot(prisoncountystate, aes(x = year, y = white_prison_pop)) +
    geom_line() +
  labs(title = "White Prison Population Over the Years",
     x = "Year",
     y = "White Prison Population")


# Load the ggplot2 package (if not already loaded)
library(ggplot2)
install.packages("maps")
library(maps)

# Create a line chart comparing 'black_prison_pop' and 'white_prison_pop'
ggplot(prisoncountystate, aes(x = year)) +
  geom_line(aes(y = black_prison_pop, color = "Black Prison Population")) +
  geom_line(aes(y = white_prison_pop, color = "White Prison Population")) +
  labs(title = "Comparison of Black and White Prison Populations",
       x = "Year",
       y = "Population",
       color = "Population Group") +
  scale_color_manual(values = c("Black Prison Population" = "purple", "White Prison Population" = "red"))



