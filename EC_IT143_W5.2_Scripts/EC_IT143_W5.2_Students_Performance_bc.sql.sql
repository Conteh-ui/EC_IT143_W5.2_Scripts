/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Students_Performance_bc.sql
PURPOSE: Answer questions about student exam performance

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/26/2025   Baimba Conteh  Created script to answer 4 questions about student performance.

RUNTIME: 
Xm Xs

NOTES: 
This script answers 4 questions about student scores, parental education, test prep, and achievement gaps.
One question was created by a classmate (Paragon Ikponmwonba).
 
******************************************************************************************************************/

-- Q1: What is the average math score for students whose parents have a master’s degree compared to those with only a high school education, and how does this vary by gender?
-- A1: Students with higher parental education tend to score higher in math.
--     Author: Baimba Conteh

SELECT 
    parental_level_of_education,
    gender,
    AVG(math_score) AS AvgMathScore
FROM 
    StudentsPerformance
WHERE 
    parental_level_of_education IN ('master''s degree', 'high school')
GROUP BY 
    parental_level_of_education, gender
ORDER BY 
    AvgMathScore DESC;

-- Q2: Do students who completed test preparation score higher in reading and writing?
-- A2: Yes, on average, test prep students score higher.
--     Author: Baimba Conteh

SELECT 
    test_preparation_course,
    AVG(reading_score) AS AvgReadingScore,
    AVG(writing_score) AS AvgWritingScore
FROM 
    StudentsPerformance
GROUP BY 
    test_preparation_course;

-- Q3: Which racial/ethnic groups have the highest and lowest average math scores, and how does this correlate with parental education level?
-- A3: This helps identify achievement gaps in education.
--     Author: Baimba Conteh

SELECT 
    race_ethnicity,
    parental_level_of_education,
    AVG(math_score) AS AvgMathScore
FROM 
    StudentsPerformance
GROUP BY 
    race_ethnicity, parental_level_of_education
ORDER BY 
    AvgMathScore DESC;

-- Q4: What percentage of students scored above 90 in all three subjects, and what do they have in common in terms of background?
-- A4: These students likely have strong academic backgrounds and access to resources.
--     Author: Baimba Conteh

SELECT 
    COUNT(*) AS HighScoringStudents,
    SUM(CASE WHEN math_score >= 90 AND reading_score >= 90 AND writing_score >= 90 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PercentageHighScoring
FROM 
    StudentsPerformance;

-- Note: This question requires detailed analysis of multiple factors like lunch status, test prep, and parental education.