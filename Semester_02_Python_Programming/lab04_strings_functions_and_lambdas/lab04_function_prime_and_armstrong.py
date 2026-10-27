#14 to check whether a number is prime, Armstrong using functions.
N = int(input("enter a number = "))
def prime(n):
    count = 0
    for i in range(1,n):
        if n%i == 0:
            count+=1
    if count == 1:
        return True
    else:
        return False
def armstrong(n):
    L = []
    count = 0
    for i in str(n):
        L.append(int(i))
    for i in L:
        count += (i)**len(L)
    if count == n:
        return True
    else:
        return False
if prime(N) == True:
    print("prime")
if armstrong(N) ==  True:
    print("armstrong")
else:
    print("neither prime nor armstrong")