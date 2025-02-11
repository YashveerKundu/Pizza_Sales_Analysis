create database pizza_sales

select * from [pizza_sales].[dbo].[pizza_sales]

#1 .Total_Orders_Placed

select count(pizza_id) as total_orders_placed from [pizza_sales].[dbo].[pizza_sales]

#2  Total Orders Placed  in  January 2024:

select count(*) as total_orders from [pizza_sales].[dbo].[pizza_sales]
where order_date between '2015-01-01' and '2024-01-01';

#3 orders_placed_on_specific_date

select count(*) as orders_placed_on_specific_date from [pizza_sales].[dbo].[pizza_sales]
where order_date ='2015-01-01';

#4 pizza_size_available

SELECT DISTINCT pizza_size FROM [pizza_sales].[dbo].[pizza_sales];

#5 Pizza Divided According To category

select pizza_category,
COUNT(*) as pizza_category from [pizza_sales].[dbo].[pizza_sales]
group by pizza_category

#6 Total revenue generated from pizza sales:

select sum(total_price) as total_revenue_generated from [pizza_sales].[dbo].[pizza_sales];

#7 Most 3  popular pizza (ordered the most times):

SELECT top 3  pizza_name, 
sum(quantity) AS mostOrdered FROM [pizza_sales].[dbo].[pizza_sales]
GROUP BY pizza_name 
ORDER BY mostOrdered DESC; 

#8  Total sales by each pizza category:

select pizza_category,
sum(total_price) as total_sale_by_each_pizza from [pizza_sales].[dbo].[pizza_sales]
group by pizza_category
order by total_sale_by_each_pizza desc;

#9  average order value:

SELECT AVG(total_price) AS AvgOrderValue FROM [pizza_sales].[dbo].[pizza_sales];

#10 Daily revenue for the last 7 days:

select order_date,
sum(total_price) as daily_revenue from [pizza_sales].[dbo].[pizza_sales]
where order_date >= DATEADD(DAY,-7,GETDATE())
group by order_date


#11 Orders where more than 3 pizzas were bought:

SELECT * FROM [pizza_sales].[dbo].[pizza_sales] WHERE quantity > 3;

#12 Most Sold Pizza According to Name

select top 3 pizza_name,
count(quantity) as more_than_3_pizza_bought from [pizza_sales].[dbo].[pizza_sales]

group by pizza_name 

order by more_than_3_pizza_bought desc;

(OR)

SELECT pizza_name, SUM(quantity) AS TotalSold, 
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS Rank 
FROM [pizza_sales].[dbo].[pizza_sales]

GROUP BY pizza_name 
ORDER BY TotalSold DESC 
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


# 13 cumulative revenue generated over time:


SELECT order_date, total_price, 
       SUM(total_price) OVER (ORDER BY order_date) AS CumulativeRevenue
FROM [pizza_sales].[dbo].[pizza_sales]

# 14  most expensive pizza ordered:


select top 1 pizza_name, unit_price

 from [pizza_sales].[dbo].[pizza_sales]


order by unit_price desc;

#15 most ordered pizza on weekends:

select top 5  pizza_name,

count(quantity) as total_orders

from [pizza_sales].[dbo].[pizza_sales]
where DATEPART(weekday,order_date) in (1,7)
group by pizza_name

order by total_orders desc;

#16   (busiest hour of the day):

select DATEPART(HOUR,order_time) as order_hour,

count(*) as total_orders

from [pizza_sales].[dbo].[pizza_sales]
group by DATEPART(HOUR,order_time)
order by total_orders desc;


#17 month with the highest revenue:

select  datepart (month ,order_date) as month_name,
sum(total_price) as highest_revenue
from [pizza_sales].[dbo].[pizza_sales]
group by datepart (month ,order_date)
order by  highest_revenue  desc;

#18 first and last order placed each day:

SELECT order_date, pizza_name,
       MIN(order_time) AS FirstOrderTime, 
       MAX(order_time) AS LastOrderTime 
FROM [pizza_sales].[dbo].[pizza_sales]
GROUP BY order_date, pizza_name;





























































 