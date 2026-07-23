# Day04 - LEFT JOIN



> 📅 \*\*Study Date\*\* : 2026.07.11

>

> 📖 \*\*Topic\*\* : LEFT JOIN



\---



\# 📌 학습 목표



\- LEFT JOIN의 개념을 이해한다.

\- INNER JOIN과의 차이를 이해한다.

\- NULL이 발생하는 이유를 이해한다.

\- 실무에서 LEFT JOIN을 사용하는 이유를 이해한다.



\---



\# 📚 핵심 문법



\## 1. LEFT JOIN



```sql

SELECT \*

FROM customers

LEFT JOIN loans

ON customers.customer\_id = loans.customer\_id;

```



\- LEFT 테이블의 모든 데이터를 조회한다.

\- 오른쪽 테이블에 값이 없으면 NULL이 출력된다.



\---



\## 2. INNER JOIN과 비교



| INNER JOIN | LEFT JOIN |

|------------|-----------|

| 공통 데이터만 조회 | 왼쪽 테이블 전체 조회 |

| 일치하지 않는 데이터 제외 | 일치하지 않으면 NULL |



\---



\## 3. NULL



NULL은



> 값이 없는 것이 아니라 \*\*존재하지 않는 값\*\*이다.



예시



| customer | loan |

|-----------|------|

| Kim | O |

| Lee | O |

| Park | NULL |



\---



\# 💼 실무 예시



회원 전체를 조회하면서 주문 여부도 함께 조회



```sql

SELECT \*

FROM members

LEFT JOIN orders

ON members.member\_id = orders.member\_id;

```



주문하지 않은 회원도 함께 확인할 수 있다.



\---



\# 🎯 핵심 정리



\- INNER JOIN → 공통 데이터만 조회

\- LEFT JOIN → 왼쪽 테이블 전체 조회

\- 값이 없으면 NULL

\- 실무에서는 RIGHT JOIN보다 LEFT JOIN을 더 많이 사용한다.



\---



\# 🧠 오늘 배운 개념



\- LEFT JOIN

\- NULL

\- INNER JOIN과의 차이

\- 실무 활용



\---



\# 🎯 한 줄 정리



> LEFT JOIN은 왼쪽 테이블을 기준으로 모든 데이터를 조회하며, 연결되는 데이터가 없으면 NULL을 출력한다.

