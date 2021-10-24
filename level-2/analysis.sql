-- View number of rows data --

Select count(*) 
from vine_table

-- Count Number of Non-Vine Reviews -- 

Select Count(*)
from vine_table 
where vine = 'N'

-- Count Number of Vine Reviews -- 

Select Count(*)
from vine_table 
where vine = 'Y'

Select *
from vine_table
limit 5

-- View Stats on Vine Votes -- 
Select star_rating, Count(total_votes) as "Number_of_Votes", Count(helpful_votes) as "Number_of_helpful_votes"
from vine_table
where vine = 'Y'
group by star_rating
-- All Vine votes were considered helful -- 

-- View Stats on Vine Votes --
Select star_rating, Count(total_votes) as "Number_of_Votes", Count(helpful_votes) as "Number_of_helpful_votes"
from vine_table
where vine = 'N'
group by star_rating
-- All Non-Vine votes were considered helful as well -- 

-- Calculating percent reviews for each rating for Vine Users-- 
Select star_rating, Count(*) / CAST(Sum(count(*)) over () as float) as "Percent_Reviews"
from vine_table
where vine = 'Y'
group by star_rating

-- Calculating percent reviews for each rating for Non-Vine Users-- 
Select star_rating, Count(*) / CAST(Sum(count(*)) over () as float) as "Percent_Reviews"
from vine_table
where vine = 'N'
group by star_rating
