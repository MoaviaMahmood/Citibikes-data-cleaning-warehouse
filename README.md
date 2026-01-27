# Citi Bike ETL Pipeline (Python & PostgreSQL)

## Project Overview

This project implements an **end-to-end ETL (Extract, Transform, Load) pipeline** for **Citi Bike trip data** using **Python, Pandas, and PostgreSQL**.

Multiple monthly CSV files are:
- **Extracted** from disk
- **Cleaned & transformed** using Pandas
- **Loaded** into a PostgreSQL database using SQLAlchemy

The final output is a **clean, analysis-ready dataset** stored both as a CSV file and a PostgreSQL table.


##  ETL Architecture
<img width="1536" height="1024" alt="Image" src="https://github.com/user-attachments/assets/09cfce17-192b-47cd-8707-daac72a28620" />

## Tools & Technologies

- **Python**
- **Pandas** – data cleaning & transformation
- **SQLAlchemy** – database connection
- **PostgreSQL** – data storage
- **Glob** – file handling
- **VS Code / Jupyter Notebook**

## Dataset

- Source: Citi Bike Trip Data (CSV files)
- Format: CSV
- Data Includes:
  - Trip duration
  - Start & stop times
  - Station details
  - Bike IDs
  - User type
  - Birth year
  - Gender

## Project Workflow

## Extract

- Reads a single CSV file for inspection
- Automatically loads and concatenates **multiple monthly CSV files**
- Saves merged data into `concat_data_citibike.csv`

```python
csv_files = sorted(glob.glob('../data/*.csv'))[:11]
df = pd.concat((pd.read_csv(f) for f in csv_files), ignore_index=True)
```

## Transform (Data Cleaning)

The following cleaning and validation steps are applied:

### Time Columns

-Convert Start Time and Stop Time to datetime
-Remove records where:
  - Stop Time is missing
  - Start Time > Stop Time

### Trip Duration

- Convert to numeric
- Handle invalid and missing values

### Station Data

- Clean and validate:
  - Station IDs
  - Station Names
  - Latitude & Longitude
- Convert coordinates to numeric
- Remove nulls
- Normalize longitude values

### User Information

- Gender
  - Convert numeric codes to labels (Male, Female, Unknown)
  - Remove Unknown
- User Type
  - Fill missing values
  - Remove Unknown
- Birth Year
  - Convert to numeric
  - Remove invalid (0) values

### Final Filters

- Remove invalid timestamps
- Remove incomplete demographic data
- Ensure clean geographic values

## Load

### Save Clean Data to CSV

```python
df_clean.to_csv('clean_data_citibike.csv', index=False)
```

```python
engine = create_engine(
    f'postgresql://{pg_username}:{pg_password}@{pg_host}:{pg_port}/{pg_db}'
)
```
### Load Data into PostgreSQL
```python
df_clean.to_sql(
    'citibike_trips',
    engine,
    if_exists='replace',
    index=False
)
```

### Data Validation

After loading, a SQL query verifies successful ingestion:
```sql
SELECT COUNT(*) FROM citibike_trips;
```

Example output:

Total records in citibike_trips table: XXXXXXX

## Final Output

- clean_data_citibike.csv – cleaned dataset
- citibike_trips table in PostgreSQL
- Ready for:
  - Exploratory Data Analysis (EDA)
  - SQL analytics
  - Dashboards
  - Machine Learning

## Future Improvements

- Add logging instead of print statements
- Use environment variables for DB credentials
- Add data quality checks
- Schedule pipeline using Airflow
- Partition data by month/year
