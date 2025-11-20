IF OBJECT_ID('citibike_clean_data', 'U') IS NOT NULL
    DROP TABLE citibike_clean_data;
GO

CREATE TABLE citibike_clean_data (
  Trip_Duration				      INT,
  Start_Time					      datetime,
  Stop_Time					        datetime,
  Start_Station_ID			    int,
  Start_Station_Name			  NVARCHAR(100),
  Start_Station_Latitude    float,
  Start_Station_Longitude		float,
	End_Station_ID				    INT,
	End_Station_Name			    NVARCHAR(100),
	End_Station_Latitude		  float,
	End_Station_Longitude		  float,
	Bike_ID						        INT,
	User_Type					        NVARCHAR(50),
	Birth_Year					      int,
	Gender						        NVARCHAR(50)        
);
