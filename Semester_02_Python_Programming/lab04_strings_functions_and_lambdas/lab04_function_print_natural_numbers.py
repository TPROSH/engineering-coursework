#16 to print all natural numbers between 1 to n using functions
N = int(input("enter a number = "))
def natural(n):
    for i in range(n):
        print(i+1 , end = " ")
natural(N)