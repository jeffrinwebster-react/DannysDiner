# Danny's Dinner

create database if not exists projects;
use projects;

# 1. What is the total amount each customer spent at the restaurant?

# on means different id
# using means same id

select customer_id,sum(price) as Total_Price from sales as s inner join menu as m using(product_id) group by customer_id;

# 2. How many days has each customer visited the restaurant?

select distinct order_date,customer_id,count(customer_id) as No_of_Times from sales group by customer_id ,order_date;

select customer_id,count(customer_id) as no_of_visits from (select distinct order_date,customer_id,count(customer_id) as No_of_Times from sales group by customer_id ,order_date) as t group by customer_id; 

# 3. What was the first item from the menu purchased by each customer?

select * from (
select *,
 row_number() over(partition by customer_id order by product_id) as drnk from sales s inner join menu m using(product_id)) as t where drnk =1;
 
 # 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
 
 

