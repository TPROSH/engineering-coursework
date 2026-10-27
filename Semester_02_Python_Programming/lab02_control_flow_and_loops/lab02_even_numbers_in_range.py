#To print all even numbers within given range
a = int(input("Enter a number = ")) 
print(f"All even numbers within range of {a} = ")
for i in range(a):
    if (i+1)%2 == 0:
        print(i+1)
