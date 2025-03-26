<img width="1315" alt="MiBici_cover" src="https://github.com/user-attachments/assets/2e38dc31-99fe-47d8-8958-e81fa9d328df" />

## Overview
[MiBici](https://www.mibici.net/) (translated as *MyBike* in english) is a public bike service used in my home city of [Guadalajara](https://en.wikipedia.org/wiki/Guadalajara) (GDL), Jalisco, Mexico. This service is used in Guadalajara's Metropolitan Area, which has a population of 5,268,642 (as of 2020) distributed in eight main municipalities and a total area of 2,543.13 squared km (981.91 squared mi).

This service has established stations where users can take and return a public bike, all they need is to sign up through MiBici's platform and pay a charge for 1, 3, 7 days, or annual use. After signing up, users get a transport card that can be used at any station in Guadalajara's Metropolitan Area.

MiBici makes their data public and has published it every month since December 2014.

This repository includes R scripts to merge, transform, and clean data from 4,496,890 bike trips registered in 2024 and hourly weather data obtained through the [Open-meteo API](https://open-meteo.com/), as well as R markdown files of descriptive, exploratory, and statistical data analysis. 

## Objectives

- Download and merge data from 2024 into a single clean and organized dataset (_**bikeshare_GDL_2024_clean.csv**_, available here (*pending*)).
- Obtain hourly weather data from 2024 and store as an appropriately formatted dataset (_**hourly_weather_GDL_2024.csv**_).
- Convert bikeshare data into an hourly format and merge with weather data (_**bikeshare_and_weather_GDL_2024.csv**_).
- Perform a descriptive and exploratory data analysis of the 4,496,890 registered bike trips in 2024 (_**EDA_GDL_bikeshare_2024.pdf**_) (*pending*).
- Implement different regression models on the hourly bikeshare and weather data, analyze assumptions, and interpret results to determine explanatory and predictive use (_**regression_GDL_2024.pdf**_) (pending). 

## Data

Data was obtained directly from [MiBici's public data website](https://www.mibici.net/es/datos-abiertos/). In this site, data is published in CSV files corresponding to individuals month from December 2014 to Febuary 2025. 

## Results

In Guadalajara's Metropolitan Area during 2024:

(*pending*)

## Datasets available in Kaggle

2024 Guadalajara bikeshare and weather datasets available through Kaggle (*pending*). 

I have also cleaned, transformed, and combined all bikeshare data from Dec 2014 to Mar 2024 and published the final dataset (2.51 GB) in [Kaggle](https://www.kaggle.com/datasets/sebastianquirarte/over-9-years-of-real-public-bike-use-data-mibici), this is not part of this analysis but is available if anyone is interested.
