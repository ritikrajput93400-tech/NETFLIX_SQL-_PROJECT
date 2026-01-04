-- Netflix project
drop table netflix ;
create table netflix 
(
	show_id varchar(10),
	type varchar(10),	
	title varchar(150),	
	director  varchar(210),	
	castS varchar(1000),	
	country varchar(150),	
	date_added	VARCHAR(50),
	release_year INT ,	
	rating VARCHAR(10),	
	duration VARCHAR(15),	
	listed_in VARCHAR(100),
	description VARCHAR(250)
);


 
SELECT * FROM netflix;

SELECT count(*) as total_content FROM netflix;

SELECT distinct type  FROM netflix;




-- 15 business problems 


-- 1 count the number of movies and TV shhows 
SELECT type,
       count(*)
FROM netflix
group by 1 ;


--2 find the  most common rating for movies and TV shows 
select 
	type,
	rating
from 
(

select type ,
rating,
count(*),
rank()over(partition by type order by count(*) desc ) as ranking 
from netflix 
group by 1,2 
)
as t1 
where ranking  = 1 


-- Q3 list all movies released in a specific year (e.g. , 2020)
select * from netflix 
where type = 'Movie' and release_year = 2020 ;


--Q4 find the top 5 countries with the most content on Netflix 
select
UNNEST(STRING_TO_ARRAY(country,',')) AS new_country,
	count(show_id) as total_content
from netflix 
group by 1 
order by 2 desc 
limit 5 ;

--5 identify the longest movie?
select *
from netflix 
where
	type = 'Movie' and duration  = (select max(duration)from netflix)

	
-- 6 Find content added in the  last 5 years 
select 
	*
from netflix 
where 
	TO_DATE(date_added,'Month DD, YYYY')  >= current_date - interval '5 years';
	
-- 7 Find all the movies/TV shows by director 'Rajiv Chilaka'
select * from netflix 
where director  Ilike  '%Rajiv Chilaka%';

--8 list all TV shows with more than 5 seasons 
select *
from netflix 
where 
	type = 'TV Show' and 
	SPLIT_PART(duration,' ',1 )::numeric >= 5;


-- 9 count the number of content items in each genre(LISTED_IN)
select 
	
	UNNEST(STRING_TO_ARRAY(listed_in, ',')),
	COUNT(show_id) AS total_content
from netflix
group by 1 ;	

-- Q10 find each year and the average numbers of content release in india on netflix, 
--return top 5  year with highest avg content release 

select 
	EXTRACT ( year FROM To_Date(date_added,'Month DD, YYYY')) as year,
	count(*),
	ROUND(count(*)::numeric/(select count(*) from netflix where country = 'India')::numeric * 100,2
	)as avg_content_peryear
from netflix	
where country  Ilike  '%India%'
group by 1 ;

--Q11 list all movies that are documentaries
select * from netflix
where listed_in Ilike '%Documentaries%';

-- Q12 find alll the content without a direcctor 
select * from netflix
where director is null ;

--Q13 find how many movies actor 'salman khan' apperes in last 10 year 
select * from netflix 
where casts Ilike '%Salman Khan%' and release_year > EXtract(year from current_date) - 10;

-- Q14 find the top 10 actors who  have appeared in the highest number of movies produced in india.
select 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as india_cast,
	count(*) as total_content
from netflix
where country ILIKe '%India%'	
group by 1
order by 2 desc
limit 10 ;


-- Q15 categorize the content based on the presence of the keywords 'kill' and 'violence' 
-- in thee description field. label content conataing these keywords as 'Bad'  and all other 
-- content as 'Good' . count how many items fall into each category 
with new_table as 
(
SELECT *,
CASE 
    WHEN description ILIKE '%kill%'
      OR description ILIKE '%violence%'
    THEN 'Bad'
    ELSE 'Good'
END AS category
FROM netflix
)
select category,
	count(*) as total_content
from new_table
group by 1 ;


SELECT * FROM netflix;