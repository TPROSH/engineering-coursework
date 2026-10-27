# To perform airthemetic opertions on complex numbers 
import math

one = complex(input("Enter a complex number = "))
two = complex(input("Enter another complex number = "))

print(f"Addition = {(one+two)}")
print(f"Subtraction = {one-two}")
print(f"Multiplication = {one*two}")
print(f"Division = {one/two}")

a = float(input("\nEnter Real part of First number:- "))
b = float(input("Enter IMG part of First number:- "))
c = float(input("\nEnter Real part of Second number:- "))
d = float(input("Enter IMG part of Second number:- "))

mag = math.sqrt((a*a + b*b)/(c*c + d*d))
angle = (math.atan(b/a))-(math.atan(d/c))
print(f"Addition = {a+c} + {b+d}i")
print(f"Subtraction = {a-c} + {b-d}i")
print(f"Multiplication = {a*c - b*d} + {a*d + b*c}i")
print(f"Division = {mag * math.cos(angle)} + {mag * math.sin(angle)}i")
