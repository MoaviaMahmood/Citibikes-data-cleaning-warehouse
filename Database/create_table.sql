IF OBJECT_ID('citibike_clean_data', 'U') IS NOT NULL
    DROP TABLE citibike_clean_data;
GO

CREATE TABLE citibike_clean_data (
  	Trip_Duration				    INT,
  	Start_Time					    DATETIME,
  	Stop_Time					    DATETIME,
  	Start_Station_ID			    INT,
  	Start_Station_Name			  	NVARCHAR(100),
  	Start_Station_Latitude    		FLOAT,
  	Start_Station_Longitude			FLOAT,
	End_Station_ID				    INT,
	End_Station_Name			    NVARCHAR(100),
	End_Station_Latitude		  	FLOAT,
	End_Station_Longitude		  	FLOAT,
	Bike_ID						    INT,
	User_Type					    NVARCHAR(50),
	Birth_Year					    INT,
	Gender						    NVARCHAR(50)        
);
