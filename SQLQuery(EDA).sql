                                      --------------------
									    --Data Exploration
									  ---------------------
use[covid]
select *  from "'covid-death$'";
----
Select Location, date, total_cases, new_cases, total_deaths, population
From "'covid-death$'"
Where continent is not null 
order by 1,2;
------
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From "'covid-death$'"
Where continent is not null 
order by 1,2;

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From "'covid-death$'"
Where location like 'egypt%'  -- egypt
and continent is not null 
order by 1,2;

-------------------------
-- Shows what percentage of population infected with Covid
Select Location, date, total_cases,total_deaths, (total_cases/population)*100 as PercentPopulationInfected
From "'covid-death$'"; 

------------------------------------
--Countries with Highest Infection Rate compared to Population

select location,Population ,max(total_cases) AS HighestInfectionCount , Max((total_cases/population))*100 as PercentPopulationInfected
From "'covid-death$'" 
group by location,Population
order by PercentPopulationInfected desc;


--------------------------------------
-- Countries with Highest Death Count per Population

select location ,max(cast(total_deaths as int)) as TotalDeathCount
from "'covid-death$'"
where continent is not null
group by location
order by TotalDeathCount desc;

---------------------------------------------
-- GLOBAL NUMBERS

select location ,sum(new_cases) total_cases, SUM(cast(new_deaths as int)) as total_deaths
from "'covid-death$'"
where continent is not null
group by location 
order by total_cases desc;

--in egypt 
select location ,sum(new_cases) total_cases, SUM(cast(new_deaths as int)) as total_deaths
from "'covid-death$'"
where location like 'egypt%'
group by location
order by total_cases desc;

-----------------------------------------------------------------------