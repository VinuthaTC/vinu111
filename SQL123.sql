CREATE SCHEMA company;
SET search_path TO company;
CREATE TABLE EMPLOYEE (
	EMPLOYEE_ID INT,
	NAME CHAR(20), 
	SALARY INT 
);

INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(103,'Den',11000);


SELECT * FROM EMPLOYEE;

--1. How to select UNIQUE records from a table using a SQL Query?
SELECT DISTINCT EMPLOYEE_ID FROM EMPLOYEE;

--2. How to delete DUPLICATE records from a table using a SQL Query?
select NAME, EMPLOYEE_ID,count(*) 
from EMPLOYEE
group by NAME, EMPLOYEE_ID
having count(*)>1


--3. How to read TOP 5 records from a table using a SQL query?
select *
from EMPLOYEE LIMIT 5;

--4. How to read LAST 5 records from a table using a SQL query?

SELECT * FROM EMPLOYEE ORDER BY EMPLOYEE_ID DESC LIMIT 5;

--5. What is the result of Normal Join, Left Outer Join, Right Outer Join and Full Outer Join between the tables A & B?

NORMAL JOIN(INNER): Returns all mathched record from  left or right table
LEFT (OUTER) JOIN : Returns all records from the left table, and the matched records from the right table.
RIGHT (OUTER) JOIN : Returns all records from the right table, and the matched records from the left table. 
FULL (OUTER) JOIN : Returns all records when there is a match in either left or right table


--6. How to find the employee with second MAX Salary using a SQL query?
 
SELECT * FROM
(SELECT NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY)AS DENSE_RANK FROM EMPLOYEE) AS T
WHERE T.DENSE_RANK = 2;

--7. How to find the employee with third MAX Salary using a SQL query without using Analytic Functions?
SELECT * FROM
(SELECT NAME SALARY, DENSE_RANK() OVER(ORDER BY SALARY)AS DENSE_RANK FROM EMPLOYEE) AS T
WHERE T.DENSE_RANK = 3;
