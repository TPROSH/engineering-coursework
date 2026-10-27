#to get area and perimeter of rectangle,square and traingle 
import math
a = int(input("Enter side of the square :- "))
b = int(input("Enter side of the triangle :- "))
c = float(input("Enter length of rectangle :- "))
d = float(input("Enter width of rectangle :- "))

print(f"\nArea of square is {a*a}\nPerimeter of square is {4*a}")
print(f"\nArea of triangle is {(math.pow(3,0.5)*b*b)/4}\nPerimeter of triangle is {3*b}")
print(f"\nArea of rectangle is {c*d}\nPerimeter of rectangle is {2*(c+d)}")