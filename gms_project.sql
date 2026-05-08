#SET UP

CREATE DATABASE gms_project;
 
#Combining dataset
 
 CREATE TABLE gms_project.data_combined AS (
	
    SELECT * FROM gms_project.data_10
    
    UNION ALL
    
    SELECT * FROM gms_project.data_11
    
    UNION ALL
    
    SELECT * FROM gms_project.data_12
    
    );
    
    
#DATA EXPLORATION

	SELECT * FROM gms_project.data_combined
    LIMIT 5;
    
    SELECT 
		COUNT(*) AS TOTAL_ROWS,
		COUNT(visitid) as NON_NULL_ROWS
    FROM gms_project.data_combined;
    
    
    SELECT 
		fullvisitorid,
        count(*) as total_rows
	FROM gms_project.data_combined
    GROUP BY 1
    HAVING count(*)>1
    LIMIT 5;
    
	SELECT 
		CONCAT(fullvisitorid, "-", visitid) AS Unique_session_id,
        count(*) as total_rows
	FROM gms_project.data_combined
    GROUP BY 1
    HAVING count(*)>1
    LIMIT 5;
    
	SELECT 
		CONCAT(fullvisitorid, "-", visitid) AS Unique_session_id,
        from_unixtime(DATE) + INTERVAL - 8 HOUR AS DATE,
        count(*) as total_rows
	FROM gms_project.data_combined
    GROUP BY 1,2
    HAVING Unique_session_id= "0368176022600320212-1477983528"
    LIMIT 5;
		
# WEBSITE ENGAGEMENT BY DAY

SELECT 
	DATE,
    COUNT(DISTINCT Unique_session_id) AS Sessions
FROM( 
SELECT 
	DATE(FROM_UNIXTIME(DATE)) AS DATE,
    CONCAT(fullvisitorid, "-", visitid) AS Unique_session_id
 FROM gms_project.data_combined
 GROUP BY 1,2
 ) t1
 
GROUP BY 1
ORDER BY 1;

    
    
    
 SELECT 
	DAYNAME(DATE) AS Weekday,
    COUNT(DISTINCT Unique_session_id) AS Sessions
FROM( 
SELECT 
	DATE(FROM_UNIXTIME(DATE)) AS DATE,
    CONCAT(fullvisitorid, "-", visitid) AS Unique_session_id
 FROM gms_project.data_combined
 GROUP BY 1,2
 ) t1
 
GROUP BY 1
ORDER BY 2 DESC;   



# WEBSITE ENGAGEMENT & MOENTIZATION BY DAY


SELECT 
	DAYNAME(DATE) AS Weekday,
    COUNT(DISTINCT Unique_session_id) as Sessions,
    SUM(Converted) AS Conversions,
    ((SUM(Converted)/COUNT(DISTINCT Unique_session_id))*100) AS Conversion_rate
FROM
(
SELECT 
	DATE(FROM_UNIXTIME(DATE)) AS DATE,
    CASE
		WHEN transactions >= 1 THEN 1
        ELSE 0
	END AS Converted,
    CONCAT(fullvisitorid,'-', visitid) as Unique_session_id
FROM gms_project.data_combined
GROUP BY 1,2,3
)t1

GROUP BY 1
ORDER BY 2 DESC;


# WEBSITE ENGAGEMENT & MOENTIZATION BY DEVICE

SELECT 
	deviceCategory,
    COUNT(DISTINCT Unique_session_id) as Sessions,
    ((COUNT(DISTINCT Unique_session_id)/SUM(COUNT(DISTINCT Unique_session_id)) OVER ())*100) AS Session_percentage,
    SUM(transactionrevenue)/1e6 AS Revenue,
    ((SUM(transactionrevenue)/SUM(SUM(transactionrevenue)) OVER ())*100) AS Revenue_percentage
FROM
(
SELECT  
	deviceCategory,
    transactionrevenue,
    CONCAT(fullvisitorid,'-', visitid) as Unique_session_id
FROM gms_project.data_combined
GROUP BY 1,2,3
)t1

GROUP BY 1;



# WEBSITE ENGAGEMENT & MOENTIZATION BY Region

SELECT 
	deviceCategory,
    COUNT(DISTINCT Unique_session_id) as Sessions,
    ((COUNT(DISTINCT Unique_session_id)/SUM(COUNT(DISTINCT Unique_session_id)) OVER ())*100) AS Session_percentage,
    SUM(transactionrevenue)/1e6 AS Revenue,
    ((SUM(transactionrevenue)/SUM(SUM(transactionrevenue)) OVER ())*100) AS Revenue_percentage
FROM
(
SELECT  
	deviceCategory,
    CASE
		WHEN region = '' OR region IS NULL  THEN 'NA'
        ELSE region
	END AS region,
    transactionrevenue,
    CONCAT(fullvisitorid,'-', visitid) as Unique_session_id
FROM gms_project.data_combined
GROUP BY 1,2,3,4
)t1

GROUP BY 1;



# WEBSITE RETENTION

SELECT
	CASE
		WHEN newVisits = 1  THEN 'New Visitor'
        ELSE 'Returning Visitor'
	END AS Visitor_Type,
    COUNT(DISTINCT fullvisitorid) AS Visitors,
    ((COUNT(DISTINCT fullvisitorid)/SUM(COUNT(DISTINCT fullvisitorid)) OVER()) * 100) AS Visitors_percentage
FROM gms_project.data_combined
GROUP BY 1;



# WEBSITE AQUISITION


SELECT 
	COUNT(DISTINCT Unique_session_id) as Sessions,
    SUM(bounces) AS Total_bounces,
    ((SUM(bounces)/COUNT(DISTINCT Unique_session_id)) * 100) AS Bounce_rate
FROM
	
(
SELECT 
	bounces,
    CONCAT(fullvisitorid, '-', visitid) AS Unique_session_id
FROM gms_project.data_combined
GROUP BY 1,2
)t1

ORDER BY 1 DESC;



# WEBSITE AQUISITION BY CHANNEL


SELECT 
	channelGrouping,
	COUNT(DISTINCT Unique_session_id) as Sessions,
    SUM(bounces) AS Total_bounces,
    ((SUM(bounces)/COUNT(DISTINCT Unique_session_id)) * 100) AS Bounce_rate
FROM
	
(
SELECT 
	channelGrouping,
	bounces,
    CONCAT(fullvisitorid, '-', visitid) AS Unique_session_id
FROM gms_project.data_combined
GROUP BY 1,2,3
)t1

GROUP BY 1
ORDER BY 2 DESC;



# WEBSITE AQUISITION & MONETIZATION BY CHANNEL


SELECT 
	channelGrouping,
	COUNT(DISTINCT Unique_session_id) as Sessions,
    SUM(bounces) AS Total_bounces,
    ((SUM(bounces)/COUNT(DISTINCT Unique_session_id)) * 100) AS Bounce_rate,
    (SUM(pageviews)/COUNT(DISTINCT Unique_session_id)) AS AVG_Pageview,
    (SUM(timeonsite)/COUNT(DISTINCT Unique_session_id)) AS Avg_Timeonsite,
    ((Sum(CASE WHEN transactions >= 1 THEN 1 ELSE 0 END)/COUNT(DISTINCT Unique_session_id)) * 100) AS Conversion_rate,
    SUM(transactionrevenue)/ 1e6 AS Revenue
    
FROM
	
(
SELECT 
	channelGrouping,
	bounces,
    pageviews,
    timeonsite,
    transactions,
    transactionrevenue,
    CONCAT(fullvisitorid, '-', visitid) AS Unique_session_id
FROM gms_project.data_combined
GROUP BY 1,2,3,4,5,6,7
)t1

GROUP BY 1
ORDER BY 2 DESC;

