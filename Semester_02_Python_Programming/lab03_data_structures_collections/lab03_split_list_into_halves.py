#2 to split the list in half and store elements in two different lists
list = ['blue', 'Gray', 'yellow','orange', 'white', 'Black', 'cyan']
length = len(list)
list1 = []
list2 = []
print(length)
if length%2==0:
    for i in range(length//2):
        list1.append(list[i])
        list2.append(list[i+(length//2)])
else:
    for i in range((length+1)//2):
        list1.append(list[i])
        list2.append(list[i+(length//2)])
print(f"list 1 = {list1}\nlist 2 = {list2}")