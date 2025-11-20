PRINT '->Truncate Table: citibike_clean_data';
TRUNCATE TABLE citibike_clean_data;
PRINT '->Bulk Load: citibike_clean_data';
BULK INSERT citibike_clean_data
		FROM 'C:\Users\HP Laptop 15\Downloads\bike-rental\clean_data_citibike.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
