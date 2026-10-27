#18 to find factorial of any number using functions.
N = int(input("enter a number = "))
def factorial(n):
    count = 1
    for i in range(1,n+1):
        count *= i
    return count
print("factorial = ",factorial(N))