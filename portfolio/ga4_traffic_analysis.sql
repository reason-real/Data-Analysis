-- [프로젝트] GA4 & BigQuery 기반 유입 소스별 이벤트 분석
-- 작성 목적: 네이버 등 주요 유입 경로(traffic_source)에 따른 사용자 행동 패턴 및 이벤트 발생 빈도 파악
-- 주요 활용 문법: SELECT, WHERE (_TABLE_SUFFIX), GROUP BY, UNNEST (중첩 배열 해제)
-- 주요 인사이트: m.search.naver.com을 통한 모바일 검색 유입이 페이지 조회(page_view) 및 세션 시작에 기여하는 비중 확인

SELECT 
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'source') AS traffic_source,
    event_name,
    COUNT(1) AS event_count
FROM 
    `analytics_469096178.events_*`
WHERE 
    _TABLE_SUFFIX = FORMAT_DATE('%Y%m%d', DATE_SUB(CURRENT_DATE(), INTERVAL 2 DAY))
GROUP BY 
    traffic_source,
    event_name
ORDER BY 
    event_count DESC
LIMIT 5;
