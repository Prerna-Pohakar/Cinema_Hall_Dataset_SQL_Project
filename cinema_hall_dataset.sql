create database cinema;
use cinema;

create table movies( movie_id int ,	movie_name	 varchar(50),release_date datetime,	category varchar(50),	rating float,	duration int);
create table customers(customer_id int,	customer_name varchar(50),	gender varchar(50),	contact_no int,	customer_age int);
create table bookings(booking_id int,customer_id	int,movie_id	int,booking_date datetime,	no_of_tickets	int,timings time,	cost_of_ticket int);

 show tables;
 
insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(1	,"Der müde Tod",	"2017-06-09",	"Thriller",	3.2	,97);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(2	,"A Matter of Life and Death",	"2017-12-08",	"Fantasy"	,4.5,	104);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(3,	"The Nest of the Cuckoo Birds","2017-10-16",	"Drama",	5	,81);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(4,	"Against All Hope","2017-10-20","Fantasy",2.6,90);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(5,"Vaikai is Amerikos viesbucio","2017-03-09","Drama",1.9,88);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(6,"Leila","2017-12-06","Comedy",4.4,102);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(7,"Cook Off!","2017-11-17","Comedy",	3.4,98);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(8,"Crazy","2017-01-19","Drama",1.6,106);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(9,"Emilio","2017-02-17","Drama",5,102);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(10,"Fast Girl","2017-01-01","Drama",	5,95);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(11,"Road to Hell","2017-01-27","Horror",2.5,87);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(12,"SEAL Team VI","2017-01-12","Horror",4.2,99);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(13,"Boogie Woogie","2017-09-29","Horror",4.7,94);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(14,"Polytechnique","2017-01-14","Drama",3.6,77);

insert into  movies( movie_id	,movie_name ,	release_date	,category	,rating	, duration)
values(15,"Zadboom","2017-08-09","Comedy",3.5,111);
select *from movies;

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(7,"Marlene Dietrich","Female",68979,78);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(6,"Jamie Lee Curtis","Male",78979,67);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(10,"Charlize Theron","Female",67989,67);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(14,"Christian Bale","Male",23412,60);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(9,"Margaux Hemingway","Male",58763,58);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(2,"Kenneth Branagh","Female",79808,56);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(3,"Richard Burton","Male",26897,55);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(15,"Stanley Kubrick","Male",34567,50);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(8,"Gary Oldman","Male",68799,48);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(5,"Olivia de Havilland","Female",62786,44);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(13,"Alfred Hitchcock",	"Male",23456,38);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(1,"Lauren Bacall","Female",53782,34);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(4,"Steve Buscemi",	"Male",	67699,	23);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(12,"Denzel Washington","Female",	45678,	22);

insert into  customers(customer_id,customer_name,gender,contact_no,customer_age)
values(11,"Charlton Heston","Male",	78900,	12);
select *from customers;

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(2, 6, 9, '2017-09-29', 4, '18:30:00', 200);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(9, 7, 14, '2017-07-28', 10, '01:00:00', 400);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(13, 12, 8, '2017-11-23', 13, '20:20:20', 200);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(18, 1, 13, '2017-08-21', 4, '18:18:18', 400);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(6, 2, 10, '2017-03-21', 2, '22:00:00', 100);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(1, 5, 8, '2017-02-21', 2, '19:56:57', 300);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(5, 10, 11, '2017-04-16', 6, '21:00:00', 400);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(17, 2, 11, '2017-12-15', 7, '23:56:56', 300);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(11, 5, 6, '2017-09-15', 9, '13:06:00', 200);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(21, 11, 9, '2017-02-15', 12, '22:15:00', 250);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(4, 14, 1, '2017-06-11', 5, '20:00:00', 500);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(12, 13, 7, '2017-01-10', 11, '03:50:56', 200);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(23, 9, 12, '2017-10-08', 1, '16:30:00', 450);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(3, 15, 2, '2017-07-08', 1, '15:00:00', 100);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(19, 13, 2, '2017-06-08', 3, '19:19:00', 100);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(16, 3, 10, '2017-04-05', 6, '21:56:56', 500);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(20, 10, 8, '2017-11-04', 9, '11:11:00', 300);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(25, 10, 8, '2017-02-04', 13, '13:07:00', 150);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(14, 11, 2, '2017-11-01', 2, '04:05:56', 400);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(7, 8, 12, '2017-10-01', 3, '23:45:00', 200);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(8, 9, 13, '2017-07-01', 4, '00:47:00', 300);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(10, 6, 15, '2017-06-01', 8, '18:12:00', 500);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(22, 6, 14, '2017-02-01', 1, '18:14:00', 350);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(15, 4, 1, '2017-01-01', 4, '20:56:56', 300);

INSERT INTO bookings (booking_id, customer_id, movie_id, booking_date, no_of_tickets, timings, cost_of_ticket) VALUES
(24, 11, 7, '2017-01-01', 10, '14:12:00', 450);
select *from bookings;



show tables;
select *from movies;
select *from bookings;
select *from customers;
