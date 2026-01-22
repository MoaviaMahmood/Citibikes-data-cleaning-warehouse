# Citi Bike Trip Data Cleaning & Preprocessing (Python)

## Project Overview

This project focuses on **loading, merging, cleaning, and preprocessing Citi Bike trip data** using **Python and Pandas**.  
Multiple monthly CSV files are combined into a single dataset, followed by extensive data cleaning to prepare the data for **EDA, analytics, or machine learning**.

The final output is a **fully cleaned dataset** saved as a CSV file.

---

## Tools & Libraries Used

- Python
- Pandas
- Glob

---

## Dataset

- Source: Citi Bike Trip Data (CSV files)
- Files Location: `./data/`
- Format: CSV
- Data Includes:
  - Trip duration
  - Start & stop times
  - Station details
  - Bike IDs
  - User type
  - Birth year
  - Gender

---

## Project Workflow

### Load a Single CSV File
- Reads one Citi Bike CSV file
- Displays basic structure and data types

### Merge Multiple CSV Files
- Uses `glob` to read all CSV files from the data folder
- Concatenates the first 11 CSV files into one DataFrame
- Saves merged data as: concat_data_citibike.csv

---

## Data Cleaning & Preprocessing Steps

### Trip Duration
- Converted to numeric
- Missing values handled
- Cast to integer

### Start & Stop Time
- Converted to `datetime`
- Invalid or missing values removed
- Ensured: Start Time <= Stop Time

### Station Information
- Cleaned station IDs, names, latitudes, and longitudes
- Converted IDs to integers
- Latitude & longitude converted to numeric
- Absolute values applied to longitude

### Bike ID
- Converted to numeric
- Missing values handled

### User Type
- Missing values replaced with `"Unknown"`
- Rows with `"Unknown"` removed later

### Birth Year
- Converted to numeric
- Invalid values replaced with `0`
- Rows with `0` removed

### Gender
- Converted from numeric codes:
- `0 → Unknown`
- `1 → Male`
- `2 → Female`
- Rows with `"Unknown"` removed

---

## Final Data Cleaning Filters

The dataset was filtered to remove:
- Invalid time records
- Missing or invalid birth years
- Unknown gender
- Unknown user types

---

## Output Files

| File Name | Description |
|---------|------------|
| `concat_data_citibike.csv` | Raw merged dataset |
| `clean_data_citibike.csv` | Fully cleaned dataset |

---

## Final Output

- Cleaned dataset stored in `df2`
- Ready for:
- Exploratory Data Analysis (EDA)
- Data Visualization
- Machine Learning
- SQL Import
