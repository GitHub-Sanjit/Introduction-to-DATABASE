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