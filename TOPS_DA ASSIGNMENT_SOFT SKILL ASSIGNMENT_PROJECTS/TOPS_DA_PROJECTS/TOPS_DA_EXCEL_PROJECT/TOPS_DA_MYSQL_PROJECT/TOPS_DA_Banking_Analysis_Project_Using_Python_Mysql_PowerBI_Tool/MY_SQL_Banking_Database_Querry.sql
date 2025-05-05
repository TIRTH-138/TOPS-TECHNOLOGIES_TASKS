CREATE DATABASE Banking_Analysis;
USE Banking_Analysis;
Select * From Banking;

# (1) List all clients along with their age and occupation.
Select Name, Age, Occupation From Banking;

# (2) Count how many clients are there from each nationality.
Select Nationality, count(Nationality) from banking group by Nationality;

# (3) Find the total number of male and female clients.
Select GenderId, Count(GenderId) From Banking Group by GenderId;

#(4) Show the average bank deposits grouped by loyalty classification.
SELECT `Loyalty Classification`, round(AVG(`Bank Deposits`)) AS AvgBankDeposits
FROM Banking
GROUP BY `Loyalty Classification`;

#(5) List clients who have more than 1 million in Business Lending.
SELECT Name, `Business Lending`
FROM Banking
WHERE `Business Lending` > 100000;

#(6) Find the top 5 clients with the highest Saving Accounts balance.
SELECT 
    `Client ID`,
    `Name`,
    SUM(`Saving Accounts`) AS `total saving`
FROM
    Banking
GROUP BY `Name` , `Client ID`
ORDER BY `total saving` DESC
LIMIT 5;

# (7) Display the number of properties owned by clients in each banking relationship type.
SELECT 
    BRId, SUM(`Properties Owned`)
FROM
    Banking
GROUP BY BRId;

# (8) Identify the Investment Advisor managing clients with the highest total Bank Deposits.
SELECT 
    IAId, SUM(`Bank Deposits`) AS total_deposits
FROM
    Banking
GROUP BY IAId
ORDER BY Total_deposits DESC;

# (9) Find the average Foreign Currency Account value for each Gender and Loyalty Classification.
SELECT 
    `Loyalty Classification`,
    GenderId,
    AVG(`Foreign Currency Account`) as AVG_Currency
FROM
    banking
GROUP BY GenderId , `Loyalty Classification`
ORDER BY GenderId, `Loyalty Classification`;
