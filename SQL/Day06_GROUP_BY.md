# Day06 - GROUP BY

> 📅 **Study Date** : 2026.07.15\
> 📖 **Topic** : GROUP BY

------------------------------------------------------------------------

# 📌 학습 목표

-   `GROUP BY`를 사용하여 같은 값을 가진 데이터를 그룹으로 묶는다.
-   집계 함수(`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`)를 활용한다.
-   그룹별 통계를 조회하는 SQL을 작성한다.

------------------------------------------------------------------------

# 📚 핵심 문법

## 1. 부서별 직원 수

``` sql
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

## 2. 부서별 평균 급여

``` sql
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

## 3. 부서별 최고/최저 급여

``` sql
SELECT department,
       MAX(salary) AS max_salary,
       MIN(salary) AS min_salary
FROM employees
GROUP BY department;
```

## 4. 부서별 급여 총합

``` sql
SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

------------------------------------------------------------------------

# 💼 실무 예시

``` sql
SELECT department,
       COUNT(*) AS employee_count,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

부서별 인원 수와 평균 급여를 함께 조회하는 대표적인 집계 쿼리이다.

------------------------------------------------------------------------

# 🎯 핵심 정리

-   GROUP BY는 같은 값을 하나의 그룹으로 묶는다.
-   집계 함수와 함께 사용한다.
-   SELECT에는 GROUP BY 컬럼 또는 집계 함수만 사용할 수 있다.

------------------------------------------------------------------------

# 🧠 오늘 배운 개념

-   GROUP BY
-   COUNT()
-   SUM()
-   AVG()
-   MAX()
-   MIN()

------------------------------------------------------------------------

# 🎯 한 줄 정리

> GROUP BY는 데이터를 그룹으로 묶고 집계 함수를 이용해 그룹별 통계를
> 계산하는 핵심 문법이다.
