# Day27 - SQL Analysis Practice

## 학습 주제

* SQL 문법 조합
* GROUP BY + 집계 함수
* WHERE와 HAVING
* CTE
* Window Function
* PARTITION BY
* GA4 데이터 분석
* 주요 이벤트율 계산
* SQL을 활용한 분석 지표 만들기

---

## 오늘의 핵심 내용

### 1. GROUP BY + 집계 함수

플랫폼이나 부서처럼 특정 기준으로 데이터를 그룹화한 뒤 집계할 수 있다.

```sql
SELECT
    platform,
    COUNT(*) AS campaign_count,
    SUM(conversion_count) AS total_conversions
FROM ad_performance
GROUP BY platform
ORDER BY total_conversions DESC;
```

* `GROUP BY` → 데이터를 특정 기준으로 그룹화
* `COUNT()` → 개수 계산
* `SUM()` → 합계 계산
* `AVG()` → 평균 계산
* `ORDER BY` → 결과 정렬

---

### 2. WHERE와 HAVING

두 조건절은 적용되는 시점과 대상이 다르다.

```sql
WHERE salary >= 3000
```

→ 그룹화하기 전 개별 데이터를 필터링

```sql
HAVING AVG(salary) >= 5000
```

→ `GROUP BY` 이후 집계된 결과를 조건으로 필터링

기본적인 흐름:

```text
FROM
→ WHERE
→ GROUP BY
→ HAVING
→ SELECT
→ ORDER BY
```

---

### 3. ORDER BY와 RANK()

```sql
ORDER BY total_conversions DESC
```

→ 데이터를 높은 순서 또는 낮은 순서로 정렬

```sql
RANK() OVER(
    ORDER BY total_conversions DESC
)
```

→ 각각의 데이터에 순위 번호를 부여

즉,

> ORDER BY는 정렬, RANK()는 순위 부여

라는 차이가 있다.

---

### 4. CTE + Window Function

복잡한 분석을 단계별로 나누어 작성할 수 있다.

```sql
WITH platform_performance AS
(
    SELECT
        platform,
        SUM(conversion_count) AS total_conversions
    FROM ad_performance
    GROUP BY platform
)

SELECT
    platform,
    total_conversions,
    RANK() OVER(
        ORDER BY total_conversions DESC
    ) AS platform_rank
FROM platform_performance;
```

CTE를 활용하면 복잡한 SQL을 여러 단계로 나누어 작성할 수 있어 가독성과 관리가 편해진다.

---

### 5. GROUP BY와 PARTITION BY

`GROUP BY`는 그룹별 집계 결과만 남기는 반면, `PARTITION BY`는 기존 행을 유지하면서 그룹별 계산을 수행할 수 있다.

```sql
-- GROUP BY
SELECT
    platform,
    SUM(conversion_count) AS total_conversions
FROM ad_performance
GROUP BY platform;
```

```sql
-- PARTITION BY
SELECT
    platform,
    conversion_count,
    SUM(conversion_count) OVER(
        PARTITION BY platform
    ) AS platform_total
FROM ad_performance;
```

핵심 차이:

> GROUP BY → 그룹별 결과로 축약
> PARTITION BY → 기존 데이터를 유지하면서 그룹별 계산

---

### 6. GA4 주요 이벤트율

단순히 세션 수가 많다고 좋은 캠페인이라고 판단할 수 없다.

예를 들어 주요 이벤트율을 다음과 같이 계산할 수 있다.

```sql
SELECT
    platform,
    campaign,
    sessions,
    key_events,
    key_events / sessions * 100 AS key_event_rate
FROM ga4_data;
```

주요 이벤트율은 유입량뿐만 아니라 **유입 대비 주요 이벤트가 얼마나 발생했는지**를 확인하는 지표이다.

---

## 분석 관점에서 생각할 점

광고 성과를 분석할 때는 단순히 하나의 지표만 비교하지 않는다.

예를 들어:

* Sessions
* Key Events
* Key Event Rate
* Bounce Rate
* 광고비
* CPA
* ROAS
* 전환의 품질

등을 함께 확인하여 캠페인의 실제 효율을 판단할 수 있다.

따라서,

> 세션이 가장 많은 캠페인 = 가장 좋은 캠페인

이라고 단정할 수 없다.

---

## 오늘 배운 핵심 정리

```text
GROUP BY
→ 그룹별 집계

HAVING
→ 집계 결과에 조건 적용

ORDER BY
→ 결과 정렬

RANK()
→ 순위 부여

CTE
→ 복잡한 SQL을 단계별로 구성

PARTITION BY
→ 기존 행을 유지하면서 그룹별 계산

계산식
→ 실제 분석 지표 생성
```

### 오늘의 핵심 문장

> 좋은 SQL 분석은 데이터를 많이 보여주는 것이 아니라, 의사결정에 필요한 지표를 만들어주는 것이다.
