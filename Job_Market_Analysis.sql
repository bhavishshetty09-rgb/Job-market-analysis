use project_job_market_analysis;
show tables;
describe Market;
select*from Market limit 10;
select count(*) as Total_Records from Market;
use project_job_market_analysis;
show tables;


DESCRIBE Market;
USE project_job_market_analysis;

DESCRIBE Market;

SELECT COUNT(*) AS total_rows
FROM Market;

SELECT ID, Job_Title, Salary_Estimate, FIELD4, Rating,
       Company_Name, Location, Lower_Salary, Upper_Salary,
       Avg_SalaryK, Degree
FROM Market
LIMIT 5;
SELECT
  COUNT(*) AS total_rows,
  SUM(FIELD4 IS NULL OR TRIM(FIELD4) = '') AS blank_FIELD4
FROM Market;

SELECT
  SUM(Job_Title = '-1') AS missing_job_title,
  SUM(Salary_Estimate = '-1') AS missing_salary_estimate,
  SUM(Rating = -1) AS missing_rating,
  SUM(Location = '-1') AS missing_location,
  SUM(Headquarters = '-1') AS missing_headquarters,
  SUM(Size = '-1') AS missing_size,
  SUM(Founded = -1) AS missing_founded,
  SUM(Type_of_ownership = '-1') AS missing_ownership,
  SUM(Industry = '-1') AS missing_industry,
  SUM(Sector = '-1') AS missing_sector,
  SUM(Revenue = '-1') AS missing_revenue,
  SUM(Competitors = '-1') AS missing_competitors,
  SUM(Lower_Salary = -1) AS missing_lower_salary,
  SUM(Upper_Salary = -1) AS missing_upper_salary,
  SUM(Avg_SalaryK = -1) AS missing_average_salary,
  SUM(company_txt = '-1') AS missing_company,
  SUM(Job_Location = '-1') AS missing_state,
  SUM(Age = -1) AS missing_company_age,
  SUM(job_title_sim = '-1') AS missing_job_title_group,
  SUM(seniority_by_title = '-1') AS missing_seniority,
  SUM(Degree = '-1') AS missing_degree
FROM Market;

SELECT Job_Location AS State,
       COUNT(*) AS Job_Postings
FROM Market
WHERE Job_Location IS NOT NULL
  AND Job_Location <> '-1'
GROUP BY Job_Location
ORDER BY Job_Postings DESC;

SELECT
  Job_Location AS State,
  COUNT(*) AS Job_Postings,
  ROUND(AVG(Lower_Salary), 1) AS Avg_Min_Salary_K,
  ROUND(AVG(Upper_Salary), 1) AS Avg_Max_Salary_K,
  ROUND(AVG(Avg_SalaryK), 1) AS Mean_Salary_K
FROM Market
WHERE Job_Location <> '-1'
GROUP BY Job_Location
ORDER BY Mean_Salary_K DESC;

SELECT
  Industry,
  COUNT(*) AS Job_Postings
FROM Market
WHERE Industry <> '-1'
GROUP BY Industry
ORDER BY Job_Postings DESC
LIMIT 5;

SELECT
  company_txt AS Company,
  COUNT(*) AS Job_Openings
FROM Market
GROUP BY company_txt
ORDER BY Job_Openings DESC
LIMIT 10;

SELECT
  job_title_sim AS Job_Title_Group,
  COUNT(*) AS Job_Postings
FROM Market
WHERE job_title_sim <> '-1'
GROUP BY job_title_sim
ORDER BY Job_Postings DESC
LIMIT 10;

SELECT
  job_title_sim AS Job_Title_Group,
  COUNT(*) AS Job_Postings,
  ROUND(AVG(Avg_SalaryK), 1) AS Average_Salary_K
FROM Market
WHERE LOWER(job_title_sim) NOT IN ('-1', 'na')
GROUP BY job_title_sim
ORDER BY Job_Postings DESC
LIMIT 10;

SELECT
  job_title_sim AS Job_Title_Group,
  COUNT(*) AS Job_Postings,
  ROUND(AVG(CAST(Python AS UNSIGNED)) * 100, 1) AS Python_pct,
  ROUND(AVG(CAST(spark AS UNSIGNED)) * 100, 1) AS Spark_pct,
  ROUND(AVG(CAST(aws AS UNSIGNED)) * 100, 1) AS AWS_pct,
  ROUND(AVG(CAST(excel AS UNSIGNED)) * 100, 1) AS Excel_pct,
  ROUND(AVG(CAST(sql_ AS UNSIGNED)) * 100, 1) AS SQL_pct,
  ROUND(AVG(CAST(sas AS UNSIGNED)) * 100, 1) AS SAS_pct,
  ROUND(AVG(CAST(keras AS UNSIGNED)) * 100, 1) AS Keras_pct,
  ROUND(AVG(CAST(pytorch AS UNSIGNED)) * 100, 1) AS PyTorch_pct,
  ROUND(AVG(CAST(scikit AS UNSIGNED)) * 100, 1) AS Scikit_pct,
  ROUND(AVG(CAST(tensor AS UNSIGNED)) * 100, 1) AS TensorFlow_pct,
  ROUND(AVG(CAST(hadoop AS UNSIGNED)) * 100, 1) AS Hadoop_pct,
  ROUND(AVG(CAST(tableau AS UNSIGNED)) * 100, 1) AS Tableau_pct,
  ROUND(AVG(CAST(bi AS UNSIGNED)) * 100, 1) AS BI_pct,
  ROUND(AVG(CAST(flink AS UNSIGNED)) * 100, 1) AS Flink_pct,
  ROUND(AVG(CAST(mongo AS UNSIGNED)) * 100, 1) AS MongoDB_pct,
  ROUND(AVG(CAST(google_an AS UNSIGNED)) * 100, 1) AS Google_Analytics_pct
FROM Market
WHERE LOWER(job_title_sim) NOT IN ('-1', 'na')
GROUP BY job_title_sim
ORDER BY Job_Postings DESC;

SELECT
  Degree,
  COUNT(*) AS Job_Postings,
  ROUND(AVG(Avg_SalaryK), 1) AS Mean_Salary_K
FROM Market
GROUP BY Degree
ORDER BY Mean_Salary_K DESC;

SELECT
  ID,
  Job_Title,
  Salary_Estimate,
  Rating,
  company_txt AS Company_Name,
  Location,
  Headquarters,
  Size,
  Founded,
  Type_of_ownership,
  Industry,
  Sector,
  Revenue,
  Competitors,
  CAST(Hourly AS UNSIGNED) AS Hourly,
  CAST(Employer_provided AS UNSIGNED) AS Employer_provided,
  Lower_Salary,
  Upper_Salary,
  Avg_SalaryK,
  Job_Location,
  Age,
  CAST(Python AS UNSIGNED) AS Python,
  CAST(spark AS UNSIGNED) AS spark,
  CAST(aws AS UNSIGNED) AS aws,
  CAST(excel AS UNSIGNED) AS excel,
  CAST(sql_ AS UNSIGNED) AS sql_,
  CAST(sas AS UNSIGNED) AS sas,
  CAST(keras AS UNSIGNED) AS keras,
  CAST(pytorch AS UNSIGNED) AS pytorch,
  CAST(scikit AS UNSIGNED) AS scikit,
  CAST(tensor AS UNSIGNED) AS tensor,
  CAST(hadoop AS UNSIGNED) AS hadoop,
  CAST(tableau AS UNSIGNED) AS tableau,
  CAST(bi AS UNSIGNED) AS bi,
  CAST(flink AS UNSIGNED) AS flink,
  CAST(mongo AS UNSIGNED) AS mongo,
  CAST(google_an AS UNSIGNED) AS google_an,
  job_title_sim,
  seniority_by_title,
  Degree
FROM Market;

SELECT Size, COUNT(*) AS Records
FROM Market
GROUP BY Size
ORDER BY Size;
select*from Market;









