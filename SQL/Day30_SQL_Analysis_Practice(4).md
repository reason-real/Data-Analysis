# Day30 - SQL Comprehensive Analysis Practice

## 학습 주제

- SQL 기본 문법 종합
- `SELECT` + `FROM`
- `WHERE` + `GROUP BY` + `HAVING`
- `ORDER BY`
- 집계 함수 `COUNT()` / `SUM()` / `AVG()`
- `CASE`
- CTE
- Window Function
- `RANK()`
- `ROW_NUMBER()`
- `PARTITION BY`
- GA4 광고 성과 분석
- 주요 이벤트율 계산
- 캠페인 효율 비교
- 데이터 기반 의사결정

---

## 오늘의 핵심 내용

### 1. `GROUP BY` + 집계 함수

플랫폼별 광고 성과를 비교하기 위해 `GROUP BY`와 집계 함수를 함께 사용할 수 있다.

```sql
SELECT
    platform,
    COUNT(*) AS campaign_count,
    SUM(sessions) AS total_sessions,
    SUM(key_events) AS total_key_events
FROM ga4_data
GROUP BY platform
ORDER BY total_key_events DESC;
```

- `GROUP BY platform` → 플랫폼별로 데이터 그룹화
- `COUNT(*)` → 데이터 개수 계산
- `SUM(sessions)` → 세션 합계 계산
- `SUM(key_events)` → 주요 이벤트 합계 계산
- `ORDER BY total_key_events DESC` → 주요 이벤트 합계가 높은 순으로 정렬

즉, 플랫폼별 유입량과 주요 이벤트 발생량을 비교할 수 있다.

---

### 2. `WHERE`와 `HAVING`

`WHERE`와 `HAVING`은 모두 조건을 적용하지만 적용되는 대상과 시점이 다르다.

```sql
SELECT
    platform,
    SUM(sessions) AS total_sessions,
    SUM(key_events) AS total_key_events
FROM ga4_data
WHERE sessions >= 500
GROUP BY platform
HAVING SUM(key_events) >= 100;
```

`WHERE sessions >= 500`

→ `GROUP BY` 이전에 개별 행의 `sessions`가 500 이상인 데이터를 필터링한다.

`HAVING SUM(key_events) >= 100`

→ `GROUP BY` 이후 플랫폼별로 계산된 주요 이벤트 합계가 100 이상인 그룹만 남긴다.

기본적인 분석 흐름:

```text
FROM
↓
WHERE
↓
GROUP BY
↓
HAVING
↓
SELECT
↓
ORDER BY
```

---

### 3. `ROW_NUMBER()` / `RANK()` / `DENSE_RANK()`

세 가지 Window Function은 순위를 부여하는 방식에 차이가 있다.

#### `ROW_NUMBER()`

모든 행에 고유한 번호를 부여한다.

동일한 값이 있어도 같은 순위를 부여하지 않는다.

```sql
ROW_NUMBER() OVER(
    ORDER BY key_events DESC
)
```

예:

`1, 2, 3, 4`

---

#### `RANK()`

동일한 값에는 공동 순위를 부여하고, 공동 순위가 발생하면 다음 순위를 건너뛴다.

```sql
RANK() OVER(
    ORDER BY key_events DESC
)
```

예:

`1, 2, 2, 4`

---

#### `DENSE_RANK()`

동일한 값에는 공동 순위를 부여하지만 다음 순위를 건너뛰지 않는다.

```sql
DENSE_RANK() OVER(
    ORDER BY key_events DESC
)
```

예:

`1, 2, 2, 3`

---

### 4. 플랫폼별 주요 이벤트율 계산

플랫폼별 전체 세션과 전체 주요 이벤트를 기준으로 주요 이벤트율을 계산할 수 있다.

주요 이벤트율 공식:

`key_events / sessions × 100`

```sql
SELECT
    platform,
    SUM(sessions) AS total_sessions,
    SUM(key_events) AS total_key_events,
    SUM(key_events) / SUM(sessions) * 100 AS key_event_rate
FROM ga4_data
GROUP BY platform;
```

중요한 점은 개별 캠페인의 이벤트율을 단순히 평균 내는 것과 전체 주요 이벤트를 전체 세션으로 나누는 것은 다를 수 있다는 것이다.

분자와 분모의 기준이 달라지기 때문이다.

---

### 5. CTE를 활용한 분석 단계 분리

플랫폼별 성과를 계산한 뒤 다시 순위를 매기려면 CTE를 활용하여 분석 단계를 나눌 수 있다.

```sql
WITH platform_performance AS
(
    SELECT
        platform,
        SUM(sessions) AS total_sessions,
        SUM(key_events) AS total_key_events,
        SUM(key_events) / SUM(sessions) * 100 AS key_event_rate
    FROM ga4_data
    GROUP BY platform
)

SELECT
    platform,
    total_sessions,
    total_key_events,
    key_event_rate,
    RANK() OVER(
        ORDER BY key_event_rate DESC
    ) AS platform_rank
FROM platform_performance;
```

분석 흐름:

`ga4_data`

↓

`GROUP BY platform`

↓

`SUM()`을 이용한 플랫폼별 집계

↓

주요 이벤트율 계산

↓

CTE인 `platform_performance` 생성

↓

`RANK()`를 활용한 플랫폼 순위 계산

CTE를 활용하면 복잡한 분석을 여러 단계로 나누어 작성할 수 있다.

---

### 6. 플랫폼별 최고 효율 캠페인 찾기

각 플랫폼에서 주요 이벤트율이 가장 높은 캠페인 하나를 선정하려면 `PARTITION BY`와 `ROW_NUMBER()`를 조합할 수 있다.

분석 흐름:

`원본 데이터`

↓

주요 이벤트율 계산

↓

`PARTITION BY platform`

↓

`ROW_NUMBER()`로 플랫폼별 순위 계산

↓

`campaign_rank = 1` 추출

```sql
WITH campaign_performance AS
(
    SELECT
        platform,
        campaign,
        sessions,
        key_events,
        key_events / sessions * 100 AS key_event_rate
    FROM ga4_data
),

ranked_campaigns AS
(
    SELECT
        platform,
        campaign,
        sessions,
        key_events,
        key_event_rate,
        ROW_NUMBER() OVER(
            PARTITION BY platform
            ORDER BY key_event_rate DESC
        ) AS campaign_rank
    FROM campaign_performance
)

SELECT
    platform,
    campaign,
    sessions,
    key_events,
    key_event_rate
FROM ranked_campaigns
WHERE campaign_rank = 1;
```

`PARTITION BY platform`

→ 플랫폼별로 순위를 다시 시작한다.

`ROW_NUMBER()`

→ 각 플랫폼에서 고유한 순위를 부여한다.

`WHERE campaign_rank = 1`

→ 각 플랫폼의 1위 캠페인만 추출한다.

---

## GA4 광고 성과 분석 관점

실제 퍼포먼스 마케팅에서는 단순히 주요 이벤트 수가 많은 캠페인을 좋은 캠페인이라고 판단할 수 없다.

예를 들어 다음과 같은 상황을 생각할 수 있다.

| 캠페인 | Sessions | Key Events | 주요 이벤트율 | 이탈률 |
|---|---:|---:|---:|---:|
| A | 5,000 | 200 | 4% | 65% |
| B | 2,000 | 180 | 9% | 35% |
| C | 500 | 70 | 14% | 20% |

주요 이벤트 수만 보면 A가 가장 높다.

하지만 주요 이벤트율은 C가 가장 높다.

따라서 단순히 `Key Events`가 높은 캠페인이 가장 효율적인 캠페인이라고 단정할 수 없다.

실제 광고 성과를 판단하기 위해서는 다음과 같은 추가 데이터를 함께 확인할 필요가 있다.

- 광고비
- CPA
- ROAS
- 유효전환율
- 실제 상담 전환율
- 실제 계약 전환율
- 전환의 품질
- 광고 타겟팅
- 랜딩페이지 이탈률

즉,

> `유입량` + `전환량` + `전환율` + `전환의 질` + `비용`

을 함께 확인해야 한다.

---

## 분석가 사고방식

오늘 실습에서는 SQL 문법 자체보다 **분석 목적에 맞게 여러 문법을 조합하는 것**에 집중했다.

예를 들어,

`GROUP BY`

→ 플랫폼별 데이터 집계

`SUM()`

→ 세션과 주요 이벤트 합계 계산

계산식

→ 주요 이벤트율 생성

`WITH`

→ 분석 단계 분리

`PARTITION BY`

→ 플랫폼별 분석 범위 설정

`ROW_NUMBER()`

→ 플랫폼별 최고 캠페인 선정

`WHERE`

→ 최종적으로 1위 캠페인만 추출

이처럼 각각의 SQL 문법은 독립적으로 사용하는 것이 아니라 하나의 분석 목적을 해결하기 위해 조합할 수 있다.

---

## Final Challenge 정리

실제 퍼포먼스 마케팅 상황에서는 다음과 같은 흐름으로 분석할 수 있다.

```text
원본 GA4 데이터
↓
SELECT
↓
필요한 데이터 필터링
↓
WHERE
↓
플랫폼 또는 캠페인별 집계
↓
GROUP BY
↓
SUM() / AVG() / COUNT()
↓
주요 이벤트율 계산
↓
CTE
↓
PARTITION BY
↓
ROW_NUMBER() / RANK()
↓
1위 캠페인 추출
↓
광고 성과 비교
↓
의사결정
```

---

## Day23 ~ Day30 SQL 학습 핵심 흐름

### Day23

Window Function 기본 개념

- `OVER`
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`

### Day24

그룹별 Window Function

- `PARTITION BY`
- `GROUP BY`와 `PARTITION BY` 차이

### Day25

이전 행과 다음 행 비교

- `LAG()`
- `LEAD()`

### Day26

기존 SQL 문법 복습 및 조합

- `GROUP BY`
- 집계 함수
- `WHERE`
- `HAVING`
- `CASE`
- CTE
- Window Function

### Day27

SQL 문법 조합과 분석 지표 생성

- `GROUP BY`
- `HAVING`
- CTE
- `RANK()`
- `PARTITION BY`
- GA4 주요 이벤트율

### Day28

광고 데이터 SQL 분석

- 캠페인별 성과 집계
- 플랫폼별 순위
- `ROW_NUMBER()`
- `RANK()`
- GA4 광고 효율 분석

### Day29

GA4 성과 지표 계산

- 주요 이벤트율
- 플랫폼별 집계
- `HAVING`
- CTE
- 플랫폼별 순위
- 플랫폼별 최고 효율 캠페인

### Day30

SQL 종합 분석

- 기본 SQL 문법 종합
- 집계
- 조건 필터링
- CTE
- Window Function
- `PARTITION BY`
- `ROW_NUMBER()`
- GA4 광고 성과 분석
- 분석 목적에 따른 SQL 조합

---

## 오늘 배운 핵심 정리

```text
SELECT
→ 필요한 데이터를 선택

FROM
→ 데이터를 가져올 테이블 지정

WHERE
→ 그룹화 전 개별 데이터 필터링

GROUP BY
→ 특정 기준으로 데이터 그룹화

SUM() / AVG() / COUNT()
→ 데이터 집계

HAVING
→ 그룹화 및 집계 이후 조건 적용

ORDER BY
→ 결과 정렬

CASE
→ 조건에 따른 값 분류

WITH
→ CTE를 활용하여 분석 단계 분리

OVER()
→ Window Function 사용

PARTITION BY
→ 그룹별 Window Function 계산

ROW_NUMBER()
→ 고유 순위 부여

RANK()
→ 공동 순위를 허용하는 순위 부여

DENSE_RANK()
→ 공동 순위를 허용하면서 순위를 건너뛰지 않음
```

---

## 오늘의 핵심 문장

> SQL에서 중요한 것은 문법을 많이 아는 것이 아니라, 분석 목적에 맞는 문법을 조합하여 의사결정에 필요한 지표를 만드는 것이다.

---

## 실무 연결

Day30까지 학습하면서 SQL의 기본 문법을 단순히 외우는 단계에서 벗어나 실제 광고 성과 분석에 적용하는 흐름을 연습했다.

특히 GA4 데이터를 기준으로,

**유입 → 주요 이벤트 → 주요 이벤트율 → 플랫폼 비교 → 캠페인 비교 → 순위 → 효율적인 캠페인 선정**

이라는 분석 흐름을 SQL로 구성할 수 있다는 점을 학습했다.

이는 향후 실제 민사 분야 GA4 데이터를 활용한 퍼포먼스 마케팅 분석 및 포트폴리오 프로젝트에서 활용할 수 있는 기초가 된다.

---

## Day30 완료

Day23부터 Day30까지 Window Function을 중심으로 SQL 기본 문법을 복습하고, 이를 GA4 광고 성과 분석에 연결하는 종합 실습을 완료했다.

다음 단계에서는 지금까지 학습한 SQL을 단순 반복하기보다 실제 데이터 분석 업무에 필요한 다른 역량과 연결하여 확장해 나간다.