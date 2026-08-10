# Day26 — SQL 문법 조합 및 분석 사고력


## 🎯 학습 내용

* `GROUP BY`와 집계 함수 조합
* `WHERE`와 `HAVING`의 차이
* `CASE WHEN`을 활용한 데이터 분류
* CTE와 Window Function 조합
* `PARTITION BY`를 활용한 그룹별 분석
* `RANK()`를 활용한 순위 분석
* GA4 데이터를 활용한 광고 성과 분석 사고

## 💡 학습 정리

### 1. GROUP BY + 집계 함수

부서별 평균 급여와 직원 수 등을 계산할 수 있다.

```sql
SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;
```

### 2. WHERE와 HAVING

* `WHERE` : 그룹화하기 전 개별 데이터를 필터링
* `HAVING` : `GROUP BY` 이후 집계된 그룹을 필터링

### 3. CASE WHEN

조건에 따라 데이터를 분류할 수 있다.

```sql
CASE
    WHEN salary >= 7000 THEN 'S'
    WHEN salary >= 5000 THEN 'A'
    WHEN salary >= 3000 THEN 'B'
    ELSE 'C'
END
```

### 4. CTE + Window Function

CTE를 이용해 집계 결과를 먼저 만든 후 Window Function을 적용할 수 있다.

```sql
WITH dept_salary AS
(
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)

SELECT
    department,
    avg_salary,
    RANK() OVER(
        ORDER BY avg_salary DESC
    ) AS dept_rank
FROM dept_salary;
```

### 5. PARTITION BY + RANK()

플랫폼별 광고 전환 순위를 계산할 수 있다.

```sql
SELECT
    campaign_id,
    campaign_name,
    platform,
    conversion_count,
    RANK() OVER(
        PARTITION BY platform
        ORDER BY conversion_count DESC
    ) AS platform_rank
FROM ad_performance;
```

* `PARTITION BY` → 분석 그룹을 나눔
* `RANK()` → 그룹별 순위 계산
* `ORDER BY ... DESC` → 높은 전환 수부터 정렬

### 6. GA4 광고 성과 분석 사고

단순히 세션 수가 높은 캠페인을 좋은 캠페인이라고 판단하지 않고,

* 유입량
* 참여
* 주요 이벤트
* 전환
* 전환율

등을 함께 고려하여 광고 성과를 판단해야 한다.

## 📝 오늘의 핵심

SQL은 개별 문법을 많이 아는 것보다 **분석 목적에 맞게 여러 문법을 조합하는 것이 중요하다.**
