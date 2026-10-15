SELECT
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'source') AS traffic_source, event_name,
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