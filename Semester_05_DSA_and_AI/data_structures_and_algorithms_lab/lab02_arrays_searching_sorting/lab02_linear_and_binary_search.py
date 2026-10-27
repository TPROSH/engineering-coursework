#Write a program for linear search and binary search

List = [1,2,3,4,5,6,7,8,9]
length = len(List)

search = 6

#linear search
for i in range(length-1):
    if List[i] == search:
        print("element found")
        print(i)
        break
else:
    print("element not found")



#binary search
List.sort() 
low = 0
high = length-1

while low<=high:
    mid = (low+high)//2

    if List[mid] == search:
        print("element found")
        print(mid)
        break

    elif List[mid]<search:
        low = mid + 1

    elif List[mid]>search:
        high = mid - 1
else:
    print("element not found")


    