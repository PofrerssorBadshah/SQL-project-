-- Basic Question

1--Retrieve all books in the "Fiction" genre

Select * from books
WHERE genre = 'Fiction';

2))--Find books published after the year 1950
Select * from books
WHERE publised_year > 1950;

3)--List all customers from the Canada
Select * from customers
WHERE country = 'Canada';

4)--Show orders placed in November 2023
Select * from orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

5)--Retrieve the total stock of books available

Select SUM(stock) from books

6)--Find the details of the most expensive book
Select * from books order by price DESC limit 1;

7)--Show all customers who ordered more than 1 quantity of a book

Select * from orders
WHERE quantity > 1;

8)--Retrieve all orders where the total amount exceeds $20

Select * from orders
WHERE total_amount > 20;

9)--List all genres available in the Books table

Select DISTINCT genre from books; 

10)--Find the book with the lowest stock
SELECT *
FROM books
ORDER BY stock ASC
LIMIT 1;

11)--Calculate the total revenue generated from all orders

Select SUM(total_amount)
AS revanue from orders; 



-- Advance Question 

1) --Retrieve the total number of books sold for each genre
Select * from orders

Select b.genre, SUM(o.quantity) AS total_book_sold
From orders o
JOIN  books b ON o.book_id = b.book_id
GROUP  BY b.genre;

2) --Find the average price of books in the "Fantasy" genre
Select AVG(price) AS Avg_price
From books
WHERE genre =  'Fantasy';

3) --List customers who have placed at least 2 orders


SELECT o.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;

4) --Find the most frequently ordered genre
Select b.genre , COUNT(*) AS book_count
FROM orders o 
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre
ORDER BY book_count DESC
LIMIT 1;

5) --Show the top 3 most expensive books of 'Fantasy' Genre 

Select genre, price
from books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

6) --Retrieve the total quantity of books sold by each author

Select b.author,SUM(quantity) AS book_total
FROM orders o 
JOIN books b ON b.book_id = o.book_id
GROUP BY b.author;

7) --List the cities where customers who spent over $30 are located


Select c.city, o.total_amount
FROM customers c JOIN orders o 
ON c.customer_id = o.customer_id
WHERE total_amount > 30;

8) --Find the customer who spent the most on orders
Select * from customers
Select * from orders

Select c.customer_id, c.name , SUM(total_amount) AS total_spent 
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.name
ORDER BY total_spent DESC;


9) --Calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;




