#1 Performing different operation list containing colours 
list = ["blue","green","yellow"]
print("\nList = ", list)
print("\nAccessing the items from the list = ")
for i in range(3):
    print(list[i])

list[1]="orange"
print("Updated list after changing / replacing an element = ",list)

list.append("white")
print("\nUpdated list after using append = ",list)

list.insert(1 , "Gray")
print("\nUpdated list after using insert = ",list)

tuple = "Black","cyan"
list.extend(tuple)
print("\nUpdated list after using extend = ",list)

list.pop(1)
list.remove("Black")
print("\nUpdated list after using pop and remove = ",list)

list.clear()
print("\nUpdated list after clearing all element = ",list)