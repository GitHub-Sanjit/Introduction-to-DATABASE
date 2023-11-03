--your code goes here-- -- -- - --175. Combine Two Tables

    SELECT firstname,
    lastname, city, state FROM PERSON P LEFT JOIN ADDRESS AD ON P.personId = AD.personId

 --181. Employees Earning More Than Their Managers

 -- way 1 
 SELECT EMP.name AS Employee FROM Employee EMP,
  Employee MGR
  WHERE EMP.managerId = MGR.id AND EMP.salary > MGR.salary

                                                                                                                  -- way 2 SELECT E.name AS Employee
                                                                                                                      FROM EMPLOYEE E
                                                                                                                          INNER JOIN EMPLOYEE M ON E.managerId = M.id
                                                                                                                                                                     WHERE E.SALARY > M.SALARY;

 -- - --Duplicate
  -- Way 1 : Normal way
  SELECT Email-- COUNT(Email)
  FROM PERSON
    GROUP BY Email
       HAVING COUNT(Email) > 1 
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- - --183. Customers Who Never Order
                                                                                                                                         SELECT name AS Customers
                                                                                                                                             FROM CUSTOMERS
                                                                                                                                                 LEFT JOIN ORDERS
                                                                                                                                             ON CUSTOMERS.ID = ORDERS.CUSTOMERID
                                                                                                                                                                           WHERE ORDERS.CUSTOMERID IS NULL;


-- 196. Delete Duplicate emails
DELETE p2
FROM Person p1 JOIN person p2
ON p1.email = p2.email
AND p1.Id < p2.Id

-- 197. Rising Temperature
SELECT w2.id 
FROM Weather w1 
JOIN Weather w2
ON DATEDIFF(w1.recordDate,w2.recordDate)=-1
AND w2.temperature > w1.temperature


-- 577. Employee Bonus
SELECT name, bonus
FROM Employee LEFT JOIN Bonus
ON Employee.empId = Bonus.empId
Where bonus < 1000 OR bonus IS NULL


-- 584. Find Customer Referee.
SELECT name FROM Customer
Where ifnull(referee_id,1) <> 2;


-- 586. Customer Placing the Largest Number of Orders.
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1


-- 595. Big Countries
SELECT name,population,area
FROM World
WHERE area > 3000000 OR population > 25000000


-- 596. Classes More Than 5 Students
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(class) >= 5

-- 607. Sales Person
 WITH cte AS
 (SELECT sales_id FROM Orders o
 LEFT JOIN Company c
 ON o.com_id = c.com_id
 WHERE c.name LIKE 'RED'
 )

 SELECT name 
 FROM SalesPerson 
 WHERE sales_id NOT IN (
     SELECT DISTINCT sales_id 
     FROM cte
    );


-- 610. Triangle Judgement
SELECT x,y,z, 
IF(x + y > z AND x + z > y AND y + z > x,"Yes","No") 
AS triangle
FROM triangle;

-- 619. Biggest Single Number
WITH cte AS(
    SELECT num FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num)=1
)
SELECT 
    CASE
        WHEN COUNT(*) > 0 THEN MAX(num)
        ELSE NULL
    END AS num
FROM cte


-- 620. Not Boring Movies
SELECT * FROM Cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC


-- 627. Swap Salary
--1.
UPDATE Salary
SET sex = IF(sex = "m", "f", "m");
--2.
UPDATE Salary
SET sex = CASE
            WHEN sex = "m" THEN "f"
            Else "m"
          END


-- 1050. Actors and Directors Who Cooperated At Least Three Times
SELECT actor_id,director_id
FROM actorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;


-- 1068. Product Sales Analysis I
SELECT product_name,year,price
FROM Sales
JOIN Product
ON Sales.product_id = Product.product_id


-- 1075. Project Employees I
SELECT p.project_id,
ROUND(AVG(e.experience_years),2) AS average_years
FROM project p
LEFT JOIN employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id


-- 1084. Sales Analysis III.
SELECT Product.product_id, Product.product_name
FROM Product JOIN Sales
ON Product.product_id = Sales.product_id
GROUP BY product_id
HAVING MIN(sale_date) >= '2019-01-01' 
AND MAX(sale_date) <= '2019-03-31'


-- 511. Game Play Analysis I
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id


-- 1141. User Activity for the Past 30 Days I
SELECT activity_date AS day,
COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date 
BETWEEN DATE_ADD("2019-07-27", INTERVAL -29 DAY) 
AND '2019-07-27'
GROUP BY activity_date
------------
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
GROUP BY activity_date
HAVING(activity_date BETWEEN '2019-06-28' AND '2019-07-27')


-- 1148. Article Views I
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id


-- 1179. Reformat Department Table
SELECT id,
sum(IF(month='Jan',revenue,null)) as Jan_Revenue,
sum(IF(month='Feb',revenue,null)) as Feb_Revenue,
sum(IF(month='Mar',revenue,null)) as Mar_Revenue,
sum(IF(month='Apr',revenue,null)) as Apr_Revenue,
sum(IF(month='May',revenue,null)) as May_Revenue,
sum(IF(month='Jun',revenue,null)) as Jun_Revenue,
sum(IF(month='Jul',revenue,null)) as Jul_Revenue,
sum(IF(month='Aug',revenue,null)) as Aug_Revenue,
sum(IF(month='Sep',revenue,null)) as Sep_Revenue,
sum(IF(month='Oct',revenue,null)) as Oct_Revenue,
sum(IF(month='Nov',revenue,null)) as Nov_Revenue,
sum(IF(month='Dec',revenue,null)) as Dec_Revenue
from Department 
GROUP BY id;