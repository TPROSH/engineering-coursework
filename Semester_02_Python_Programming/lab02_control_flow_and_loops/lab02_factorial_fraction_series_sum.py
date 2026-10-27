#To find sum of 1+(2/2!)+(3/3!)+....to n terms

import math
a = int(input("Enter a number = "))
c = 0
print(f"sum of 1+(2/2!)+(3/3!)+....to {a} terms =", end = " ")
for i in range(a):
    c += (i+1)/(math.factorial(i+1))
print(c)