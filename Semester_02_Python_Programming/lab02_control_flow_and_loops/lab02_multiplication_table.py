#To display multiplication table

a = int(input("Enter a number = "))
print(f"Multiplication table of {a} is ")
for i in range(10):
    print(f"{a} x {i+1} = {a*(i+1)}")