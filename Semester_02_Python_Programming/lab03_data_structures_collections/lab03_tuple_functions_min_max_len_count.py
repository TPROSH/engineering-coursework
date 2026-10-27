#10 to demonstrate the use of various functions on a tuple, including `min ()`,`max ()`, `len ()`, `count ()` and sum().
tup = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
minimum = min(tup)
maximum = max(tup) 
length = len(tup)
countt = tup.count(10)
add = sum(tup)

print(f"Max = {maximum}\nMin = {minimum}\nlength = {length}\ncount = {countt}\nSum = {add}")