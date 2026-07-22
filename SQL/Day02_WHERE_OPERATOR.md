\# Day02 - WHERE 심화 (비교 연산자, 논리 연산자, BETWEEN, IN, LIKE)



\## 📌 학습 목표



\- WHERE 절에서 다양한 조건을 사용하는 방법을 이해한다.

\- 비교 연산자와 논리 연산자를 사용할 수 있다.

\- BETWEEN, IN, LIKE를 활용하여 원하는 데이터를 조회할 수 있다.



\---



\## 📚 핵심 문법



\### 1. 비교 연산자



```sql

SELECT \*

FROM employees

WHERE salary >= 4000;

```



비교 연산자를 사용하여 조건에 맞는 데이터만 조회한다.



사용 가능한 비교 연산자



\- =

\- !=

\- >

\- <

\- >=

\- <=



\---



\### 2. AND



```sql

SELECT \*

FROM employees

WHERE department = 'Finance'

AND salary >= 5000;

```



모든 조건을 만족하는 데이터만 조회한다.



\---



\### 3. OR



```sql

SELECT \*

FROM employees

WHERE department = 'Marketing'

OR department = 'HR';

```



조건 중 하나만 만족해도 조회한다.



\---



\### 4. BETWEEN



```sql

SELECT \*

FROM employees

WHERE salary BETWEEN 3500 AND 5000;

```



특정 범위를 조회할 때 사용한다.



\---



\### 5. IN



```sql

SELECT \*

FROM employees

WHERE department IN ('Finance', 'Marketing');

```



여러 개의 값을 한 번에 조회할 때 사용한다.



\---



\### 6. LIKE



```sql

SELECT \*

FROM employees

WHERE name LIKE 'K%';

```



문자열 패턴을 검색할 때 사용한다.



자주 사용하는 패턴



\- 'K%' → K로 시작

\- '%K' → K로 끝남

\- '%K%' → K가 포함됨



\---



\## 💡 핵심 개념



| 문법 | 역할 |

|------|------|

| WHERE | 조건 필터링 |

| AND | 모든 조건 만족 |

| OR | 하나 이상 조건 만족 |

| BETWEEN | 범위 조회 |

| IN | 여러 값 조회 |

| LIKE | 문자열 패턴 검색 |



\---



\## 📝 배운 점



\- WHERE 절에서는 다양한 조건을 조합할 수 있다.

\- BETWEEN은 범위를 조회할 때 가독성이 좋다.

\- IN은 OR를 여러 번 사용하는 것보다 효율적이다.

\- LIKE를 사용하면 문자열 검색을 쉽게 수행할 수 있다.



\---



\## 📚 학습 키워드



`WHERE`

`AND`

`OR`

`BETWEEN`

`IN`

`LIKE`

