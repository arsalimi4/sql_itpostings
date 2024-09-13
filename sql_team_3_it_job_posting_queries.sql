-- Requirements A,B
USE g3_it_job_listings;
CREATE VIEW data_only_pl AS
SELECT Job_ID, Country_Code
FROM Country
JOIN Jobs_Salary
WHERE Country_ID = 2
GROUP BY Job_ID, Country_Code;

SELECT * FROM data_only_pl;

-- Requirements A,B,E
USE g3_it_job_listings;
CREATE VIEW job_skills_without_pl AS
SELECT Country.Country_Code, Jobs.Job_ID AS "job_listing_id",
Skills.Skills_Name
FROM Country
JOIN Jobs ON Country.Country_ID = Jobs.Country_ID
JOIN Jobs_Skills ON Jobs.Job_ID = Jobs_Skills.Job_ID
JOIN Skills ON Jobs_Skills.Skills_ID = Skills.Skills_ID
WHERE Country.Country_Code IN (
SELECT Country.Country_Code
FROM Country
JOIN Jobs ON Country.Country_ID = Jobs.Country_ID
JOIN Jobs_Skills ON Jobs.Job_ID = Jobs_Skills.Job_ID
JOIN Skills ON Jobs_Skills.Skills_ID = Skills.Skills_ID
WHERE Country.Country_Code != 'PL'
AND Jobs.Job_ID BETWEEN 1 AND 9
)
GROUP BY Jobs.Job_ID, Country.Country_Code, Skills.Skills_Name
ORDER BY Jobs.Job_ID;

SELECT * FROM job_skills_without_pl;

-- Requirements A, B, D, C
USE g3_it_job_listings;
CREATE VIEW remote_only_a_to_s AS
SELECT COUNT(CONCAT(Remote_Interview, Remote_Job)) AS "Fully Remote",
Title AS "Jobs"
FROM Modality
JOIN Jobs_Modality ON Modality.Remote_id = Jobs_Modality.Remote_ID
JOIN Jobs ON Jobs_Modality.Job_ID = Jobs.Job_ID
WHERE Title BETWEEN "A" AND "S"
GROUP BY Jobs
ORDER BY "Fully Remote", Jobs;

SELECT * FROM remote_only_a_to_s;

-- Requirements A,C
USE g3_it_job_listings;
CREATE VIEW skills_only_sql AS
SELECT Skills_Name, COUNT(Skills_Value) AS "Skills_Value", Title
FROM Skills
JOIN Jobs_Skills ON Skills.Skills_ID = Jobs_Skills.Skills_ID
JOIN Jobs ON Jobs_Skills.Job_ID = Jobs.Job_ID
WHERE Skills_Name LIKE "%SQL%"
GROUP BY Skills_Name, Title
ORDER BY Skills_Value DESC, Skills_Name, Title;

SELECT * FROM skills_only_sql;

-- Requirements A, B
USE g3_it_job_listings;
CREATE VIEW job_salary_outside_of_us AS
SELECT salary_currency_b2b AS Currency, Title
FROM Salary
JOIN Jobs_Salary ON Salary.Salary_ID = Jobs_Salary.Salary_ID
JOIN Jobs ON Jobs_Salary.Job_ID = Jobs.Job_ID
WHERE salary_currency_b2b != "usd"
ORDER BY Currency, Title;