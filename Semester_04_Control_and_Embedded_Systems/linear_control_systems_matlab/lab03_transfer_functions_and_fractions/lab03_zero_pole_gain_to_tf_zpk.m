% ques 5 on mam pdf

z = [];
p = [-1+2j,1-2j];
k = 10;
[n , d] = zp2tf(z,p,k);
printsys(n,d)

[n1 , d1] = zp2tf([0],[-1+2j,1-2j],12);
tf(n1 , d1)

[n2 , d2] = zp2tf([-1],[-2,-4,-8],12);
tf(n2 , d2)
