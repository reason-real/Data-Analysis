\# Day07 - WHERE \& HAVING



> 📅 Study Date : 2026.07.16

>

> 📖 Topic : WHERE \& HAVING



\---



\# 📌 학습 목표



\- WHERE와 HAVING의 차이를 이해한다.

\- GROUP BY와 함께 HAVING을 사용할 수 있다.

\- SQL 실행 순서를 이해한다.



\---



\# 📚 핵심 문법



\## 1. WHERE



행(Row)을 먼저 필터링한다.



```sql

SELECT \*

FROM employees

WHERE salary >= 4000;

```



\---



\## 2. HAVING



GROUP BY 이후 그룹(Group)에 조건을 적용한다.



```sql

SELECT department,

&#x20;      AVG(salary) AS avg\_salary

FROM employees

GROUP BY department

HAVING AVG(salary) >= 4500;

```



\---



\## 3. WHERE + GROUP BY + HAVING



```sql

SELECT department,

&#x20;      AVG(salary) AS avg\_salary

FROM employees

WHERE salary >= 3500

GROUP BY department

HAVING AVG(salary) >= 5000;

```



\---



\# 💼 실무 예시



```sql

SELECT department,

&#x20;      COUNT(\*) AS employee\_count,

&#x20;      AVG(salary) AS avg\_salary

FROM employees

WHERE salary >= 3500

GROUP BY department

HAVING AVG(salary) >= 4500;

```



급여가 3,500 이상인 직원만 대상으로 부서별 인원 수와 평균 급여를 분석할 때 사용하는 대표적인 쿼리이다.



\---



\# 🎯 핵심 정리



\- WHERE는 행(Row)을 필터링한다.

\- HAVING은 그룹(Group)을 필터링한다.

\- HAVING은 GROUP BY와 함께 사용한다.

\- SQL 실행 순서를 이해하면 문법이 훨씬 쉬워진다.



\---



\# 🧠 오늘 배운 개념



\- WHERE

\- GROUP BY

\- HAVING

\- AVG()

\- COUNT()

\- SQL 실행 순서



\---



\# 📝 SQL 실행 순서



1\. FROM

2\. WHERE

3\. GROUP BY

4\. HAVING

5\. SELECT

6\. ORDER BY



\---



\# 🎯 한 줄 정리



> WHERE는 행을 걸러내고, HAVING은 GROUP BY로 만들어진 그룹을 걸러내는 문법이다.

