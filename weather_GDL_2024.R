# Weather data Guadalajara 2024
# This R script scrapes hourly weather data from Guadalajara in 2024 using the
# Open-meteo API. Source: https://open-meteo.com/
# Sebastian Quirarte Justo | sebastianquirajus@outlook.com

# ---- Packages ----

library(httr) # HTTP requests to fetch data from an API
library(lubridate) # Manipulate and extract date-time components
library(dplyr) # Data manipulation tools
library(jsonlite) # Parse JSON data obtained through an API

# ---- Scrape weather data ----

# Define API URL and parameters
url <- 'https://historical-forecast-api.open-meteo.com/v1/forecast'
params <- list(latitude = 20.675,
               longitude = -103.356,
               start_date = '2024-01-01',
               end_date = '2024-12-31',
               timezone = 'auto',
               # Weather variables
               hourly = paste('temperature_2m', 
                              'relative_humidity_2m', 
                              'precipitation', 
                              'apparent_temperature', 
                              'wind_speed_10m',
                              'is_day',
                              'weather_code', 
                              sep = ','))

# Make API request
response <- GET(url, query = params)

# Parse JSON response
data <- content(response, as = "parsed", type = "application/json")

# Extract relevant information
latitude <- data$latitude
longitude <- data$longitude
elevation <- data$elevation
timezone <- data$timezone
timezone_abbr <- data$timezone_abbreviation
utc_offset <- data$utc_offset_seconds

# ---- Create Dataframe ----

hourly <- data$hourly # Extract hourly weather data
time <- as.POSIXct(unlist(hourly$time)) # Convert time from list to vector
interval <- 3600 # set time interval between visits in s (3600 s = 1 h)

# Create hourly weather data dataframe
hourly_dataframe <- data.frame(date = seq(from = time[1], 
                                          by = interval, 
                                          length.out = length(time)),
                               temperature = unlist(hourly$temperature_2m),
                               relative_humidity = unlist(hourly$relative_humidity_2m),
                               precipitation = unlist(hourly$precipitation),
                               apparent_temperature = unlist(hourly$apparent_temperature),
                               wind_speed = unlist(hourly$wind_speed_10m),
                               is_day = unlist(hourly$is_day),
                               weather_code = unlist(hourly$weather_code),
                               stringsAsFactors = FALSE)

# Add 'month', 'day', 'hour' and 'season' columns
hourly_dataframe <- hourly_dataframe %>% mutate(month = month(date),
                                                day = day(date),
                                                hour = hour(date),
                                                season = case_when(
                                                  month %in% c(12, 1, 2) ~ "winter",
                                                  month %in% c(3, 4, 5)  ~ "spring",
                                                  month %in% c(6, 7, 8)  ~ "summer",
                                                  month %in% c(9, 10, 11) ~ "fall"))

# Organize column order (date, month, day, hour, ...)
hourly_dataframe <- hourly_dataframe[ , c(1,5,6,7,2,3,4,8,9,10,11,12)]

# ---- Export Data ----

write.csv(hourly_dataframe, 'weather_GDL_2024.csv', row.names = FALSE)

