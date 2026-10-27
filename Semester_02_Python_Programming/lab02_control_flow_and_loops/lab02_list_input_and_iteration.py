#13 To display numbers from a list using for loop
a = int(input("Enter how many numbers u want to enter in a list = ")) 
List = []
for i in range(a):
    c = int(input(f"Enter element number {i+1} = "))
    List.append(c)
print("Numbers in List = ",end = "")
for i in List:
    print(i,end = " , ")