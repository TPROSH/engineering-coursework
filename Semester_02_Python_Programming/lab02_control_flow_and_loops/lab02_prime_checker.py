#To check if number is prime or not
a = int(input("Enter a number = "))
c = 0
for i in range(a):
    if  a%(i+1)==0:
        c+=1
    else:
        pass

if c == 2:
    print("Number is prime.")
else:
    print("Number is not prime.")
        
