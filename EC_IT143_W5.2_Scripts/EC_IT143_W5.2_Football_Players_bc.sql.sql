/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Football_Players_bc.sql
PURPOSE: Answer 4 questions about the Football Players dataset

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/26/2025   Baimba Conteh  Created script to answer 4 key questions about top performers in football.

RUNTIME: 
<Add after execution: e.g., 00:00:00.015>

NOTES: 
This script answers 4 meaningful questions about player performance, including goals, expected goals, 
progressive passes, and defensive contributions. One question was created by a classmate (Anthony Agyen).
All column names match the cleaned CSV structure. Data types are safe (INT instead of TINYINT).

******************************************************************************************************************/

-- Q1: Which players from the Premier League and La Liga have scored more than 20 goals, and what are their xG values?
-- A1: These are top-tier strikers who consistently score and create high-pressure chances.
--     Author: Baimba Conteh

SELECT 
    Player,
    Squad,
    Comp,
    Gls,
    xG
FROM 
    FootballPlayers
WHERE 
    Gls > 20 
    AND (Comp = 'eng Premier League' OR Comp = 'es La Liga')
ORDER BY 
    Gls DESC;

-- Q2: What is the average number of progressive passes (PrgP) made by midfielders under 25 in Serie A?
-- A2: This helps identify young, creative midfielders in Italy's top league.
--     Author: Baimba Conteh

SELECT 
    AVG(PrgP) AS AvgProgressivePasses
FROM 
    FootballPlayers
WHERE 
    Pos = 'MF' 
    AND Age < 25 
    AND Comp = 'it Serie A';

-- Q3: Which defenders have the highest number of yellow cards (CrdY) and progressive carries (PrgC)?
-- A3: This helps identify aggressive, ball-carrying defenders.
--     Author: Baimba Conteh

SELECT 
    Player,
    Squad,
    CrdY,
    PrgC,
    (CrdY + PrgC) AS AggressionAndMobility
FROM 
    FootballPlayers
WHERE 
    Pos = 'DF'
ORDER BY 
    AggressionAndMobility DESC;

-- Q4: Which customers in the top 10% of spending also use their card most frequently for dining?
-- A4: This was a classmate's question (Anthony Agyen) about the Simpsons dataset.
--     Since I don’t have access to that dataset, I cannot answer it directly.
--     Author: Anthony Agyen

-- Note: This question belongs to a different dataset (Simpsons credit card data).
--       It cannot be answered using the Football Players dataset.