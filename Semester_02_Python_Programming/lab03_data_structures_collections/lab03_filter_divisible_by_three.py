#3 to Display numbers divisible by 3 from a list of [1,2,3,....,50]
list = []
for i in range(50):
    list.append(i+1)
    
print("Numbers divisible by 3 = ",end="")
for i in list:
     if i%3==0:
        print(i, end = ",")