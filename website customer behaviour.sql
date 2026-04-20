CREATE DATABASE WEBSITE;
USE WEBSITE;
SELECT *FROM website_performance_analytics;

-- What is the total number of visitor?
SELECT COUNT(*) AS Total_Visitors
FROM website_performance_analytics; 

-- What are different type of source through which customers are coming?
SELECT Traffic_Source,
       COUNT(DISTINCT Visitor_ID) AS Unique_Visitors
FROM website_performance_analytics
WHERE Visitor_ID IS NOT NULL
GROUP BY Traffic_Source
ORDER BY Unique_Visitors DESC; 

-- What is the average page views across all visitors?
SELECT AVG(Page_Views) AS Avg_Page_Views
FROM website_performance_analytics;

--  What are the top 5 locations with the highest page views?
SELECT Location,
       SUM(Page_Views) AS Total_Page_Views
FROM website_performance_analytics
GROUP BY Location
ORDER BY Total_Page_Views DESC
LIMIT 5; 

--  What are the top 5 locations with the lowest page views
SELECT Location,
       SUM(Page_Views) AS Total_Page_Views
FROM website_performance_analytics
GROUP BY Location
ORDER BY Total_Page_Views ASC
LIMIT 5; 

-- List of different exit pages.
SELECT DISTINCT Exit_Pages
FROM website_performance_analytics
WHERE Exit_Pages IS NOT NULL
ORDER BY Exit_Pages;

-- Which  Exit page  is with the highest average session duration?
SELECT Exit_Pages,
       AVG(Session_Duration) AS Avg_Session_Duration
FROM website_performance_analytics
GROUP BY Exit_Pages
ORDER BY Avg_Session_Duration DESC
LIMIT 5; 

-- Top 10 pages by page views with their average load time
SELECT Page_Views,
       SUM(Page_Views) AS Total_Page_Views,
       AVG(Load_Time) AS Avg_Load_Time
FROM website_performance_analytics
GROUP BY Page_Views
ORDER BY Avg_Load_Time ASC
LIMIT 10; 

-- What is the highest bounce rate by load time?
SELECT Page_Views,
       AVG(Load_Time) AS Avg_Load_Time,
       AVG(Bounce_Rate) AS Avg_Bounce_Rate
FROM website_performance_analytics
GROUP BY Page_Views
ORDER BY Avg_Bounce_Rate DESC
LIMIT 5;

--  What is relation between Average Session Duration and Visitor Type ?
SELECT Visitor_Type, AVG(Session_Duration) AS Avg_Session
FROM website_performance_analytics
GROUP BY Visitor_Type
ORDER BY Avg_Session DESC; 

--  Show Top 10 Exit Pages by Traffic Source. 
SELECT Traffic_Source, Exit_Pages, COUNT(*) AS Exit_Count
FROM website_performance_analytics
GROUP BY Traffic_Source, Exit_Pages
ORDER BY Exit_Count DESC
LIMIT 10; 

-- Show Average Load Time by Location 
SELECT Location, AVG(Load_Time) AS Avg_Load_Time
FROM website_performance_analytics
GROUP BY Location
ORDER BY Avg_Load_Time DESC
LIMIT 10; 

--  How Bounce Rate is related to  Page Views ?
SELECT Page_Views, AVG(Bounce_Rate) AS Avg_Bounce
FROM website_performance_analytics
GROUP BY Page_Views
ORDER BY Page_Views; 

-- Conversion rate grouped by traffic source
SELECT Traffic_Source,
       ROUND(SUM(Conversion_Rate) * 100.0 / COUNT(DISTINCT Visitor_ID), 2) AS Conversion_Rate_Percent
FROM website_performance_analytics
GROUP BY Traffic_Source
ORDER BY Conversion_Rate_Percent DESC; 








