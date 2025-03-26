# Guadalajara Bike Share 2024 Dataset
# This R script joins bike share data from 12 months of public bike share use in
# Guadalajara, Mexico during 2024. Data source: mibici.net/es/datos-abiertos/
# Sebastian Quirarte Justo | sebastianquirajus@outlook.com

# ---- Packages ----

library(lubridate) # datetime functions
library(dplyr) # data manipulation functions

# ---- Load Data ----

# Load raw csv files of monthly data as dataframes (01 = jan, ... , 12 = dec)
df_2024_01 <- read.csv('datos_abiertos_2024_01.csv', encoding = 'latin1')
df_2024_02 <- read.csv('datos_abiertos_2024_02.csv', encoding = 'latin1')
df_2024_03 <- read.csv('datos_abiertos_2024_03.csv', encoding = 'latin1')
df_2024_04 <- read.csv('datos_abiertos_2024_04.csv', encoding = 'latin1')
df_2024_05 <- read.csv('datos_abiertos_2024_05.csv', encoding = 'latin1')
df_2024_06 <- read.csv('datos_abiertos_2024_06.csv', encoding = 'latin1')
df_2024_07 <- read.csv('datos_abiertos_2024_07.csv', encoding = 'latin1')
df_2024_08 <- read.csv('datos_abiertos_2024_08.csv', encoding = 'latin1')
df_2024_09 <- read.csv('datos_abiertos_2024_09.csv', encoding = 'latin1')
df_2024_10 <- read.csv('datos_abiertos_2024_10.csv', encoding = 'latin1')
df_2024_11 <- read.csv('datos_abiertos_2024_11.csv', encoding = 'latin1')
df_2024_12 <- read.csv('datos_abiertos_2024_12.csv', encoding = 'latin1')

# ---- Change Column Names ----

# There seems to be some weird encoding w/ the files which results in one of the
# column name having a different character for some of the dataframes, I'll 
# manually change the column names to be able to merge the dataframes

# Desired column names 
column_names <- c('trip_id', 'user_id', 'sex', 'birth_year', 'trip_start', 
                  'trip_end', 'origin_id', 'destination_id')

df_2024_01 <- setNames(df_2024_01, column_names)
df_2024_02 <- setNames(df_2024_02, column_names)
df_2024_03 <- setNames(df_2024_03, column_names)
df_2024_04 <- setNames(df_2024_04, column_names)
df_2024_05 <- setNames(df_2024_05, column_names)
df_2024_06 <- setNames(df_2024_06, column_names)
df_2024_07 <- setNames(df_2024_07, column_names)
df_2024_08 <- setNames(df_2024_08, column_names)
df_2024_09 <- setNames(df_2024_09, column_names)
df_2024_10 <- setNames(df_2024_10, column_names)
df_2024_11 <- setNames(df_2024_11, column_names)
df_2024_12 <- setNames(df_2024_12, column_names)

# For some reason, date data from september and october is formated as 
# 01/09/2024 0:00 (day/month/year hour:minute) while the rest of the months are
# formatted as 2024-06-01 00:00:17 (year-month-day hour:minute:second)

# Let's get this fixed now to avoid further issues, by all months to datetime 
# based on their specific format. After a lot of trial and error, this was the
# best solution I found to fix this issue 
df_2024_01$trip_start <- ymd_hms(df_2024_01$trip_start)
df_2024_01$trip_end <- ymd_hms(df_2024_01$trip_end)
df_2024_02$trip_start <- ymd_hms(df_2024_02$trip_start)
df_2024_02$trip_end <- ymd_hms(df_2024_02$trip_end)
df_2024_03$trip_start <- ymd_hms(df_2024_03$trip_start)
df_2024_03$trip_end <- ymd_hms(df_2024_03$trip_end)
df_2024_04$trip_start <- ymd_hms(df_2024_04$trip_start)
df_2024_04$trip_end <- ymd_hms(df_2024_04$trip_end)
df_2024_05$trip_start <- ymd_hms(df_2024_05$trip_start)
df_2024_05$trip_end <- ymd_hms(df_2024_05$trip_end)
df_2024_06$trip_start <- ymd_hms(df_2024_06$trip_start)
df_2024_06$trip_end <- ymd_hms(df_2024_06$trip_end)
df_2024_07$trip_start <- ymd_hms(df_2024_07$trip_start)
df_2024_07$trip_end <- ymd_hms(df_2024_07$trip_end)
df_2024_08$trip_start <- ymd_hms(df_2024_08$trip_start)
df_2024_08$trip_end <- ymd_hms(df_2024_08$trip_end)
df_2024_09$trip_start <- dmy_hm(df_2024_09$trip_start)
df_2024_09$trip_end <- dmy_hm(df_2024_09$trip_end)
df_2024_10$trip_start <- dmy_hm(df_2024_10$trip_start)
df_2024_10$trip_end <- dmy_hm(df_2024_10$trip_end)
df_2024_11$trip_start <- ymd_hms(df_2024_11$trip_start)
df_2024_11$trip_end <- ymd_hms(df_2024_11$trip_end)
df_2024_12$trip_start <- ymd_hms(df_2024_12$trip_start)
df_2024_12$trip_end <- ymd_hms(df_2024_12$trip_end)

# ---- Merge Dataframes ----

# Merge dataframes into one single dataframe
df_2024 <- rbind(df_2024_01, df_2024_02)
df_2024 <- rbind(df_2024, df_2024_03)
df_2024 <- rbind(df_2024, df_2024_04)
df_2024 <- rbind(df_2024, df_2024_05)
df_2024 <- rbind(df_2024, df_2024_06)
df_2024 <- rbind(df_2024, df_2024_07)
df_2024 <- rbind(df_2024, df_2024_08)
df_2024 <- rbind(df_2024, df_2024_09)
df_2024 <- rbind(df_2024, df_2024_10)
df_2024 <- rbind(df_2024, df_2024_11)
df_2024 <- rbind(df_2024, df_2024_12)

# Remove all variables except the full dataframe to free up space
rm(list = setdiff(ls(), "df_2024"))

# ---- Data Transformation ----

# View column types
str(df_2024)

# Convert empty and null cells in the 'sex' column to NAs
df_2024$sex[df_2024$sex %in% c("", "NULL")] <- NA
# 'sex' as factor
df_2024$sex <- as.factor(df_2024$sex)

# Verify correct column types
str(df_2024)

# Create 'trip_duration' column: trip duration in minutes
df_2024$trip_duration <- round(as.numeric(difftime(df_2024$trip_end, 
                                                   df_2024$trip_start, 
                                                   units = "mins")), 2)

# Create 'age' column: user age in years
df_2024$age <- 2024 - df_2024$birth_year

# ---- Data Cleaning ----

# Dataframe has 4,645,921 rows 
summary(df_2024)

# From the summary of the dataframe we can see some anomalies in the data that
# should be cleaned since they seem to be due to data capture errors

# Remove rows with negative trip durations and keep those that are >= 1 min
df_2024_clean <- df_2024[df_2024$trip_duration >= 1, ]

# Dataframe now has 4,502,042 rows (143,879 rows removed, -3.10% of original)

# Remove rows with trip durations > 24 hours (1,440) min
df_2024_clean <- df_2024_clean[df_2024_clean$trip_duration <= 1440, ]

# Dataframe now has 4,502,029 rows (13 rows removed, < -0.01% of original)

# Remove rows of users < 16 years old
df_2024_clean <- df_2024_clean[df_2024_clean$age >= 16, ]

# Dataframe now has 4,501,441 rows (588 rows removed, -0.01% of original)

# Remove rows of users > 80 years old
df_2024_clean <- df_2024_clean[df_2024_clean$age <= 80, ]

# Dataframe now has 4,499,507 rows (1,934 rows removed, -0.04% of original)

# Remove rows of trips with NA date
df_2024_clean <- df_2024_clean[!is.na(df_2024_clean$trip_start), ]

# Dataframe now has 4,496,890 rows (2617 rows removed, -0.06% of original)

# In total, 149,031 rows were removed (-3.21% of data removed)

# ---- Convert data to hourly format ----

df_2024_hourly <- df_2024_clean %>% mutate(date = as.Date(trip_start),  
                                           hour = hour(trip_start)) %>% 
                                    group_by(date, hour) %>% 
                                    summarise(trip_count = n()) %>% 
                                    ungroup() 

# Add month and day columns
df_2024_hourly <- df_2024_hourly %>% mutate(month = as.integer(month(date)),
                                            day = day(date)) 
             

# Organize column order (date, month, day, hour, trip_count)
df_2024_hourly <- df_2024_hourly[ , c(1,4,5,2,3)]

# Add weekend variable
df_2024_hourly$is_weekend <- ifelse(weekdays(df_2024_hourly$date) %in% 
                                      c("Saturday", "Sunday"), 1, 0)

# Federal holidays
holidays <- as.Date(c('2024-01-01', 
                      '2024-02-05', 
                      '2024-03-18',
                      '2024-05-01', 
                      '2024-09-16', 
                      '2024-10-01',
                      '2024-11-18', 
                      '2024-12-25'))
# Add holiday variable
df_2024_hourly$is_holiday <- ifelse(df_2024_hourly$date %in% holidays, 1, 0)

# ---- Add weather data ----

# Data source: https://open-meteo.com/
# For the data collection process view th R script 'weather_GDL_2024.R'

# Load weather data from Guadalajara in 2024
df_weather_GDL_2024 <- read.csv('weather_GDL_2024.csv')

# Convert column types to be able to merge with 'df_2024_hourly'
df_weather_GDL_2024$date <- as.Date(df_weather_GDL_2024$date)
df_weather_GDL_2024$month <- as.integer(df_weather_GDL_2024$month)

# Merge dataframes 
merged_df <- df_2024_hourly %>% left_join(df_weather_GDL_2024, 
                                          by = c('date',"month", "day", "hour"))

# ---- Export Data ----

# Export raw dataframe
write.csv(df_2024, 'bikeshare_GDL_2024_raw.csv', row.names = FALSE)

# Export cleaned dataframe
write.csv(df_2024_clean, 'bikeshare_GDL_2024_clean.csv', row.names = FALSE)

# Export hourly bikeshare with weather dataframe
write.csv(merged_df, 'bikeshare_weather_GDL_2024.csv', row.names = FALSE)
