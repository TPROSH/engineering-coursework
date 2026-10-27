import math

print("Value of e^3 = {:.2f}".format(math.exp(3)))
def airthmetic():
    print(f"\nGreatest common divisor of 48 and 180 = {math.gcd(48,180)}")
    r1 = math.radians(90)
    print(f"Sine of 90 = {math.sin(r1)}")
    r2 = math.radians(60)
    print(f"Cosine of 60 = {math.cos(r2)}")
    r3 = math.radians(45)
    print(f"Tangent of 45 = {math.tan(r3)}")
    r4 = math.radians(180)
    print(f"Angle 180 into radians = {r4}")
def exponential():
    print(f"\nNatural logarith of 20 = {math.log(20)}")
    print(f"Base 10 logarith of 1000 = {math.log10(1000)}")
    print(f"Value of e^3 = {math.exp(3)}")
def rounding():
    print(f"\nRounding the number 7.856 to nearest integer = {round(7.856)}")
    print(f"Floor value of 12.78 = {math.floor(12.78)}")
    print(f"Ceiling value of 12.78 = {math.ceil(12.78)}")
    print(f"Absolute value of -45.67 = {abs(-45.67)}")
def constants():
    print(f"\nValue of pi = {math.pi} and e = {math.e}")
    print(f"Area of circle of radius 7 = {math.pi*7*7}")
def advanced():
    print(f"\nFactorial of 7 = {math.factorial(7)}")
    print(f"Combination for n(10) and r(3) = {math.comb(10,3)}")
    print(f"Hypotensue of right triangle with sides 3 and 4 = {math.hypot(3,4)}")
    print(f"Distance travelled by a falling object after 5 seconds = {0.5*9.8*5*5}")

def execute():
    airthmetic()
    exponential()
    rounding()
    constants()
    advanced()
execute()