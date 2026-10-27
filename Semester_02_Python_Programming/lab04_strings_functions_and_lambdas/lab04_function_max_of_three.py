#12 to find the maximum of three numbers.
a = int(input("enter a number = "))
b = int(input("enter a number = "))
c = int(input("enter a number = "))
def maximum(d,e,f):
    if d>e and e>f:
        return d
    elif e>d and d>f:
        return e
    else:
        return f
print("Maximum os these numbers = ",maximum(a,b,c)) 