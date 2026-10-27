#Write a program to reverse an array

from array import array

arr = [1,2,3,4,5,7]
a = len(arr)
new_arr = [0]*a

for i in range(len(arr)):
    new_arr[i] = arr[a-1]
    a-=1

print(new_arr)
