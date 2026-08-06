# Day22 - CTE (Common Table Expression)



> 📅 Date: 2026-08-06



## 📖 Overview



Today I learned **CTE (Common Table Expression)**, a SQL feature that improves query readability by defining temporary result sets.



CTEs are especially useful when working with complex queries that contain multiple aggregation steps or nested subqueries.



---



## 📚 What I Learned



### What is a CTE?



A CTE is a temporary named result set created using the `WITH` keyword.



Instead of writing long nested subqueries, a CTE allows queries to be separated into logical steps, making them easier to read and maintain.



Basic syntax:



```sql

WITH cte_name AS

(

&#x20;   SELECT ...

)



SELECT *

FROM cte_name;

```



---



## 💻 Practice



### Example 1. Create a CTE for average salary



```sql

WITH avg_salary AS

(

&#x20;   SELECT AVG(salary) AS avg_salary

&#x20;   FROM employees

)



SELECT *

FROM avg_salary;

```



---



### Example 2. Find employees earning above the average salary



```sql

WITH avg_salary AS

(

&#x20;   SELECT AVG(salary) AS avg_sal

&#x20;   FROM employees

)



SELECT

&#x20;   name,

&#x20;   salary

FROM employees,

&#x20;    avg_salary

WHERE salary > avg_sal;

```



---



### Example 3. Employees with salary greater than or equal to 5,000



```sql

WITH high_salary AS

(

&#x20;   SELECT

&#x20;       name,

&#x20;       salary

&#x20;   FROM employees

&#x20;   WHERE salary >= 5000

)



SELECT *

FROM high_salary;

```



---



## 💼 Practical Use Case



In marketing data analysis, CTEs are useful for creating intermediate datasets before performing additional analysis.



Example workflow:



- Calculate campaign performance

- Filter high-performing campaigns

- Join with another dataset for reporting



Using CTEs makes each step easier to understand and maintain.



---



## ✅ Key Takeaways



- Learned how to create a CTE using the `WITH` keyword.

- Understood that CTEs improve query readability.

- Practiced replacing nested subqueries with CTEs.

- Learned that CTEs exist only during query execution and are not permanently stored.



---



## 📌 Keywords



`SQL` `CTE` `WITH` `Subquery` `Query Readability`

