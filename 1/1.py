# Project Euler #1

sumnum = 0
num    = 1000

for i in range(num):
    if i % 3 == 0:
        sumnum += i
    elif i % 5 == 0:
        sumnum += i

print( sumnum )
