#6 to find second largest number in a list with use of ‘set’ function.
L = [1,2,3,4,5,6,7,8,9]
S = set(L)
print(S)
max = L[0]
d = sorted(list(S))
for i in S:
    if i>max:
        max = i
S.remove(max)
max = L[0]
for i in S:
    if i>max:
        max = i
        
print("Second largest number in list = ",max)
print("Second largest number in list = ",d[-2])