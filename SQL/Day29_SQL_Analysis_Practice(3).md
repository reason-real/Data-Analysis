# Day29 - GA4 Performance Metrics Analysis

## 학습 주제

- GA4 주요 이벤트율 계산
- 캠페인별 성과 비교
- 플랫폼별 집계
- GROUP BY + SUM()
- HAVING을 활용한 조건 필터링
- CTE를 활용한 단계별 분석
- Window Function을 활용한 순위 분석
- PARTITION BY + ROW_NUMBER()
- 광고 캠페인 효율 분석
- 데이터 기반 의사결정

---

## 오늘의 핵심 내용

### 1. 주요 이벤트율 계산

광고 캠페인의 유입량만 확인하는 것이 아니라, 유입 대비 주요 이벤트가 얼마나 발생했는지 확인하기 위해 주요 이벤트율을 계산할 수 있다.

주요 이벤트율 공식:

`key_events / sessions × 100`

    SELECT
        campaign,
        sessions,
        key_events,
        key_events / sessions * 100 AS key_event_rate
    FROM ga4_data;

주요 이벤트 수가 많더라도 세션 수가 훨씬 많다면 실제 효율은 낮을 수 있다.

따라서 광고 성과를 비교할 때는 절대적인 전환 수뿐만 아니라 전환율과 같은 비율 지표도 함께 확인해야 한다.

---

### 2. ORDER BY를 활용한 성과 정렬

계산된 주요 이벤트율을 기준으로 캠페인을 정렬할 수 있다.

    SELECT
        campaign,
        sessions,
        key_events,
        key_events / sessions * 100 AS key_event_rate
    FROM ga4_data
    ORDER BY key_event_rate DESC;

- `ORDER BY` → 결과의 정렬 기준 지정
- `DESC` → 내림차순
- `ASC` → 오름차순

즉, 주요 이벤트율이 높은 캠페인을 위쪽부터 확인할 수 있다.

---

### 3. 플랫폼별 집계

플랫폼별 전체 세션과 주요 이벤트를 비교하기 위해 `GROUP BY`와 `SUM()`을 사용할 수 있다.

    SELECT
        platform,
        SUM(sessions) AS total_sessions,
        SUM(key_events) AS total_key_events
    FROM ga4_data
    GROUP BY platform;

- `GROUP BY platform` → 플랫폼별 그룹화
- `SUM(sessions)` → 플랫폼별 전체 세션 합계
- `SUM(key_events)` → 플랫폼별 전체 주요 이벤트 합계

---

### 4. 플랫폼별 주요 이벤트율

플랫폼 전체의 주요 이벤트율은 개별 캠페인의 단순 평균과 다르게 계산할 수 있다.

    SELECT
        platform,
        SUM(sessions) AS total_sessions,
        SUM(key_events) AS total_key_events,
        SUM(key_events) / SUM(sessions) * 100 AS key_event_rate
    FROM ga4_data
    GROUP BY platform;

플랫폼 전체 데이터를 기준으로 계산하기 때문에,

`전체 주요 이벤트 수 ÷ 전체 세션 수`

라는 구조가 된다.

개별 캠페인의 비율을 단순 평균하는 것과는 분모와 분자의 기준이 다르므로 결과가 달라질 수 있다.

---

### 5. HAVING을 활용한 플랫폼 필터링

집계된 결과에 조건을 적용할 때는 `HAVING`을 사용할 수 있다.

예를 들어 주요 이벤트율이 10% 이상인 플랫폼만 확인할 수 있다.

    SELECT
        platform,
        SUM(sessions) AS total_sessions,
        SUM(key_events) AS total_key_events,
        SUM(key_events) / SUM(sessions) * 100 AS key_event_rate
    FROM ga4_data
    GROUP BY platform
    HAVING SUM(key_events) / SUM(sessions) * 100 >= 10;

`WHERE`는 그룹화하기 전 개별 데이터를 필터링하고,

`HAVING`은 `GROUP BY` 이후 집계된 결과를 기준으로 필터링한다.

---

### 6. CTE + Window Function

플랫폼별 주요 이벤트율을 계산한 뒤 해당 결과를 다시 순위화할 수 있다.

이처럼 분석 과정을 단계별로 나누기 위해 CTE를 사용할 수 있다.

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

분석 흐름:

`원본 데이터`

↓

`플랫폼별 집계`

↓

`주요 이벤트율 계산`

↓

`CTE로 결과 저장`

↓

`Window Function으로 순위 계산`

CTE를 사용하면 복잡한 분석 과정을 단계별로 나누어 작성할 수 있어 가독성과 관리가 편해진다.

---

### 7. 플랫폼별 최고 효율 캠페인 찾기

플랫폼별로 주요 이벤트율이 가장 높은 캠페인을 하나씩 선정하려면 `PARTITION BY`와 `ROW_NUMBER()`를 조합할 수 있다.

분석 흐름:

`원본 데이터`

↓

`주요 이벤트율 계산`

↓

`플랫폼별 구분`

↓

`ROW_NUMBER()로 순위 부여`

↓

`1위 캠페인 추출`

예시:

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

`PARTITION BY platform`을 사용하면 플랫폼별로 순위를 다시 시작할 수 있다.

`ROW_NUMBER()`를 사용하면 각 플랫폼에서 1위 캠페인을 하나씩 선정할 수 있다.

---

## GA4 광고 분석 관점

실제 광고 성과를 분석할 때는 단순히 세션 수나 주요 이벤트 수가 높은 캠페인을 좋은 캠페인이라고 판단하면 안 된다.

예를 들어 다음과 같은 지표를 함께 확인할 수 있다.

- Sessions
- Key Events
- Key Event Rate
- Bounce Rate
- 광고비
- CPA
- ROAS
- 유효전환율
- 전환의 품질
- 실제 상담 및 계약으로 이어지는 비율

예를 들어 세션 수가 많지만 주요 이벤트율이 낮고 이탈률이 높다면 많은 방문자를 확보했더라도 실제 광고 효율은 낮을 수 있다.

반대로 세션 수는 적지만 주요 이벤트율이 높다면 적은 유입으로도 높은 전환 효율을 보이고 있을 가능성이 있다.

다만 최종적인 광고 성과 판단을 위해서는 실제 전환의 질, 광고비, 매출 등의 추가 데이터가 필요하다.

---

## 오늘 배운 핵심 정리

    주요 이벤트율
    → key_events / sessions × 100

    GROUP BY
    → 플랫폼별 또는 캠페인별 데이터 집계

    SUM()
    → 세션 및 주요 이벤트 등의 합계 계산

    HAVING
    → GROUP BY 이후 집계 결과에 조건 적용

    CTE
    → 복잡한 분석 과정을 단계별로 구성

    RANK()
    → 공동 순위를 허용하면서 순위 부여

    PARTITION BY
    → 특정 기준별로 Window Function 계산 범위 분리

    ROW_NUMBER()
    → 각 그룹에서 고유한 순번 부여

    ORDER BY
    → 결과 정렬

    분석 지표
    → 단순한 숫자가 아니라 비교 가능한 효율 지표 생성

---

## 오늘의 핵심 문장

> 광고 성과 분석에서는 단순히 숫자가 높은 데이터를 찾는 것이 아니라, 유입량과 전환 효율을 함께 비교하여 실제 성과를 판단해야 한다.

---

## 실무 연결

오늘 배운 SQL은 실제 GA4 광고 데이터 분석과 연결할 수 있다.

법무법인 홈페이지의 광고 데이터를 분석할 때 다음과 같은 질문을 SQL로 구현할 수 있다.

- 어떤 플랫폼에서 유입이 가장 많은가?
- 어떤 플랫폼의 주요 이벤트율이 가장 높은가?
- 어떤 캠페인의 유입 대비 전환 효율이 높은가?
- 각 플랫폼에서 가장 효율적인 캠페인은 무엇인가?
- 유입량은 많지만 전환 효율이 낮은 캠페인은 무엇인가?
- 전환율은 높지만 실제 전환의 질이 낮은 캠페인은 무엇인가?

따라서 SQL은 단순히 데이터를 조회하는 도구가 아니라,

**원본 데이터 → 지표 계산 → 비교 → 순위화 → 의사결정**

으로 이어지는 분석 과정에서 활용할 수 있다.