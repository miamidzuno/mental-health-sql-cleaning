# mental-health-sql-cleaning
Data cleaning project using MySQL — standardizing messy survey data on mental health in the tech industry
# Mental Health in Tech - Data Cleaning Project

## Overview
This project focuses on cleaning a real-world survey dataset about 
mental health in the tech industry using MySQL.

## Dataset
Source: OSMI Mental Health in Tech Survey (Kaggle)  
Original rows: 1258 | Clean rows: 1251

## What I Cleaned
- Removed 7 rows with impossible ages (including -1726)
- Standardized 20+ gender variations into 3 categories: Male, Female, Other
- Converted Timestamp text column into proper DATE format
- Replaced NA values with NULL in self_employed and work_interfere columns

## Tools Used
- MySQL / MySQL Workbench

## Files
- `mental_health_cleaning.sql` - Full cleaning script with comments
