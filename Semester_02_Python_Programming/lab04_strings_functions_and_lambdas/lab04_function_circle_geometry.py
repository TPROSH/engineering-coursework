#11 to find diameter, circumference and area of circle using functions.
import math
R = float(input("Enter radius of circle = "))
def diameter(r):
    return 2*r
def circumference(r):
    return 2*math.pi*r
def area(r):
    return math.pi*r*r

print("diamtere = " ,diameter(R))
print("circumference = ",circumference(R))
print("area = ",area(R))