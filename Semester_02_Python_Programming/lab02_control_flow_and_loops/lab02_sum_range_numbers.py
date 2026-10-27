#12 To calculate sum of all numbers within given range
a = int(input("Enter a number = "))
c = 0
for i in range(a):
    c+=(i+1)
print(f"Sum of all numbers from 1 to {a} = {c}")