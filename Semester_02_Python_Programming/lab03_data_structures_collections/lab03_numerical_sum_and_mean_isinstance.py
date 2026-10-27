#5 to find sum and mean of only numerical values contained in a list with use of ‘isinstance’ function.
list = ['blue',9, 'Gray', 9,'yellow',9,'orange',9]
length = len(list)
c = d = 0
for i in range(length):
    if isinstance(list[i],int) == True:
        c += list[i]
        d += 1
print(f"Sum = {c}\nMean = {c/d}")