#To find a factorial of user entered number 
import math 

number = int(input("Enter a number to get its Factorial:- "))
print(f"Factorial of given number :- {math.factorial(number)}")

temp = number
c = 1
for i in range(temp):
    c = c * temp
    temp = temp - 1
print(f"Factorial of given number :- {c}")