/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select *
from products p 
left join categories c 
on c.CategoryID = p.CategoryID
where c.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.Name, products.Price, reviews.Rating
from products 
left join reviews 
on products.ProductID = reviews.ProductID
where reviews.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.Firstname, employees.lastname, employees.EmployeeID, sum(sales.quantity) as "total"
from sales
left join employees
on employees.EmployeeID = sales.EmployeeID
group by EmployeeID
order by total desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.name as "Department Name", categories.name as "Categories Name"
from departments
inner join categories
on categories.DepartmentID = departments.DepartmentID
where categories.name = "Appliances" or categories.name = "games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select products.name as "Product", count(sales.Quantity) as "Units Sold", sum(sales.PricePerUnit * sales.quantity) as "Total Revenue"
 from products
 inner join sales
 on products.ProductID = sales.ProductID 
 where sales.ProductID = 97; 
 
 select * from sales where productid = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.name, reviews.reviewer, reviews.Rating, reviews.comment
from reviews
inner join products
on products.productid = reviews.ProductID
where reviews.ProductID = 857 and reviews.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sum(sales.Quantity) as Sold
from sales
inner join employees on employees.EmployeeID = sales.EmployeeID
inner join products on products.ProductID = sales.ProductID
group by employees.EmployeeID, products.ProductID


