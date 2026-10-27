clc
G1_n = [10];
G1_d = [1 2 10];
G2_n = [5];
G2_d = [0 1 2];

[num1, den1] = series(G1_n, G1_d, G2_n, G2_d);
[num2, den2] = parallel(G1_n, G1_d, G2_n, G2_d);
[num3, den3] = feedback(G1_n, G1_d, G2_n, G2_d);
a = tf(num1,den1);
printsys(num1, den1)
printsys(num2, den2)
printsys(num3, den3)
pzmap(a)