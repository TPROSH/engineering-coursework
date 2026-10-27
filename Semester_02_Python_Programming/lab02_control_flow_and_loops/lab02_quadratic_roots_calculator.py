#To calculate root of quadratic equation
import math
print("Quadratic equation = ax^2 + bx + c = 0")
a = int(input("Enter the value of a = "))
b = int(input("Enter the value of b = "))
c = int(input("Enter the value of c = "))

d = ((b*b)-(4*a*c))
if d>0:
    print("\nRoots are real and unequal.")
    print(f"First Root = {(-b+(math.pow(d,0.5)))/(2*a)}")
    print(f"Second Root = {(-b-(math.pow(d,0.5)))/(2*a)}")
elif d==0:
    print("\nRoots are real and equal.")
    print(f"First Root = {(-b+(math.pow(d,0.5)))/(2*a)}")
    print(f"Second Root = {(-b-(math.pow(d,0.5)))/(2*a)}")
else:
    print("\nRoots are Complex and unequal.")
    print(f"First Root = {(-b/(2*a))} + {(math.pow(-d,0.5))/(2*a)} i")
    print(f"Second Root = {(-b/(2*a))} - {(math.pow(-d,0.5))/(2*a)} i")
    
if d<0:
    real = -b/(2*a)
    img = (math.pow(-d , 0.5))/(2*a)
    print("\nRoots are Complex and unequal.")
    print(f"First Root = {complex(real , img)}")
    print(f"Second Root = {complex(real , -img)}")
    
    