SELECT COUNT(*) FROM mental_health_survey;

SELECT * FROM mental_health_survey LIMIT 10;

DESCRIBE mental_health_survey;

SELECT Age, COUNT(*) as count
FROM survey
GROUP BY Age
ORDER BY Age;

SELECT Gender, COUNT(*) as count
FROM survey
GROUP BY Gender
ORDER BY count DESC;

---------------------------------------------------------------------------------------------------

SELECT 
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS country_nulls,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS state_nulls,
    SUM(CASE WHEN self_employed IS NULL THEN 1 ELSE 0 END) AS self_employed_nulls
FROM survey;

CREATE TABLE survey_backup AS SELECT * FROM survey;

SELECT COUNT(*) FROM survey_backup;

DELETE FROM survey
WHERE CAST(Age AS SIGNED) < 18 OR CAST(Age AS SIGNED) > 80;

-----------------------------------------------------------------------------------

SHOW VARIABLES LIKE 'sql_safe_updates';

SET SQL_SAFE_UPDATES = 0;

DELETE FROM survey
WHERE CAST(Age AS SIGNED) < 18 OR CAST(Age AS SIGNED) > 80;

SET SQL_SAFE_UPDATES = 1;

SELECT COUNT(*) FROM survey;

-----------------------------------------------------

SET SQL_SAFE_UPDATES = 0;
UPDATE survey
SET Gender = 'Male'
WHERE LOWER(TRIM(Gender)) IN ('male', 'm', 'man', 'cis male', 'maile', 'mal', 'male-ish', 'make', 'male (cis)');
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE survey
SET Gender = 'Female'
WHERE LOWER(TRIM(Gender)) IN ('female', 'f', 'woman', 'cis female', 'femake', 'female (trans)');
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE survey
SET Gender = 'Other'
WHERE Gender NOT IN ('Male', 'Female');
SET SQL_SAFE_UPDATES = 1;

SELECT Gender, COUNT(*) as count
FROM survey
GROUP BY Gender
ORDER BY count DESC;

--------------------------------------------------------------

ALTER TABLE survey ADD COLUMN clean_date DATE;



SET SQL_SAFE_UPDATES = 0;

UPDATE survey
SET clean_date = DATE(STR_TO_DATE(Timestamp, '%Y-%m-%d %H:%i:%s'));

SET SQL_SAFE_UPDATES = 1;


SELECT Timestamp, clean_date
FROM survey
LIMIT 5;

-----------------------------------------------------

SELECT self_employed, COUNT(*) as count
FROM survey
GROUP BY self_employed;


SET SQL_SAFE_UPDATES = 0;

UPDATE survey
SET self_employed = NULL
WHERE self_employed = 'NA';

SET SQL_SAFE_UPDATES = 1;


SELECT self_employed, COUNT(*) as count
FROM survey
GROUP BY self_employed;

------------------------------------------------------------

SELECT work_interfere, COUNT(*) as count
FROM survey
GROUP BY work_interfere
ORDER BY count DESC;


SET SQL_SAFE_UPDATES = 0;

UPDATE survey
SET work_interfere = NULL
WHERE work_interfere = 'NA';

SET SQL_SAFE_UPDATES = 1;



SELECT work_interfere, COUNT(*) as count
FROM survey
GROUP BY work_interfere
ORDER BY count DESC;


--------------------------------------------------


SELECT 
    SUM(CASE WHEN family_history = 'NA' THEN 1 ELSE 0 END) AS family_history_na,
    SUM(CASE WHEN treatment = 'NA' THEN 1 ELSE 0 END) AS treatment_na,
    SUM(CASE WHEN remote_work = 'NA' THEN 1 ELSE 0 END) AS remote_work_na,
    SUM(CASE WHEN tech_company = 'NA' THEN 1 ELSE 0 END) AS tech_company_na,
    SUM(CASE WHEN benefits = 'NA' THEN 1 ELSE 0 END) AS benefits_na,
    SUM(CASE WHEN care_options = 'NA' THEN 1 ELSE 0 END) AS care_options_na,
    SUM(CASE WHEN anonymity = 'NA' THEN 1 ELSE 0 END) AS anonymity_na,
    SUM(CASE WHEN `leave` = 'NA' THEN 1 ELSE 0 END) AS leave_na
FROM survey;


------------------------------------------------------------------


SELECT 
    Age,
    Gender,
    Country,
    state,
    self_employed,
    family_history,
    treatment,
    work_interfere,
    no_employees,
    remote_work,
    tech_company,
    benefits,
    care_options,
    anonymity,
    `leave`,
    clean_date
FROM survey;

--------------------------------------------------------

SELECT Gender, COUNT(*) as count
FROM survey_backup
GROUP BY Gender
ORDER BY count DESC;
