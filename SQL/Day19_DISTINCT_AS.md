# Day19 - DISTINCT & AS

> 📅 Study Date : 2026.08.04
>
> 📖 Topic : SQL DISTINCT & AS

---

# 📌 학습 목표

- DISTINCT를 사용하여 중복 데이터를 제거하는 방법을 이해한다.
- AS를 사용하여 컬럼에 별칭(Alias)을 지정하는 방법을 익힌다.
- 가독성이 좋은 SQL을 작성하는 습관을 기른다.

---

# 📚 핵심 개념

## 1. DISTINCT

DISTINCT는 조회 결과의 **중복된 값을 제거**하여 고유한 데이터만 반환한다.

```sql
SELECT DISTINCT department
FROM employees;
```

---

## 2. AS

AS는 컬럼이나 테이블에 **별칭(Alias)** 을 지정하는 문법이다.

```sql
SELECT name AS employee_name
FROM employees;
```

---

# 📌 DISTINCT와 AS 사용 이유

### DISTINCT

- 중복 데이터 제거
- 고유한 값만 조회
- 데이터 종류 확인

### AS

- 컬럼명을 이해하기 쉽게 변경
- 집계 함수 결과에 의미 있는 이름 부여
- SQL 가독성 향상

---

# 💼 실무 활용

DISTINCT와 AS는 데이터 분석 및 보고서 작성에서 자주 사용된다.

대표적인 활용 사례는 다음과 같다.

- 등록된 부서 목록 조회
- 광고 플랫폼 종류 조회
- 평균 매출 컬럼명 변경
- 집계 결과를 보기 쉬운 이름으로 표시

---

# 💡 실무 예제

부서를 중복 없이 조회하기

```sql
SELECT DISTINCT department
FROM employees;
```

---

직원 이름에 별칭 지정하기

```sql
SELECT name AS employee_name
FROM employees;
```

---

부서별 평균 급여 조회하기

```sql
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

---

광고 플랫폼을 중복 없이 조회하기

```sql
SELECT DISTINCT platform
FROM ad_performance;
```

---

# 📌 DISTINCT와 GROUP BY의 차이

| DISTINCT | GROUP BY |
|-----------|----------|
| 중복 제거 | 그룹 생성 |
| 집계 함수 없이 사용 가능 | 집계 함수와 함께 자주 사용 |
| 고유한 값 조회 | 그룹별 통계 계산 |

---

# 🎯 핵심 정리

- DISTINCT : 중복 제거
- AS : 별칭 지정
- DISTINCT는 고유한 값만 조회한다.
- AS는 SQL 결과를 이해하기 쉽게 만든다.

---

# 🧠 오늘 배운 개념

- DISTINCT
- AS (Alias)
- GROUP BY와의 차이

---

# 📌 실무 TIP

집계 함수(AVG, SUM, COUNT 등)를 사용할 때는 결과 컬럼에 AS를 사용하여 의미 있는 이름을 지정하는 것이 좋다.

예를 들어 `AVG(salary)`보다 `avg_salary`와 같은 별칭을 사용하면 결과를 이해하기 훨씬 쉽다.

---

# 📊 실무 분석 포인트

광고 데이터를 분석할 때는 `DISTINCT platform`으로 어떤 광고 매체를 사용하는지 빠르게 확인할 수 있다.

또한 `AS`를 사용하여 `total_cost`, `avg_conversion`, `conversion_rate`와 같이 직관적인 컬럼명을 지정하면 보고서 작성과 협업이 훨씬 수월해진다.

---

# 🎯 한 줄 정리

> DISTINCT는 중복을 제거하고, AS는 컬럼명을 이해하기 쉽게 변경하여 SQL 결과의 가독성을 높여준다.