# Day13 - CASE WHEN

> 📅 Study Date : 2026.07.22
>
> 📖 Topic : SQL CASE WHEN

---

# 📌 학습 목표

- CASE WHEN 문법의 구조를 이해한다.
- 조건에 따라 데이터를 분류하는 방법을 익힌다.
- 실무에서 데이터 등급화와 범주화에 활용할 수 있다.

---

# 📚 핵심 개념

## CASE WHEN

조건에 따라 서로 다른 결과를 반환하는 조건문이다.

엑셀의 **IF 함수**와 비슷한 역할을 한다.

```sql
SELECT name,
       CASE
           WHEN salary >= 6000 THEN 'A'
           WHEN salary >= 4000 THEN 'B'
           ELSE 'C'
       END AS grade
FROM employees;
```

---

# 🔍 CASE WHEN 실행 순서

1. CASE 시작
2. WHEN 조건 확인
3. 조건이 참이면 THEN 실행
4. 모든 조건이 거짓이면 ELSE 실행
5. END로 종료

---

# 💼 실무 활용

CASE WHEN은 데이터를 범주별로 구분할 때 자주 사용한다.

대표적인 예시는 다음과 같다.

- 급여 등급 분류
- 고객 등급 분류
- 광고 성과 등급 분류
- 주문 상태 표시
- 회원 등급 생성

---

# 💡 실무 예제

급여를 기준으로 직원 등급을 표시한다.

```sql
SELECT name,
       salary,
       CASE
           WHEN salary >= 6000 THEN 'High'
           WHEN salary >= 4000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_grade
FROM employees;
```

결과 예시

| name | salary | salary_grade |
|------|-------:|--------------|
| Kim | 6500 | High |
| Lee | 4700 | Medium |
| Park | 3200 | Low |

---

# 📌 CASE WHEN과 WHERE의 차이

| CASE WHEN | WHERE |
|-----------|-------|
| 데이터를 분류한다. | 데이터를 필터링한다. |
| 새로운 컬럼 생성 가능 | 조건에 맞는 행만 조회 |
| SELECT 절에서 자주 사용 | WHERE 절에서 사용 |

---

# 🎯 핵심 정리

- CASE WHEN : 조건에 따라 값을 변경하거나 분류
- WHEN : 조건
- THEN : 조건이 참일 때 반환할 값
- ELSE : 모든 조건이 거짓일 때 반환할 값
- END : CASE 종료

---

# 🧠 오늘 배운 개념

- CASE WHEN
- WHEN
- THEN
- ELSE
- END
- AS

---

# 📌 실무 TIP

CASE WHEN은 데이터를 사람이 이해하기 쉬운 형태로 변환할 때 가장 많이 사용하는 문법 중 하나이다.

예를 들어 숫자로 저장된 점수를 "우수", "보통", "미흡"과 같이 표시하거나, 광고 전환 수를 "High", "Medium", "Low" 등급으로 나누어 보고서를 작성할 때 자주 활용된다.

---

# 🎯 한 줄 정리

> CASE WHEN은 조건에 따라 데이터를 분류하여 보고서와 분석 결과를 더욱 직관적으로 만들어 주는 SQL 조건문이다.