++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Import the file first
USE Suicide_Rate;
-- selects all the data present in the data base
SELECT * FROM Suicide_Rate;
-----------------------------------------------------------------------------------------------------------------------
--State- wise suicide cases with highest victims(top 2)
SELECT TOP 2 State, SUM(Total) AS  Sum_Total,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
GROUP BY State;
--Output- Maharastra and West Bengal have the highest and second highest no of cases

--State- wise suicide cases with lowest victims (bottom 2)
SELECT TOP 2 State, SUM(Total) AS  Sum_Total,
DENSE_RANK() OVER( ORDER BY SUM(Total) ASC) Rank
FROM Suicide_Rate
GROUP BY State;
--Output- Lakshadweep and Daman & Diu have the lowest and second lowest no of cases

---------------------------------------------------------------------------------------------------------------------------
--States having the highest no. of male victims
SELECT TOP 2 State,Gender, SUM(Total) AS  Sum_Total,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Gender = 'Male'
GROUP BY State, Gender;
--Output- Maharastra and Andhra Pradesh have the highest and second highest no of male victims

--States having the highest no. of female victims
SELECT TOP 2 State,Gender, SUM(Total) AS  Sum_Total,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Gender = 'Female'
GROUP BY State, Gender;
--Output- West Bengal and Tamil Nadu have the highest and second highest no of female victims
----------------------------------------------------------------------------------------------------------------------
-- Male female suicide rate comparison
SELECT Gender, SUM(Total) AS Total_Victims, 
(SUM(Total)* 100 / (Select SUM(Total) From Suicide_Rate)) 
                            AS Percentage_of_Total_Victims
FROM Suicide_Rate
GROUP BY Gender;
--Output- Male:Female victims = 64:36
--------------------------------------------------------------------------------------------------------------------
--Year wise victims reported
SELECT Year, SUM(Total) AS Suicide_Count
FROM Suicide_Rate
GROUP BY Year
ORDER BY Year;
--Output- Years 2011 and 2010 have the highest and second highest no of victims

--Year wise Male victims reported
SELECT Year,Gender,SUM(Total) AS  Sum_Total
FROM Suicide_Rate
WHERE Gender ='Male'
GROUP BY Year,Gender
ORDER BY Year;
 --Output- Years 2011 and 2010 have the highest and second highest no of male victims

--Year wise Female victims reported
SELECT Year,Gender,SUM(Total) AS  Sum_Total
FROM Suicide_Rate
WHERE Gender ='Female'
GROUP BY Year,Gender
ORDER BY Year;
 --Output- Years 2011 and 2010 have the highest and second highest no of female victims
--------------------------------------------------------------------------------------------------------------------------
--Age wise distribution of Victims
SELECT Age_group,SUM(Total) AS  Suicide_Count
FROM Suicide_Rate
WHERE Age_group NOT IN ('0-100+')
GROUP BY Age_group
ORDER BY Age_group;
--Output- Age group :15-29 and 30-44 have the highest and second highest no of victims

--Age wise distribution of Male Victims
SELECT Age_group, Gender, SUM(Total) AS  Suicide_Count
FROM Suicide_Rate
WHERE Gender = 'Male' AND Age_group NOT IN ('0-100+')
GROUP BY Age_group, Gender
ORDER BY Age_group;
--Output- Age group :30-44 and 15-29 have the highest and second highest no of victims

--Age wise distribution of Female Victims
SELECT Age_group, Gender, SUM(Total) AS  Suicide_Count
FROM Suicide_Rate
WHERE Gender = 'Female' AND Age_group NOT IN ('0-100+')
GROUP BY Age_group, Gender
ORDER BY Age_group;
--Output- Age group :15-29 and 30-44 have the highest and second highest no of female victims
-----------------------------------------------------------------------------------------------------------------------
--Suicide_count depending on the Type Code- Causes 
SELECT Top 5 Type,Type_code, SUM(Total) AS Suicide_Count
FROM Suicide_Rate
WHERE Type_code = 'Causes'
GROUP BY Type,Type_code
ORDER BY Suicide_Count DESC;
--Output- Family Problems had been the major cause of suicides

--Male Suicide_count depending on the Type Code- Causes (Top 5) 
SELECT Top 5 Type,Type_code,Gender, SUM(Total) AS Male_Victims
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND Gender = 'Male'
GROUP BY Type,Type_code, Gender
ORDER BY Male_Victims DESC;
--Output- Family Problems had been the major cause of suicides among male victims

--Female Suicide_count depending on the Type Code- Causes (Top 5) 
SELECT Top 5 Type,Type_code,Gender, SUM(Total) AS Female_Victims
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND Gender = 'Female'
GROUP BY Type,Type_code, Gender
ORDER BY Female_Victims DESC;
--Output- Family Problems had been the major cause of suicides among female victims
------------------------*---------------------------------------*----------------------------------
--Suicide_count depending on the Type Code- Causes and Age group 0-14
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND Age_group = '0-14' 
GROUP BY Type,Type_code, Age_group;
--Output- Other causes(not stated) had been the major cause of suicides among victims of Age groups(0-14)

--Suicide_count depending on the Type Code- Causes and Age group 15-29
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND Age_group = '15-29' 
GROUP BY Type,Type_code, Age_group;
--Output- Family Problems had been the major cause of suicides among victims of Age groups(15-29)

--Suicide_count depending on the Type Code- Causes and Age group 30-44
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND Age_group = '30-44' 
GROUP BY Type,Type_code, Age_group;
--Output- Family Problems had been the major cause of suicides among victims of Age groups(30-44)

--Suicide_count depending on the Type Code- Causes and Age group 45-59
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND Age_group = '45-59' 
GROUP BY Type,Type_code, Age_group;
--Output- Family Problems had been the major cause of suicides among victims of Age groups(45-59)

--Suicide_count depending on the Type Code- Causes and Age group 60+
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND Age_group = '60+' 
GROUP BY Type,Type_code, Age_group;
--Output- Other Prolonged Illness  had been the major cause of suicides among victims of Age groups(60+)
----------------------------------------------------------------------------------------------------------------------
--Suicide_count depending on the Type Code- Means adopted (Top 5)
SELECT Top 5 Type,Type_code ,SUM(Total) AS Suicide_Count
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted'
GROUP BY Type,Type_code
ORDER BY Suicide_Count DESC;
--Output- Hanging had been the most common means adopted

--Male Suicide_count depending on the Type Code- Means_adopted (Top 5) 
SELECT Top 5 Type,Type_code,Gender, SUM(Total) AS Male_Victims
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted' AND Gender = 'Male'
GROUP BY Type,Type_code, Gender
ORDER BY Male_Victims DESC;
--Output- Hanging had been the most common means adopted among male victims

--Female Suicide_count depending on the Type Code- Means_adopted (Top 5) 
SELECT Top 5 Type,Type_code,Gender, SUM(Total) AS Female_Victims
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted' AND Gender = 'Female'
GROUP BY Type,Type_code, Gender
ORDER BY Female_Victims DESC;
--Output- Hanging had been the most common means adopted among female victims
------------------------*---------------------------------------*----------------------------------
--Suicide_count depending on the Type Code- Means Adopted and Age group 0-14
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted' AND Age_group = '0-14' 
GROUP BY Type,Type_code, Age_group;
--Output- Hanging  had been most common means adopted among Age groups(0-14)

--Suicide_count depending on the Type Code- Means Adopted and Age group 15-29
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted' AND Age_group = '15-29' 
GROUP BY Type,Type_code, Age_group;
--Output- Hanging  had been most common means adopted among Age groups(15-29)

--Suicide_count depending on the Type Code- Means Adopted and Age group 30-44
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted' AND Age_group = '30-44' 
GROUP BY Type,Type_code,Age_group;
--Output- Hanging  had been most common means adopted among Age groups(30-44)

--Suicide_count depending on the Type Code- Means Adopted and Age group 45-59
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted' AND Age_group = '45-59' 
GROUP BY Type,Type_code, Age_group;
--Output- Hanging  had been most common means adopted among Age groups(45-59)

--Suicide_count depending on the Type Code- Means Adopted and Age group 60+
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Means_adopted' AND Age_group = '60+' 
GROUP BY Type,Type_code, Age_group;
--Output- Hanging  had been most common means adopted among Age groups(60+)
----------------------------------------------------------------------------------------------------------------------------
--Suicide_count depending on the Type Code- Educational_Status  with Age group
SELECT Type,Type_code,Age_group, SUM(Total) AS Suicide_Count
FROM Suicide_Rate
WHERE Type_code = 'Education_Status'
GROUP BY Type,Type_code, Age_group
ORDER BY Suicide_Count DESC;
--Output- Most victims had education till primary school

--Male Suicide_count depending on the Type Code- Education_Status (Top 5) 
SELECT  Type,Type_code, Gender, SUM(Total) AS Male_Victims
FROM Suicide_Rate
WHERE Type_code = 'Education_Status' AND Gender = 'Male'
GROUP BY Type,Type_code,Gender
ORDER BY Male_Victims DESC;
--Output- Most male victims had education till primary school

--Female Suicide_count depending on the Type Code- Education_Status (Top 5) 
SELECT  Type,Type_code,Gender, SUM(Total) AS Female_Victims
FROM Suicide_Rate
WHERE Type_code = 'Education_Status' AND Gender = 'Female'
GROUP BY Type,Type_code, Gender
ORDER BY Female_Victims DESC;
--Output- Most female victims had education till primary school
-----------------------------------------------------------------------------------------------------------
--Suicide_count depending on the Type Code- Professional_Profile 
SELECT Type,Type_code, SUM(Total) AS Suicide_Count
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile'
GROUP BY Type,Type_code
ORDER BY Suicide_Count DESC;
--Output- Most victims had been into Other Profession(Not stated)

--Male Suicide_count depending on the Type Code- Professional_Profile (Top 5) 
SELECT Top 5 Type,Type_code,Gender, SUM(Total) AS Male_Victims
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND Gender = 'Male'
GROUP BY Type,Type_code, Gender
ORDER BY Male_Victims DESC;
--Output- Most  male victims had been into Other Profession(Not stated)

--Female Suicide_count depending on the Type Code- Professional_Profile (Top 5) 
SELECT Top 5 Type,Type_code,Gender, SUM(Total) AS Female_Victims
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND Gender = 'Female'
GROUP BY Type,Type_code, Gender
ORDER BY Female_Victims DESC;
--Output- Most female victims had been Housewives
------------------------*---------------------------------------*----------------------------------
--Suicide_count depending on the Type Code- Professional_Profile and Age group 0-14
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND Age_group = '0-14' 
GROUP BY Type,Type_code, Age_group;
--Output- Most victims had been into Other professions(not stated) among Age groups(0-14)

--Suicide_count depending on the Type Code- Professional_Profile and Age group 15-29
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND Age_group = '15-29' 
GROUP BY Type,Type_code, Age_group;
--Output- Most victims had been into Other professions(not stated) among Age groups(15-29)

--Suicide_count depending on the Type Code- Professional_Profile and Age group 30-44
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND Age_group = '30-44' 
GROUP BY Type,Type_code, Age_group;
--Output- Most victims had been into Other professions(not stated) among Age groups(30-44)

--Suicide_count depending on the Type Code- Professional_Profile and Age group 45-59
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND Age_group = '45-59' 
GROUP BY Type,Type_code, Age_group;
--Output- Most victims had been into Other professions(not stated) among Age groups(45-59)

--Suicide_count depending on the Type Code- Professional_Profile and Age group 60+
SELECT TOP 5 Type,Type_code,Age_group,SUM(Total) AS  Suicide_Count,
DENSE_RANK() OVER( ORDER BY SUM(Total) DESC) Rank
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND Age_group = '60+' 
GROUP BY Type,Type_code, Age_group;
--Output- Most victims had been into Other professions(not stated) among Age groups(60+)
--------------------------------------------------------------------------------------------------------------------------------
--Male Suicide_count depending on the Type Code- Social_Status (Top 5) 
SELECT Type,Type_code,Age_Group, SUM(Total) AS Suicide_Count
FROM Suicide_Rate
WHERE Type_code = 'Social_Status'
GROUP BY Type,Type_code,Age_Group
ORDER BY Suicide_Count DESC;
--Output- Most victims had been Married 

--Male Suicide_count depending on the Type Code- Social_Status
SELECT Type,Type_code,Gender, SUM(Total) AS Male_Victims
FROM Suicide_Rate
WHERE Type_code = 'Social_Status' AND Gender = 'Male'
GROUP BY Type,Type_code, Gender
ORDER BY Male_Victims DESC;
--Output- Most male victims had been Married 

--Female Suicide_count depending on the Type Code- Social_Status 
SELECT Type,Type_code, Gender, SUM(Total) AS Female_Victims
FROM Suicide_Rate
WHERE Type_code = 'Social_Status' AND Gender = 'Female'
GROUP BY Type,Type_code, Gender
ORDER BY Female_Victims DESC;
--Output- Most female victims had been Married
----------------------------------------------------------------------------------------------------------------
--Details about the state of Maharastra

--Age wise seggregation in different states 
SELECT A.Age_group,A.State,SUM(A.Victims) AS Category_Sum 
FROM ( SELECT Age_group,State, SUM(Total) AS Victims
FROM Suicide_Rate
WHERE State ='Maharashtra'  and Age_group NOT IN ('0-100+')
GROUP BY  Age_group,State) AS A
GROUP BY A.Age_group,A.State
ORDER BY A.Age_group ;
--Output- Age group : 15-29 & 30-44 have the highest and second highest no of victims in the state of Maharastra

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Gender wise seggregation in Maharastra
SELECT State,Gender, SUM(Total) AS Victims
FROM Suicide_Rate
WHERE State ='Maharashtra'
GROUP BY State, Gender
ORDER BY Victims DESC;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Professional wise seggregation in Maharastra
SELECT Top 2 Type,State, SUM(Total) AS Victims
FROM Suicide_Rate
WHERE Type_code = 'Professional_Profile' AND State ='Maharashtra' 
GROUP BY Type,State, Gender
ORDER BY Victims DESC;
--Output- Most victims had been Housewives followed by those associated with Farming activities 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Educational Background wise seggregation in Maharastra
SELECT Top 2 Type,State, SUM(Total) AS Victims
FROM Suicide_Rate
WHERE Type_code = 'Education_Status' AND State ='Maharashtra' 
GROUP BY Type,State
ORDER BY Victims DESC;
--Output- Most victims had Primary education followed by those who had studied till middle school
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Social Status wise seggregation in Maharastra
SELECT Top 2 Type,State, SUM(Total) AS Victims
FROM Suicide_Rate
WHERE Type_code = 'Social_Status' AND State ='Maharashtra' 
GROUP BY Type,State
ORDER BY Victims DESC;
--Output- Most victims had been Married followed by those who were never married
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Cause wise seggregation in Maharastra
SELECT Top 2 Type,State, SUM(Total) AS Victims
FROM Suicide_Rate
WHERE Type_code = 'Causes' AND State ='Maharashtra' 
GROUP BY Type,State
ORDER BY Victims DESC;
--Output- Most victims had Family problems followed by those who had Other prolonged illness
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++







