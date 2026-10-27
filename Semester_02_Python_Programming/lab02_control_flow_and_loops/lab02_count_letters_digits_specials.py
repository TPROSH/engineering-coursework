#14 To calculate no of letter, digits , special characters in string
a = input("Enter a string = ")
dgt = 0
ltrs = 0
spc = 0
length = len(a)

for i in range(length):
    if a[i]>="0" and a[i]<="9":
        dgt+=1
    elif a[i]>="a" and a[i]<="z":
        ltrs+=1
    elif a[i]>="A" and a[i]<="Z":
        ltrs+=1
    else:
        spc+=1
print(f"\nNumber of digits = {dgt}")
print(f"Number of letters = {ltrs}")
print(f"Number of special characters = {spc}")