#to create a list of tuples from given list having number and its cube in each tuple
L = [1,2,3,4]
output = []
for i in L:
    tup = (i , i*i*i)
    output.append(tup)
print(output)