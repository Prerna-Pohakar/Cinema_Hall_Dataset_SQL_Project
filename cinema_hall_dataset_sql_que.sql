
-- SECTION A — BASIC MYSQL PRACTICE QUESTIONS

-- (Simple SELECT, filters, sorting)

-- 1 Display all movies along with their category and rating.
select *from movies;
select movie_name,category,rating from movies;

-- 2 Show all customers who are older than 50.
select *from customers;
select *from customers where customer_age>50;

-- 3 List all bookings where cost_of_ticket = 300.
select *from bookings;
select *from bookings where cost_of_ticket = 300;

-- 4 Display all movies released in 2017.
select *from movies;
select *from movies where release_date= (select year(release_date) from movies where year(release_date)="2017");

-- 5 Show the names of all customers who are Female.
select *from customers;
select *from customers where gender="Female";

-- 6 Retrieve movie names that belong to the Drama category.
select *from movies;
select *from movies where category="Drama";

-- 7 Display booking details sorted by booking_date (ascending).
select *from bookings;
select *from bookings order by booking_date asc;

-- 8 Show the top 5 longest duration movies.
select *from movies;
select *from movies order by duration desc limit 5;
-- 9 Retrieve customer details whose age is between 30 and 60.
select *from customers;
select *from customers where customer_age between 30 and 60;

-- 10 Display the details of the movie with movie_id = 8.
select *from movies;
select *from movies where movie_id=8;
-- 🔵 SECTION B — INTERMEDIATE LEVEL QUESTIONS

-- (Aggregate functions, GROUP BY, HAVING, JOIN)

-- 11 Calculate the total number of movies in each category.
select *from movies;
select category,count(*) as total_number_of_movies from movies group by category;

-- 12 Find the average movie rating for each category.
select *from movies;
select category,round(avg(rating),2) as avg_rating from movies group by category;

-- 13 Show the total tickets sold for each movie.
select *from movies;
select *from bookings;
select m.movie_name,sum(b.no_of_tickets) as total_tickets_sold from movies m join bookings b on m.movie_id=b.movie_id group by m.movie_name;

-- 14 Find the total revenue generated for each movie (tickets × price).
select *from bookings;
select m.movie_name,sum(b.no_of_tickets*b.cost_of_ticket) as total_revenue from movies m join bookings b on m.movie_id=b.movie_id group by m.movie_name;

-- 15 Display customers who booked more than 5 tickets in a single booking.
select *from customers;
select *from bookings;
select c.customer_name,b.no_of_tickets from customers c join bookings b on c.customer_id =b.customer_id where b.no_of_tickets>5;
 
-- 16 List movies with rating greater than 4.
select *from movies;
select *from movies where rating >4;

-- 17 Show bookings made on the date '01-01-2017'.
select *from bookings;
select *from bookings where booking_date="2017-01-01";

-- 18 Display customer names along with movie names they booked using JOIN.
select *from customers;
select distinct c.customer_id,c.customer_name,m.movie_name 
from customers c join bookings b on c.customer_id=b.customer_id 
join movies m on b.movie_id=m.movie_id ;

-- 19 Find the maximum, minimum, and average ticket cost.
select *from bookings;
select max(cost_of_ticket),min(cost_of_ticket),avg(cost_of_ticket) from bookings;

-- 20 Show the movies that belong to categories Drama or Horror.
select *from movies;
select *from movies where category = "Drama" or category= "Horror";

-- 🔵 SECTION C — MODERATE SQL QUESTIONS

-- (Multi-table JOINs, complex filters, date functions)

-- 21 Display booking_id, customer_name, movie_name, and no_of_tickets.
select distinct b.booking_id,c.customer_name,m.movie_name,b.no_of_tickets 
from bookings b join customers c on b.customer_id=c.customer_id join movies m on b.movie_id=m.movie_id;

-- 22 Find the total revenue generated in June 2017.
select  *from bookings;
select sum(no_of_tickets*cost_of_ticket) as total_revenue from bookings
 where month(booking_date)=7 and year(booking_date)=2017;
 
-- 23 Display all bookings where the booking time is after 20:00:00.
select *from bookings;
select *from bookings where timings >"20:00:00";

-- 24 Find the total number of bookings made by each customer.
select *from bookings;
select c.customer_name,sum(b.no_of_tickets) as total_number_of_bookings from customers c join bookings b on c.customer_id=b.customer_id group by c.customer_name;

-- 25 Display customers whose name starts with 'C'.
select *from customers;
select customer_name from customers where customer_name like "C%";

-- 26 List all movies whose duration is higher than the average duration.
select *from movies;
select *from movies where duration>(select avg(duration) from movies);

-- 27 Show all customers who booked Horror category movies.
select *from customers;
select c.*
from customers c join bookings b on c.customer_id=b.customer_id 
join movies m on b.movie_id=m.movie_id 
where m.category="Horror";

-- 28 Show movie names booked in the month July 2017.
select m.movie_name from movies m join bookings b on m.movie_id=b.movie_id
 where month(b.booking_date)=7 and year(b.booking_date)=2017;

-- 29 Count how many bookings each movie received.
select *from bookings;
select *from movies;
select m.movie_name ,count(b.booking_id) as count_of_bookings from movies m join bookings b on m.movie_id=b.movie_id group by m.movie_name;
 
-- 30 Find the movie with the highest rating.
select *from movies;
select *from movies order by rating desc;

-- 🔵 SECTION D — SUBQUERY PRACTICE QUESTIONS

-- (Nested SELECT, advanced conditions)

-- 31 Find movies with rating higher than the average rating.
select *from movies;
select *from movies where rating >(select avg(rating) from movies);
-- 32 Retrieve customers who booked the most expensive ticket type.
select *from customers;
select *from bookings;
select c.*,b.cost_of_ticket from customers c join bookings b on c.customer_id=b.customer_id order by b.cost_of_ticket desc limit 1;

-- 33 Display movies that have less duration than the average duration.
select *from movies;
select *from movies where duration<(select avg(duration) from movies);

-- 34 Show customers who never booked any movie.
select c.customer_name from customers c join bookings s on c.customer_id=s.customer_id where c.customer_id not in (select s.customer_id from bookings);

-- 35 Display all movies booked by the oldest customer.
select *from  movies;
select *from customers;
select *from bookings;
select m.movie_name,c.customer_age from movies m join bookings b on m.movie_id=b.movie_id join customers c on c.customer_id=b.customer_id order by c.customer_age desc;

-- 36 Find the customer who made the highest number of bookings.
select *from customers;
select *from bookings;
select c.customer_name,count(b.booking_id) as number_of_bookings from customers c join bookings b on c.customer_id=b.customer_id group by c.customer_name order by count(b.booking_id)  desc;

-- 37 Display movie names whose movie_id appears in Bookings table.
select *from movies;
select movie_name from movies where movie_id in (select movie_id from bookings);

-- 38 List customers who booked movies with rating = 5.
select *from customers;
select c.* from customers c join bookings b on c.customer_id=b.customer_id join movies m on m.movie_id=b.movie_id where m.rating=5;

-- 39 Find the second highest rating among all movies.
select *from movies;
select  distinct *from movies order by rating desc  limit 1 offset 1;

-- 40  Retrieve the latest movie released.
select *from movies;
select *from movies order by release_date desc ;

-- 🔵 SECTION E — ADVANCED SQL (JOIN + GROUP + AGGREGATE)

-- 41 Show the total tickets booked for each category (Drama, Comedy, etc.).
select m.category,sum(no_of_tickets) as total_tickets_booked  from movies m join bookings b group by m.category ;

-- 42 Show the total revenue per category.
select m.category,sum(no_of_tickets*cost_of_ticket) as total_revenue  from movies m join bookings b group by m.category ;

-- 43 Display customer_name, movie_name, and total amount spent.
select c.customer_name,m.movie_name,(b.no_of_tickets * b.cost_of_ticket) AS total_amount_spent
 from customers c join bookings b on c.customer_id=b.customer_id join movies m on m.movie_id=b.movie_id ;
 
-- 44 List categories sorted by average rating (descending).
select category ,round(avg(rating),2) as average_rating from movies  group by category order  by avg(rating) desc;

-- 45 Display all movies and the number of times each was booked.
select m.movie_name ,count(b.booking_id) as booked from movies m join bookings b on m.movie_id=b.movie_id group by m.movie_name;

-- 46 Show customers who have booked more than 20 tickets in total.
select c.customer_name ,sum(no_of_tickets) as tickets_booked from customers c join bookings b on c.customer_id=b.customer_id group by c.customer_name having sum(no_of_tickets) >20;

-- 47 Find the top 3 movies by revenue.
select m.movie_name,sum(b.cost_of_ticket*b.no_of_tickets) as total_revenue from movies m join bookings b on  m.movie_id=b.movie_id group by m.movie_name order by sum(b.cost_of_ticket*b.no_of_tickets) desc limit 3;

-- 48 Show the least booked movie.
select m.movie_name,sum(b.no_of_tickets) as total_booked from movies m join bookings b on  m.movie_id=b.movie_id group by m.movie_name order by sum(b.no_of_tickets) asc limit 1;

-- 49 Display the most active customer (highest tickets).
select c.customer_name,sum(b.no_of_tickets) as total_booked from customers c  join bookings b on  c.customer_id=b.customer_id group by c.customer_name order by sum(b.no_of_tickets) desc limit 1;

-- 50 Show revenue month-wise for 2017.
select *from bookings;
select monthname(booking_date) as month ,sum(no_of_tickets*cost_of_ticket) as total_revenue from bookings where year(booking_date)="2017" group by monthname(booking_date)  order by monthname(booking_date)  asc;

-- 🔵 SECTION F — WINDOW FUNCTION QUESTIONS

-- (ROW_NUMBER, RANK, DENSE_RANK, OVER)

-- 51 Assign row numbers to movies based on rating (DESC).
select *from movies;
select distinct movie_id, movie_name,rating,
row_number() over(order by rating desc) as rating_movie
from movies;

-- 52 Rank customers by total tickets booked.
select *from customers;
select *from bookings;
select c.customer_name,sum(b.no_of_tickets) as total_tickets_booked ,
rank() over(order by sum(b.no_of_tickets) ) as rank_customer
from customers c join bookings b on c.customer_id=b.customer_id group by c.customer_name;

-- 53 Rank movies by duration.
select *from movies;
select movie_name,duration,rank() over(order by duration) as rank_duration from movies;

-- 54 Use DENSE_RANK to show top-rated movies.
select *from movies;
select movie_name,rating, 
dense_rank() over(order by rating desc) as top_rated_movies
from movies;

-- 55 Show bookings ordered by booking_date with row_number().
select *from bookings;
select booking_date,count(booking_id),
row_number() over(partition by booking_date order by count(booking_id) ) as rank_booking_date
from bookings group by booking_date;

-- 56 Partition customers by gender and rank them by age.
select *from customers;
select customer_name,gender,customer_age ,
rank() over(partition by gender order by customer_age) as rank_age
from customers;

-- 57 Show movie revenue with a running total using SUM OVER().
SELECT
    m.movie_name,
    SUM(b.no_of_tickets * b.cost_of_ticket) AS movie_revenue,
    SUM(SUM(b.no_of_tickets * b.cost_of_ticket)) 
        OVER (ORDER BY m.movie_name) AS running_total_revenue
FROM bookings b
JOIN movies m 
    ON b.movie_id = m.movie_id
GROUP BY m.movie_id, m.movie_name
ORDER BY m.movie_name;

select *from movies;
select *from bookings;

select m.movie_name,sum(b.no_of_tickets*b.cost_of_ticket) as movie_revenue,
sum(sum(b.no_of_tickets*b.cost_of_ticket)) over (order by m.movie_name ) as running_total
from movies m join bookings b on m.movie_id=b.movie_id
group by movie_name;

-- 58 Rank movie categories by average rating.
select *from movies;
select category ,avg(rating) as avg_rating ,
rank() over( order by avg(rating)) as rank_avg_rating
from movies group by category;

-- 59 Calculate cumulative tickets sold across all bookings.
select booking_id,no_of_tickets,
sum(no_of_tickets) over(order by booking_id) as cumulative_tickets_sold
from bookings;

-- 60 Show bookings for each movie ranked by booking_date.
SELECT 
    movie_id,
    booking_date,
    ROW_NUMBER() OVER (
        PARTITION BY movie_id
        ORDER BY booking_date
    ) AS booking_rank
FROM bookings;

-- 🔵 SECTION G — ADVANCED SQL (VIEWS, FUNCTIONS, PROCEDURES)

-- 61 Create a View showing:
-- movie_name
-- total_tickets_sold
-- total_revenue

CREATE VIEW movie_report AS
SELECT 
    m.movie_name,
    SUM(b.no_of_tickets) AS total_tickets_sold,
    SUM(b.no_of_tickets * b.cost_of_ticket) AS total_revenue
FROM bookings b
JOIN movies m 
    ON b.movie_id = m.movie_id
GROUP BY m.movie_id, m.movie_name;

select *from movie_report;

-- 62 Create a View of customers who booked more than 10 tickets.
create view customer_report2 as 
select c.customer_name ,sum(no_of_tickets) as total_ticket_booked from
customers c join bookings b on c.customer_id=b.customer_id 
group by c.customer_name
having sum(no_of_tickets) > 10 ;

select *from customer_report2;

-- 63 Write a stored procedure to return all bookings for a given customer_id.
DELIMITER $$

CREATE PROCEDURE get_customer_bookings(IN cid INT)
BEGIN
    SELECT *
    FROM bookings
    WHERE customer_id = cid;
END $$

DELIMITER ;



-- 64 Create a stored function to return movie rating status:
-- ≥4.5 = Excellent
-- 4–4.4 = Good
-- 3–3.9 = Average
-- <3 = Poor
 DELIMITER $$

CREATE FUNCTION rating_status(r FLOAT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF r >= 4.5 THEN RETURN 'Excellent';
    ELSEIF r >= 4 THEN RETURN 'Good';
    ELSEIF r >= 3 THEN RETURN 'Average';
    ELSE RETURN 'Poor';
    END IF;
END $$

DELIMITER ;

-- 65 Create a trigger that logs when a new booking is inserted.
 CREATE TABLE booking_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER log_new_booking
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
    INSERT INTO booking_log (booking_id) 
    VALUES (NEW.booking_id);
END $$

DELIMITER ;

 
-- 🔵 SECTION H — VERY ADVANCED, CASE-BASED QUESTIONS

-- (Real exam-style SQL problems)

-- 66 Prepare a full revenue report showing:
-- movie_name
-- total bookings
-- total tickets
-- total revenue
-- highest customer (by tickets)
SELECT
    m.movie_name,
    COUNT(b.booking_id) AS total_bookings,
    SUM(b.no_of_tickets) AS total_tickets,
    SUM(b.no_of_tickets * b.cost_of_ticket) AS total_revenue,
    (
        SELECT c.customer_name
        FROM bookings b2
        JOIN customers c ON b2.customer_id = c.customer_id
        WHERE b2.movie_id = m.movie_id
        ORDER BY b2.no_of_tickets DESC
        LIMIT 1
    ) AS highest_customer
FROM movies m
LEFT JOIN bookings b 
    ON m.movie_id = b.movie_id
GROUP BY m.movie_id;

-- 67 Find the customer who spent the most money in total.
SELECT 
    c.customer_name,
    SUM(b.no_of_tickets * b.cost_of_ticket) AS total_spent
FROM customers c
JOIN bookings b 
    ON c.customer_id = b.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- 68 Identify peak booking time (which hour has most bookings).
SELECT 
    HOUR(TIME(b.timings)) AS booking_hour,
    COUNT(*) AS total_bookings
FROM bookings b
GROUP BY HOUR(TIME(b.timings))
ORDER BY total_bookings DESC
LIMIT 1;

-- 69 Find which movie category generates the most revenue.
SELECT
    m.category,
    SUM(b.no_of_tickets * b.cost_of_ticket) AS total_revenue
FROM bookings b
JOIN movies m 
    ON b.movie_id = m.movie_id
GROUP BY m.category
ORDER BY total_revenue DESC
LIMIT 1;

-- 70 Generate a summary:
-- total customers
-- total movies
-- total bookings
-- avg ticket cost
-- avg rating

SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM movies) AS total_movies,
    (SELECT COUNT(*) FROM bookings) AS total_bookings,
    (SELECT AVG(cost_of_ticket) FROM bookings) AS avg_ticket_cost,
    (SELECT AVG(rating) FROM movies) AS avg_movie_rating;
