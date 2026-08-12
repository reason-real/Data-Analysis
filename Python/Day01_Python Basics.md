# \# Day31 - Python 기초 (print, 변수, 자료형)

# 

# \## 📌 학습 목표

# 

# \- Python의 기본적인 문법 구조를 이해한다.

# \- `print()`를 활용하여 데이터를 출력할 수 있다.

# \- 변수를 사용하여 데이터를 저장할 수 있다.

# \- Python의 기본 자료형을 이해한다.

# \- SQL에서 학습한 주요 이벤트율 계산을 Python으로 표현할 수 있다.

# 

# \---

# 

# \## 📚 핵심 문법

# 

# \### 1. `print()`를 활용한 출력

# 

# Python에서 결과를 화면에 출력할 때 `print()` 함수를 사용한다.

# 

# &#x20;   ```python

# &#x20;   print("Python Start!")

# &#x20;   ```

# 

# \- `print()` : 데이터를 화면에 출력

# \- 문자열은 `" "` 또는 `' '`로 감싸서 표현한다.

# 

# \---

# 

# \### 2. 변수

# 

# 변수는 데이터를 저장해두고 이후 계산이나 분석에 활용할 수 있는 공간이라고 이해할 수 있다.

# 

# &#x20;   ```python

# &#x20;   campaign = "민사\_A"

# &#x20;   sessions = 1000

# &#x20;   key\_events = 120

# &#x20;   ```

# 

# \- `campaign` : 캠페인 이름 저장

# \- `sessions` : 세션 수 저장

# \- `key\_events` : 주요 이벤트 수 저장

# 

# SQL에서 데이터를 조회했다면, Python에서는 데이터를 변수에 저장한 후 계산이나 가공에 활용할 수 있다.

# 

# \---

# 

# \### 3. 변수 출력

# 

# 변수에 저장된 값을 `print()`를 이용하여 출력할 수 있다.

# 

# &#x20;   ```python

# &#x20;   print(campaign)

# &#x20;   print(sessions)

# &#x20;   print(key\_events)

# &#x20;   ```

# 

# 결과:

# 

# &#x20;   ```text

# &#x20;   민사\_A

# &#x20;   1000

# &#x20;   120

# &#x20;   ```

# 

# \---

# 

# \### 4. 자료형

# 

# Python에서는 데이터의 형태에 따라 자료형이 구분된다.

# 

# &#x20;   ```python

# &#x20;   sessions = 1000

# &#x20;   rate = 12.5

# &#x20;   platform = "Naver"

# &#x20;   is\_active = True

# &#x20;   ```

# 

# | 값 | 자료형 | 의미 |

# |---|---|---|

# | `1000` | `int` | 정수 |

# | `12.5` | `float` | 실수 |

# | `"Naver"` | `str` | 문자열 |

# | `True` | `bool` | 참 또는 거짓 |

# 

# `type()`을 사용하면 변수의 자료형을 확인할 수 있다.

# 

# &#x20;   ```python

# &#x20;   print(type(sessions))

# &#x20;   print(type(rate))

# &#x20;   print(type(platform))

# &#x20;   print(type(is\_active))

# &#x20;   ```

# 

# \---

# 

# \### 5. Python에서 계산하기

# 

# SQL에서 계산식을 사용했던 것처럼 Python에서도 데이터를 이용하여 새로운 지표를 계산할 수 있다.

# 

# 주요 이벤트율은 다음과 같이 계산할 수 있다.

# 

# &#x20;   ```python

# &#x20;   sessions = 1000

# &#x20;   key\_events = 120

# 

# &#x20;   key\_event\_rate = key\_events / sessions \* 100

# 

# &#x20;   print(key\_event\_rate)

# &#x20;   ```

# 

# 결과:

# 

# &#x20;   ```text

# &#x20;   12.0

# &#x20;   ```

# 

# 주요 이벤트율 공식:

# 

# > 주요 이벤트율 = 주요 이벤트 수 ÷ 세션 수 × 100

# 

# \---

# 

# \### 6. 계산 결과를 변수에 저장하기

# 

# 계산 결과를 새로운 변수에 저장하면 이후 다른 계산이나 분석에서도 활용할 수 있다.

# 

# &#x20;   ```python

# &#x20;   key\_event\_rate = key\_events / sessions \* 100

# 

# &#x20;   print(key\_event\_rate)

# &#x20;   ```

# 

# \- `key\_event\_rate` : 계산된 주요 이벤트율을 저장하는 변수

# 

# \---

# 

# \## 🔗 SQL과 Python의 연결

# 

# Day23\~Day30까지 SQL에서 학습했던 광고 성과 분석을 Python에서도 동일한 분석 관점으로 확장할 수 있다.

# 

# SQL에서는 주요 이벤트율을 다음과 같이 계산했다.

# 

# &#x20;   ```sql

# &#x20;   SELECT

# &#x20;       campaign,

# &#x20;       sessions,

# &#x20;       key\_events,

# &#x20;       key\_events / sessions \* 100 AS key\_event\_rate

# &#x20;   FROM ga4\_data;

# &#x20;   ```

# 

# Python에서는 동일한 계산을 다음과 같이 표현할 수 있다.

# 

# &#x20;   ```python

# &#x20;   campaign = "민사\_A"

# &#x20;   sessions = 1000

# &#x20;   key\_events = 120

# 

# &#x20;   key\_event\_rate = key\_events / sessions \* 100

# 

# &#x20;   print(campaign)

# &#x20;   print(sessions)

# &#x20;   print(key\_events)

# &#x20;   print(key\_event\_rate)

# &#x20;   ```

# 

# 즉,

# 

# > SQL에서는 데이터를 조회하고 계산하는 방법을 배웠다면, Python에서는 데이터를 저장하고 계산하고 가공하는 방법으로 확장해 나갈 수 있다.

# 

# \---

# 

# \## 📊 실제 광고 데이터에 적용

# 

# Day31에서는 실제 GA4 데이터를 분석한다고 생각하고 간단한 광고 데이터를 Python 변수에 저장해보았다.

# 

# &#x20;   ```python

# &#x20;   platform = "Naver"

# &#x20;   campaign = "민사\_A"

# &#x20;   sessions = 1000

# &#x20;   key\_events = 120

# 

# &#x20;   key\_event\_rate = key\_events / sessions \* 100

# 

# &#x20;   print("플랫폼:", platform)

# &#x20;   print("캠페인:", campaign)

# &#x20;   print("세션 수:", sessions)

# &#x20;   print("주요 이벤트 수:", key\_events)

# &#x20;   print("주요 이벤트율:", key\_event\_rate)

# &#x20;   ```

# 

# 결과:

# 

# &#x20;   ```text

# &#x20;   플랫폼: Naver

# &#x20;   캠페인: 민사\_A

# &#x20;   세션 수: 1000

# &#x20;   주요 이벤트 수: 120

# &#x20;   주요 이벤트율: 12.0

# &#x20;   ```

# 

# \---

# 

# \## 💡 핵심 개념

# 

# | 문법 및 개념 | 역할 |

# |---|---|

# | `print()` | 데이터를 화면에 출력 |

# | 변수 | 데이터를 저장하고 활용 |

# | `int` | 정수 |

# | `float` | 실수 |

# | `str` | 문자열 |

# | `bool` | 참 또는 거짓 |

# | `type()` | 자료형 확인 |

# | 계산식 | 새로운 지표 계산 |

# 

# \---

# 

# \## 📝 배운 점

# 

# \- Python에서 `print()`를 사용하면 데이터를 화면에 출력할 수 있다.

# \- 변수에 데이터를 저장하면 이후 계산과 분석에 활용할 수 있다.

# \- Python에서는 데이터의 형태에 따라 `int`, `float`, `str`, `bool` 등의 자료형이 존재한다.

# \- SQL에서 계산했던 주요 이벤트율을 Python에서도 계산할 수 있다.

# \- 앞으로 Python을 활용하여 단순 계산을 넘어 데이터를 불러오고, 가공하고, 분석하는 과정으로 확장할 수 있다.

# 

# \---

# 

# \## 🎯 Day31 분석가 관점

# 

# 오늘은 Python의 가장 기초적인 문법을 학습했다.

# 

# 아직 복잡한 데이터 분석을 수행하는 단계는 아니지만, 앞으로 `pandas`, `numpy`, `matplotlib` 등을 학습하기 위해서는 Python에서 데이터를 변수에 저장하고 계산하는 기본 구조를 이해하는 것이 중요하다.

# 

# 앞으로 실제 GA4와 광고 데이터를 분석할 때는 다음과 같은 흐름으로 확장해 나갈 예정이다.

# 

# &#x20;   ```text

# &#x20;   데이터

# &#x20;   ↓

# &#x20;   Python으로 불러오기

# &#x20;   ↓

# &#x20;   데이터 확인

# &#x20;   ↓

# &#x20;   데이터 전처리

# &#x20;   ↓

# &#x20;   지표 계산

# &#x20;   ↓

# &#x20;   시각화

# &#x20;   ↓

# &#x20;   분석 결과 해석

# &#x20;   ```

# 

# \---

# 

# \## 📚 학습 키워드

# 

# `print()` `variable` `int` `float` `str` `bool` `type()` `calculation` `key\_event\_rate`

