num = [1 2];
den = [1 0 -1];
G = tf(num, den);
nyquist(G);
[GM PM wg wphi]= margin(G)
grid on;