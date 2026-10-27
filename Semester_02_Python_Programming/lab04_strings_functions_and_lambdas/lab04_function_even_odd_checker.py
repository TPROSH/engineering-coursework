#13 to check whether a number is even or odd using functions
N = int(input("enter a number = "))
def even_odd(n):
    if n%2==0:
        return "even"
    else:
        return "odd"
print(even_odd(N))