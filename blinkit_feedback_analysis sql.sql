# CREATING DATABASE AND TABLE
create database blinkit_feedback;
use blinkit_feedback;
create table feedback(
feedback_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
rating INT,
feedback_text VARCHAR(250),
feedback_category VARCHAR(200),
sentiment VARCHAR(150));
DESCRIBE feedback;
#Verifying that the data is imported
select * from feedback;

# OVER ALL CUSTOMER SATISFACTION

SELECT AVG(rating) as avg_rating from feedback;

#CUSTOMER HAPPINESS

SELECT  sentiment, count(*) AS total
from feedback
GROUP BY sentiment;

# category wise performance
select feedback_category, avg(rating) as avg_rating
from feedback
group by feedback_category;

#PROBLEM AREA DETECTION

select feedback_category, count(*) As negative_count
from feedback
where sentiment='negative'
group by feedback_category;

#rating distribution

select rating, count(*) as count
from feedback
group by rating;

#positive vs negative ratio

select 
sum(case when sentiment='positive' then 1 else 0 end ) as positive,
sum(case when sentiment = 'negative' then 1 else 0 end) as negative
from feedback;

#top feedback catgeory

select feedback_category, count(*) as total_feedback
from feedback
group by feedback_category
order by total_feedback DESC;

#CUSTOMER BEHAVIOR PATTERN

select customer_id , avg(rating) as avg_rating
from feedback
group by customer_id;

