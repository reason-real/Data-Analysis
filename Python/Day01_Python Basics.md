# Day1 - Python Basics

# 1. print()
print("Python Start!")


# 2. Variables
campaign = "민사_A"
sessions = 1000
key_events = 120


# 3. Print variables
print(campaign)
print(sessions)
print(key_events)


# 4. Data Types
rate = 12.5
platform = "Naver"
is_active = True

print(type(sessions))
print(type(rate))
print(type(platform))
print(type(is_active))


# 5. Calculate key event rate
key_event_rate = key_events / sessions * 100

print(key_event_rate)


# 6. Advertising data
platform = "Naver"
campaign = "민사_A"
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

print("Platform:", platform)
print("Campaign:", campaign)
print("Sessions:", sessions)
print("Key Events:", key_events)
print("Key Event Rate:", key_event_rate)