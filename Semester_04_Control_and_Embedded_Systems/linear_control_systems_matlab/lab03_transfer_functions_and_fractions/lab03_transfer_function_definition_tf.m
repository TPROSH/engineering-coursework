n = [4 16 12];
d = [1 12 44 48];

a = tf(n,d) %transfer function
[z,p,k] = tf2zp(n,d)
pzmap(a)