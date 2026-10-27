b_s = [2 5 3 6];
a_s = [1 6 11 6];
[z,p,k] = tf2zp(b_s,a_s)
printsys(b_s,a_s)
[num , den] = zp2tf(z,p,k)