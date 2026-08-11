# Day28 - SQL Advertising Data Analysis Practice

## 학습 주제

- 광고 캠페인 성과 집계
- GROUP BY + 집계 함수
- HAVING
- RANK()
- PARTITION BY
- ROW_NUMBER()
- GA4 데이터 분석
- 주요 이벤트율 계산
- 캠페인별 성과 비교
- 광고 성과를 판단하기 위한 분석 지표
- SQL 문법을 분석 목적에 맞게 조합하기

---

## 오늘의 핵심 내용

### 1. 캠페인별 성과 집계

광고 데이터를 캠페인별로 그룹화한 후 총 전환 수와 평균 전환 수를 계산할 수 있다.

    SELECT
        campaign_name,
        SUM(conversion_count) AS total_conversions,
        AVG(conversion_count) AS avg_conversions
    FROM ad_performance
    GROUP BY campaign_name
    ORDER BY total_conversions DESC;

- `GROUP BY campaign_name` → 캠페인별로 데이터 그룹화
- `SUM()` → 총 전환 수 계산
- `AVG()` → 평균 전환 수 계산
- `ORDER BY total_conversions DESC` → 총 전환 수가 높은 순서로 정렬

---

### 2. HAVING을 활용한 집계 결과 필터링

`GROUP BY` 이후 집계된 결과에 조건을 적용할 때 `HAVING`을 사용한다.

    SELECT
        campaign_name,
        SUM(conversion_count) AS total_conversions
    FROM ad_performance
    GROUP BY campaign_name
    HAVING SUM(conversion_count) >= 200;

`WHERE`는 개별 행을 필터링하고, `HAVING`은 그룹화된 결과를 필터링한다.

핵심 차이:

- `WHERE` → 그룹화 전 개별 데이터에 조건 적용
- `HAVING` → `GROUP BY` 이후 집계 결과에 조건 적용

---

### 3. RANK() + PARTITION BY

플랫폼별로 캠페인의 전환 수 순위를 계산할 수 있다.

    SELECT
        campaign_name,
        platform,
        conversion_count,
        RANK() OVER(
            PARTITION BY platform
            ORDER BY conversion_count DESC
        ) AS platform_rank
    FROM ad_performance;

- `RANK()` → 순위 부여
- `PARTITION BY platform` → 플랫폼별로 순위를 다시 시작
- `ORDER BY conversion_count DESC` → 전환 수가 높은 캠페인부터 순위 부여

예를 들어 플랫폼별 전환 수가 다음과 같다면:

    1
    2
    2
    4

공동 순위가 발생하면 다음 순위를 건너뛴다.

---

### 4. PARTITION BY가 없을 경우

    RANK() OVER(
        PARTITION BY platform
        ORDER BY conversion_count DESC
    )

위와 같이 `PARTITION BY platform`을 사용하면 플랫폼별로 순위를 다시 계산한다.

반대로 `PARTITION BY platform`을 제거하면 모든 플랫폼의 캠페인을 하나의 그룹으로 보고 전체 순위를 계산하게 된다.

즉,

> PARTITION BY → Window Function의 계산 기준을 그룹별로 나누는 역할

을 한다.

---

### 5. ROW_NUMBER(), RANK(), DENSE_RANK() 비교

#### ROW_NUMBER()

각 행에 고유한 순번을 부여한다.

    1
    2
    3
    4

동일한 값이 존재하더라도 같은 순위를 부여하지 않는다.

따라서 플랫폼별로 전환 수가 가장 높은 캠페인을 딱 하나 선정해야 하는 경우 활용할 수 있다.

---

#### RANK()

공동 순위를 허용하며 공동 순위만큼 다음 순위를 건너뛴다.

    1
    2
    2
    4

---

#### DENSE_RANK()

공동 순위를 허용하지만 다음 순위를 건너뛰지 않는다.

    1
    2
    2
    3

---

### 핵심 차이

> `ROW_NUMBER()` → 중복 순위 없음  
> `RANK()` → 공동 순위 허용 + 다음 순위 건너뜀  
> `DENSE_RANK()` → 공동 순위 허용 + 다음 순위 유지

---

### 6. GA4 주요 이벤트율 계산

광고 캠페인의 성과를 분석할 때 단순히 세션 수만 확인하는 것은 충분하지 않다.

주요 이벤트율을 계산하여 유입 대비 주요 이벤트 발생 효율을 확인할 수 있다.

공식:

    주요 이벤트율 = key_events / sessions × 100

SQL:

    SELECT
        channel,
        campaign,
        sessions,
        key_events,
        key_events / sessions * 100 AS key_event_rate
    FROM ga4_data;

주요 이벤트율을 활용하면 캠페인의 유입량뿐만 아니라 유입 대비 주요 이벤트 발생 효율을 비교할 수 있다.

---

## GA4 분석 실습

### 7. 민사_A와 민사_B 비교

다음과 같은 데이터가 있다고 가정했다.

| 캠페인 | Sessions | Key Events | 이탈률 |
|---|---:|---:|---:|
| 민사_A | 1,000 | 120 | 52% |
| 민사_B | 700 | 105 | 35% |

단순히 주요 이벤트 수만 비교하면 민사_A가 더 높다.

하지만 민사_A는 세션 수가 많은 동시에 이탈률도 높다.

민사_B는 세션 수가 더 적지만 주요 이벤트 수가 상대적으로 높고 이탈률도 낮다.

따라서,

> 주요 이벤트 수가 높다는 이유만으로 민사_A가 더 좋은 캠페인이라고 단정할 수 없다.

캠페인 성과를 판단할 때는 다음과 같은 지표를 함께 확인해야 한다.

- Sessions
- Key Events
- Key Event Rate
- Bounce Rate
- 실제 문의 수
- 상담 전환 수
- 전환의 질
- 광고비
- CPA
- 매출 또는 계약액

---

### 8. 광고 캠페인 분석에 필요한 최소 지표

광고 캠페인별로 유입량과 주요 이벤트, 유입 대비 효율을 비교하기 위해 다음과 같은 컬럼을 활용할 수 있다.

- `campaign`
- `sessions`
- `key_events`
- `key_event_rate`

각 컬럼의 역할:

- `campaign` → 캠페인을 구분
- `sessions` → 유입 규모 확인
- `key_events` → 주요 이벤트 발생 수 확인
- `key_event_rate` → 유입 대비 주요 이벤트 발생 효율 확인

---

## 분석 관점에서 생각할 점

광고 데이터를 분석할 때는 단순히 숫자가 높은 데이터를 찾는 것이 아니라 어떤 기준으로 비교할 것인지 먼저 정의해야 한다.

예를 들어:

> Sessions가 가장 높은 캠페인 = 가장 좋은 캠페인

이라고 단정할 수 없다.

세션 수가 많더라도 주요 이벤트율이 낮거나 이탈률이 높을 수 있기 때문이다.

반대로 세션 수가 적더라도 주요 이벤트율이 높을 수 있다.

하지만 이것 역시 실제 전환의 질이나 매출까지 확인하지 않고 무조건 좋은 캠페인이라고 판단할 수는 없다.

따라서 광고 성과를 분석할 때는 다음과 같은 흐름으로 생각할 필요가 있다.

    유입량
    ↓
    주요 이벤트
    ↓
    주요 이벤트율
    ↓
    이탈률
    ↓
    실제 문의 / 상담 전환
    ↓
    전환의 질
    ↓
    광고비 / CPA
    ↓
    매출 / 계약

---

## SQL 문법을 분석 목적에 맞게 조합하기

실제 데이터 분석에서는 하나의 SQL 문법만 사용하는 경우보다 여러 문법을 목적에 맞게 조합하는 경우가 많다.

예를 들어:

    원본 데이터
    ↓
    필요한 데이터 선택
    ↓
    GROUP BY를 통한 집계
    ↓
    필요한 경우 HAVING으로 필터링
    ↓
    CTE를 통한 단계별 구성
    ↓
    PARTITION BY로 그룹별 계산
    ↓
    Window Function으로 순위 계산
    ↓
    필요한 결과 추출

중요한 것은 SQL 문법 자체를 많이 사용하는 것이 아니라,

> 어떤 분석을 해야 하는지 먼저 정의하고 그 목적에 맞는 문법을 선택하는 것이다.

---

## 오늘 배운 핵심 정리

    GROUP BY
    → 특정 기준으로 데이터를 그룹화하고 집계

    HAVING
    → GROUP BY 이후 집계 결과에 조건 적용

    ORDER BY
    → 결과를 특정 기준으로 정렬

    PARTITION BY
    → 기존 행을 유지하면서 Window Function의 계산 범위를 그룹별로 나눔

    ROW_NUMBER()
    → 각 행에 고유한 순번 부여

    RANK()
    → 공동 순위 허용 + 다음 순위 건너뜀

    DENSE_RANK()
    → 공동 순위 허용 + 다음 순위 건너뛰지 않음

    주요 이벤트율
    → key_events / sessions × 100

---

## 오늘의 핵심 문장

> 좋은 SQL 분석은 데이터를 많이 보여주는 것이 아니라, 의사결정에 필요한 지표를 만들어주는 것이다.

---

## Day28 학습 피드백

- `GROUP BY`를 활용하여 캠페인 및 플랫폼별 성과를 집계할 수 있다.
- `HAVING`을 활용하여 집계 결과에 조건을 적용할 수 있다.
- `RANK()`와 `PARTITION BY`를 조합하여 플랫폼별 캠페인 순위를 계산할 수 있다.
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`의 차이를 이해했다.
- GA4 데이터를 활용하여 주요 이벤트율을 계산하는 방법을 연습했다.
- 세션 수나 주요 이벤트 수 하나만으로 광고 성과를 판단하면 안 된다는 점을 이해했다.
- 광고 캠페인의 성과를 판단할 때 유입량, 주요 이벤트율, 이탈률, 전환의 질 및 비즈니스 성과를 함께 고려해야 한다.
- SQL 문법 자체보다 분석 목적에 맞는 지표를 정의하고 적절한 문법을 조합하는 것이 중요하다는 점을 학습했다.