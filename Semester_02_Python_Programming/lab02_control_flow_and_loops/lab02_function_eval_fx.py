#Calculatinf f[x] for each value of x 
a = eval(input("Enter a number = "))
b = eval(input("Enter a number = "))
c = eval(input("Enter a number = "))
d = (a+b+c)/3
x = {10,20,25,30,40}

def f1():
    for i in x:
        if i==d:
            print(f"For the value of x = {i}, f[x] = {0}")
        else:
            print(f"For the value of x = {i}, f[x] = {a*i*i + b*i + c}")
f1()