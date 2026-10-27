#4 to Create a list that is populated with the all even numbers between 1 to 1000.
list = []
for i in range(1000):
    if i%2 == 0:
        pass
    else:
        list.append(i+1)
print("List containing even numbers  = ",list,end="")
