\# Day05 - JOIN Practice



> 📅 \*\*Study Date\*\* : 2026.07.14

>

> 📖 \*\*Topic\*\* : JOIN Practice \& Alias



\---



\# 📌 학습 목표



\- INNER JOIN을 활용하여 필요한 데이터를 조회한다.

\- Alias(e, d)를 사용하여 SQL을 간결하게 작성한다.

\- WHERE와 ORDER BY를 JOIN과 함께 사용할 수 있다.

\- 필요한 컬럼만 조회하는 습관을 기른다.



\---



\# 📚 핵심 문법



\## 1. JOIN + Alias



```sql

SELECT e.name, d.department\_name

FROM employees e

JOIN departments d

ON e.department\_id = d.department\_id;

```



\- `e`는 employees 테이블의 별칭이다.

\- `d`는 departments 테이블의 별칭이다.

\- Alias를 사용하면 SQL을 짧고 읽기 쉽게 작성할 수 있다.



\---



\## 2. WHERE와 함께 사용



```sql

SELECT e.name, d.department\_name

FROM employees e

JOIN departments d

ON e.department\_id = d.department\_id

WHERE d.department\_name = 'Finance';

```



Finance 부서 직원만 조회한다.



\---



\## 3. ORDER BY와 함께 사용



```sql

SELECT e.name, e.salary

FROM employees e

JOIN departments d

ON e.department\_id = d.department\_id

ORDER BY e.salary DESC;

```



급여가 높은 순으로 정렬한다.



\---



\# 💼 실무 예시



직원 이름, 부서명, 급여를 조회한다.



```sql

SELECT

&#x20;   e.name,

&#x20;   d.department\_name,

&#x20;   e.salary

FROM employees e

JOIN departments d

ON e.department\_id = d.department\_id;

```



실무에서는 `SELECT \*`보다 필요한 컬럼만 조회하는 것이 성능과 가독성 측면에서 유리하다.



\---



\# 🎯 핵심 정리



\- JOIN에서는 Alias를 자주 사용한다.

\- 필요한 컬럼만 SELECT하는 습관을 갖는다.

\- WHERE로 조건을 추가할 수 있다.

\- ORDER BY로 원하는 기준으로 정렬할 수 있다.



\---



\# 🧠 오늘 배운 개념



\- JOIN

\- Alias

\- WHERE

\- ORDER BY

\- 필요한 컬럼 조회



\---



\# 🎯 한 줄 정리



> JOIN에서는 Alias를 활용하여 필요한 컬럼만 조회하고, WHERE와 ORDER BY를 함께 사용하여 원하는 데이터를 효율적으로 조회할 수 있다.

