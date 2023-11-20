SELECT 
	first_name,
	last_name
FROM
	sales.customers;

SELECT
	first_name,
	last_name,
	email
FROM
	sales.customers;

select * from sales.customers;

select * from sales.customers where state='CA';

SELECT * FROM sales.customers where state='CA' order by first_name;

select city, count(*) AS ca_customers_count from sales.customers where state='CA' group by city order by city;

select city, count(*) AS ca_10_plus_customers_count from sales.customers where state='CA' group by city having count(*) > 10 order by city;

select first_name, last_name from sales.customers order by first_name;

select first_name, last_name from sales.customers order by first_name desc;

select city, first_name, last_name from sales.customers order by city, first_name;

select city, first_name, last_name from sales.customers order by city desc, first_name asc;

select city, first_name, last_name from sales.customers order by state;

select first_name, last_name from sales.customers order by LEN(first_name) desc;

select first_name, last_name from sales.customers order by 1, 2;

select product_name, list_price from production.products order by list_price, product_name;

select product_name, list_price from production.products order by list_price, product_name offset 10 rows;

select product_name, list_price from production.products order by list_price, product_name offset 10 rows fetch next 10 rows only;

select product_name, list_price from production.products order by list_price desc, product_name offset 0 rows fetch first 10 rows only;

select top 10 product_name, list_price from production.products order by list_price desc;

select top 1 percent product_name, list_price from production.products order by list_price desc;

select top 3 with ties product_name, list_price from production.products order by list_price desc;

select city from sales.customers order by city;

select distinct city from sales.customers order by city;

select city, state from sales.customers order by city, state;

select distinct city, state from sales.customers;

select distinct phone from sales.customers order by phone;

select city, state, zip_code from sales.customers group by city, state, zip_code order by city, state, zip_code;

select distinct city, state, zip_code from sales.customers;

select product_id, product_name, category_id, model_year, list_price from production.products where category_id = 1 order by list_price desc;

select product_id, product_name, category_id, model_year, list_price from production.products where category_id = 1 and model_year = 2018 order by list_price desc;

select product_id, product_name, category_id, model_year, list_price from production.products where list_price > 300 and model_year = 2018 order by list_price desc;

select product_id, product_name, category_id, model_year, list_price from production.products where list_price > 300 or model_year = 2018 order by list_price desc;

select product_id, product_name, category_id, model_year, list_price from production.products where list_price between 1899.00 and 1999.99 order by list_price desc;

select product_id, product_name, category_id, model_year, list_price from production.products where list_price IN (299.99, 369.99, 489.99) order by list_price desc;

select product_id, product_name, category_id, model_year, list_price from production.products where product_name like '%Cruiser%' order by list_price;

select customer_id, first_name, last_name, phone from sales.customers where phone=NULL order by first_name, last_name;

select customer_id, first_name, last_name, phone from sales.customers where phone is null order by first_name, last_name;

select customer_id, first_name, last_name, phone from sales.customers where phone is not null order by first_name, last_name;

select * from production.products where category_id = 1 and list_price > 400 order by list_price desc;

select * from production.products where category_id = 1 and list_price > 400 and brand_id = 1 order by list_price desc;

select * from production.products where brand_id = 1 or brand_id = 2 and list_price > 1000 order by brand_id desc;

select * from production.products where (brand_id = 1 or brand_id = 2) and list_price > 1000 order by brand_id desc;

-- OR

select product_name, list_price from production.products where list_price < 200 or list_price > 6000 order by list_price;

select product_name, brand_id from production.products where brand_id = 1 or brand_id = 2 or brand_id = 4 order by brand_id desc;

select product_name, brand_id from production.products where brand_id in (1, 2, 3) order by brand_id desc;

select product_name, brand_id, list_price from production.products where brand_id = 1 or brand_id = 2 and list_price > 500 order by brand_id desc, list_price;

select product_name, brand_id, list_price from production.products where (brand_id = 1 or brand_id = 2) and list_price > 500 order by brand_id desc, list_price;

-- IN

select product_name, list_price from production.products where list_price in (89.99, 109.99, 159.99) order by list_price;

select product_name, list_price from production.products where list_price = 89.99 or list_price = 109.99 or list_price = 159.99 order by list_price;

select product_name, list_price from production.products where list_price not in (89.99, 109.99, 159.99) order by list_price;

select product_id from production.stocks where store_id = 1 and quantity >= 30;

select product_name, list_price from production.products where product_id IN ( select product_id from production.stocks where store_id = 1 and quantity >= 30) order by product_name;

-- between

select product_id, product_name, list_price from production.products where list_price between 149.99 and 199.99 order by list_price;

select product_id, product_name, list_price from production.products where list_price not between 149.99 and 199.99 order by list_price;

select order_id, customer_id, order_date, order_status from sales.orders where order_date between '20170115' and '20170117' order by order_date;

-- like

select customer_id, first_name, last_name from sales.customers where last_name like 'z%' order by first_name;

select customer_id, first_name, last_name from sales.customers where last_name like '%er' order by first_name;

select customer_id, first_name, last_name from sales.customers where last_name like 't%s' order by first_name;

select customer_id, first_name, last_name from sales.customers where last_name like '_u%' order by first_name;

select customer_id, first_name, last_name from sales.customers where last_name like '[YZ]%' order by last_name;

select customer_id, first_name, last_name from sales.customers where last_name like '[A-C]%' order by first_name;

select customer_id, first_name, last_name from sales.customers where last_name like '[^A-X]%' order by last_name;

select customer_id, first_name, last_name from sales.customers where first_name not like 'A%' order by first_name;

CREATE TABLE sales.feedbacks(
	feedback_id INT IDENTITY(1,1) PRIMARY KEY,
	comment varchar(255) NOT NULL
);

INSERT INTO sales.feedbacks(comment)
VALUES ('Can you give me 30% discount?'),
	('May I get me 30USD off?'),
	('Is this having 20% discount today?');

select * from sales.feedbacks;

select feedback_id, comment from sales.feedbacks where comment like '%30%';

select feedback_id, comment from sales.feedbacks where comment like '%30!%%' escape '!';

-- aliases

select first_name, last_name  from sales.customers order by first_name;

select first_name + ' ' + last_name from sales.customers order by first_name;

select first_name + ' ' + last_name as full_name from sales.customers order by first_name;

select first_name + ' ' + last_name as 'Full Name' from sales.customers order by first_name;

select category_name 'Product Category' from production.categories;

select category_name 'Product Category' from production.categories order by category_name;

select category_name 'Product Category' from production.categories order by 'Product Category';

select sales.customers.customer_id, first_name, last_name, order_id from sales.customers inner join sales.orders on sales.orders.customer_id = sales.customers.customer_id;

select c.customer_id, first_name, last_name, order_id from sales.customers c inner join sales.orders o on o.customer_id = c.customer_id;

-- joins

CREATE SCHEMA hr;
GO

CREATE TABLE hr.candidates (
	id int primary key identity,
	fullname varchar(100) not null
);

create table hr.employees (
	id int primary key identity,
	fullname varchar(100) not null
);

insert into hr.candidates(fullname) 
values ('John Doe'),
	('Lily Bush'),
	('Peter Drucker'),
	('Jane Doe');

insert into hr.employees(fullname)
values ('John Doe'),
	('Jane Doe'),
	('Michael Scott'),
	('Jack Sparrow');

select c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name from hr.candidates c inner join hr.employees e on e.fullname = c.fullname;

select c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name from hr.candidates c left join hr.employees e on e.fullname = c.fullname;

select c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name from hr.candidates c left join hr.employees e on e.fullname = c.fullname where e.id is null;

select c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name from hr.candidates c right join hr.employees e on e.fullname = c.fullname;

select c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name from hr.candidates c right join hr.employees e on e.fullname = c.fullname where c.id is null;

select c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name from hr.candidates c full join hr.employees e on e.fullname = c.fullname;

select c.id candidate_id, c.fullname candidate_name, e.id employee_id, e.fullname employee_name from hr.candidates c full join hr.employees e on e.fullname = c.fullname where c.id is null or e.id is null;

select product_name, list_price, category_id from production.products order by product_name desc;

select product_name, list_price, category_name, p.category_id from production.products p inner join production.categories c on c.category_id = p.category_id order by product_name desc;

select product_name, category_name, brand_name, list_price from production.products p inner join production.categories c on c.category_id = p.category_id inner join production.brands b on b.brand_id = p.brand_id order by product_name desc;

select product_name, order_id from production.products p left join sales.order_items o on o.product_id = p.product_id order by order_id;

select product_name, order_id from production.products p left join sales.order_items o on o.product_id = p.product_id where order_id is null;

select p.product_name, o.order_id, i.item_id, o.order_date from production.products p left join sales.order_items i on i.product_id = p.product_id left join sales.orders o on o.order_id = i.order_id order by order_id;

select product_name, order_id from production.products p left join sales.order_items o on o.product_id = p.product_id where order_id = 100 order by order_id;

select p.product_id, product_name, order_id from production.products p left join sales.order_items o on o.product_id = p.product_id and o.order_id = 100 order by order_id desc;

select product_name, order_id from sales.order_items o right join production.products p on o.product_id = p.product_id order by order_id;

select product_name, order_id from sales.order_items o right join production.products p on o.product_id = p.product_id where order_id is null order by product_name;

CREATE SCHEMA pm;
GO

CREATE TABLE pm.projects ( 
	id INT PRIMARY KEY IDENTITY,
	title VARCHAR(255) NOT NULL
);

CREATE TABLE pm.members (
	id int primary key identity,
	name varchar(120) not null,
	project_id int,
	foreign key (project_id) references pm.projects(id)
);

insert into pm.projects(title) values ('New CRM for Project Sales'),
 ('ERP Implementation'),
 ('Develop Mobile Sales Platform');

 insert into pm.members(name, project_id) values ('John Doe', 1),
	('Lily Bush', 1),
	('Jane Doe', 2),
	('Jack Daniel', null);

select * from pm.projects;

select * from pm.members;

select m.name member, p.title project from pm.members m full outer join pm.projects p on p.id = m.project_id;

select m.name member, p.title project from pm.members m full outer join pm.projects p on p.id = m.project_id where m.id is null or p.id is null;

select product_id, product_name, store_id, 0 AS quantity from production.products cross join sales.stores order by product_name, store_id;

select s.store_id, p.product_id, ISNULL(sales, 0) sales
from sales.stores s
cross join production.products p
left join ( select s.store_id, p.product_id, sum(quantity * i.list_price) sales from sales.orders o 
			inner join sales.order_items i on i.order_id = o.order_id
			inner join sales.stores s on s.store_id = o.store_id
			inner join production.products p on p.product_id = i.product_id
			group by s.store_id, p.product_id) c on c.store_id = s.store_id
and c.product_id = p.product_id
where sales is null
order by product_id, store_id;

select e.first_name + ' ' + e.last_name employee, m.first_name + ' ' + m.last_name manager
from sales.staffs e inner join sales.staffs m on m.staff_id = e.manager_id order by manager;

select e.first_name + ' ' + e.last_name employee, m.first_name + ' ' + m.last_name manager from sales.staffs e 
left join sales.staffs m on m.staff_id = e.manager_id order by manager;

select c1.city, c1.first_name + ' ' + c1.last_name customer_1, c2.first_name + ' ' + c2.last_name customer_2
from sales.customers c1
inner join sales.customers c2 on c1.customer_id > c2.customer_id and c1.city = c2.city
order by city, customer_1, customer_2;

select c1.city, c1.first_name + ' ' + c1.last_name customer_1, c2.first_name + ' ' + c2.last_name customer_2
from sales.customers c1
inner join sales.customers c2 on c1.customer_id <> c2.customer_id and c1.city = c2.city
order by city, customer_1, customer_2;

select customer_id, first_name + ' ' + last_name c, city from sales.customers where	city = 'Albany' order by c;

select c1.city, c1.first_name + ' ' + c1.last_name customer_1, c2.first_name + ' ' + c2.last_name customer_2 
from sales.customers c1
inner join sales.customers c2 on c1.customer_id > c2.customer_id and c1.city = c2.city 
where c1.city = 'Albany'
order by c1.city, customer_1, customer_2;

select c1.city, c1.first_name + ' ' + c1.last_name customer_1, c2.first_name + ' ' + c2.last_name customer_2
from sales.customers c1
inner join sales.customers c2 on c1.customer_id <> c2.customer_id and c1.city = c2.city
where c1.city = 'Albany'
order by c1.city, customer_1, customer_2

select customer_id, year(order_date) order_year from sales.orders where customer_id in (1,2) order by customer_id;

select customer_id, year(order_date) order_year from sales.orders where customer_id in (1,2) group by customer_id, year (order_date) order by customer_id;

select distinct customer_id, year(order_date) order_year from sales.orders where customer_id in (1,2) order by customer_id;

select customer_id, year(order_date) order_year, count(order_id) order_placed 
from sales.orders
where customer_id in (1,2) group by customer_id, year(order_date) order by customer_id;

select customer_id, year(order_date) order_year, order_status 
from sales.orders 
where customer_id in (1,2) 
group by customer_id, year(order_date), order_status
order by customer_id;

select city, count(customer_id) customer_count from sales.customers group by city order by city;

select city, state, count(customer_id) customer_count from sales.customers group by city, state order by city, state;

select brand_name, min(list_price) min_price, max(list_price) max_price
from production.products p
inner join production.brands b on b.brand_id = p.brand_id
where model_year = 2018
group by brand_name
order by brand_name;

select brand_name, avg(list_price) avg_price
from production.products p
inner join production.brands b on b.brand_id = p.brand_id
where model_year = 2018
group by brand_name
order by brand_name;

select order_id, sum(quantity * list_price * (1 - discount)) net_value 
from sales.order_items
group by order_id;

