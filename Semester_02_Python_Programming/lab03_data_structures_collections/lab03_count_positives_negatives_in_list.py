#7 to count positive and negative numbers in a list.
list = [1,2,3,4,5,6,7,8,9]
pos = neg = zero = 0

for i in list:
    if i>0:
        pos+=1
    elif i == 0:
        zero+=1
    else:
        neg+=1
print(f"Number of positive numbers = {pos}\nNumber of negative numbers = {neg}\nNumber of zeroes = {zero}")