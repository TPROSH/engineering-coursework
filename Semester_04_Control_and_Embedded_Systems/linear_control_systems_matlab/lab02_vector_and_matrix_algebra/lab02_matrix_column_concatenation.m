clc
x = 0:1:100
y1 = 4*x
y2 = 5*x

z = [x' y1' y2']
length(z)
size(z)
spy(z)