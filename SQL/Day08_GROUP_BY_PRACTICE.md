# Day08 - GROUP BY Practice



> 📅 Study Date : 2026.07.17

>

> 📖 Topic : GROUP BY Practice



---



# 📌 학습 목표



- GROUP BY를 활용하여 데이터를 그룹화한다.

- 집계 함수(COUNT, AVG, MAX, MIN)를 함께 사용할 수 있다.

- AS(별칭)와 ORDER BY를 활용하여 결과를 보기 쉽게 출력한다.



---



# 📚 핵심 문법



## 1. 부서별 직원 수와 평균 급여 조회



```sql

SELECT department,

&#x20;      COUNT(*) AS employee_count,

&#x20;      AVG(salary) AS avg_salary

FROM employees

GROUP BY department;

```



---



## 2. 부서별 최고 급여와 최저 급여 조회



```sql

SELECT department,

&#x20;      MAX(salary) AS max_salary,

&#x20;      MIN(salary) AS min_salary

FROM employees

GROUP BY department;

```



---



## 3. 평균 급여가 높은 순으로 정렬



```sql

SELECT department,

&#x20;      AVG(salary) AS avg_salary

FROM employees

GROUP BY department

ORDER BY avg_salary DESC;

```



---



## 4. 급여가 3,500 이상인 직원만 대상으로 부서별 통계 조회



```sql

SELECT department,

&#x20;      COUNT(*) AS employee_count,

&#x20;      AVG(salary) AS avg_salary

FROM employees

WHERE salary >= 3500

GROUP BY department;

```



---



# 💼 실무 예시



```sql

SELECT department,

&#x20;      COUNT(*) AS employee_count,

&#x20;      AVG(salary) AS avg_salary

FROM employees

WHERE salary >= 3500

GROUP BY department

ORDER BY avg_salary DESC;

```



인사팀에서 부서별 인원 수와 평균 급여를 비교하거나, 평균 급여가 높은 부서를 분석할 때 자주 사용하는 쿼리이다.



---



# 🎯 핵심 정리



- GROUP BY는 같은 값을 가진 데이터를 그룹으로 묶는다.

- COUNT(), AVG(), MAX(), MIN() 등 집계 함수와 함께 사용한다.

- AS를 사용하면 결과 컬럼명을 이해하기 쉽게 만들 수 있다.

- ORDER BY를 사용하면 집계 결과를 원하는 기준으로 정렬할 수 있다.



---



# 🧠 오늘 배운 개념



- GROUP BY

- COUNT()

- AVG()

- MAX()

- MIN()

- AS

- ORDER BY



---



# 🎯 한 줄 정리



> GROUP BY는 데이터를 그룹으로 묶고, 집계 함수와 함께 사용하여 부서별·카테고리별 통계를 분석할 때 가장 많이 사용하는 SQL 문법이다.