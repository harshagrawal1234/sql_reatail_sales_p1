select * from retail_sales
--Q1.
select * from retail_sales 
where sale_date = '2022-11-05'

--Q2.
select * from retail_sales
where category = 'Clothing' 
and 
to_char(sale_date, 'YYYY-MM') = '2022-11'

--Q3.
select category,sum(total_sale) as total_sales from retail_sales
group by category

--Q4.
select category, round(avg(age),2) from retail_sales 
where category = 'Beauty'
group by category

--Q5.
select * from retail_sales
where total_sale > 1000

--Q6.
select count(*) as transactions , gender, category from retail_sales
group by gender,category

--Q7.
select extract(year from sale_date) as year,extract(month from sale_date)as month, round(avg(total_sale),0) as sales from retail_sales
group by year,month
order by year,month

--Q8.
select customer_id,sum(total_sale) as sales from retail_sales
group by customer_id
order by sum(total_sale)  desc
limit 5

--Q9.
select count(distinct customer_id),category from retail_sales
group by category

--Q10.
select 
case 
when extract(hour from sale_time) <12 then 'Morning'
when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
else 'Evening'
end as shift,
count(*) as total_orders from retail_sales
group by shift
order by shift
