#17 to check whether a number is palindrome or not using functions.
N = int(input("enter a number = "))
def palindrome(n):
    L = []
    count = 0
    for i in str(n):
        L.append(i)
    for i in range(len(L)):
        if (L[i]!=L[-(i+1)]):
            count += 1
    if count == 0:
        print("palindrome")
    else:
        print("not palindrome")
palindrome(N)