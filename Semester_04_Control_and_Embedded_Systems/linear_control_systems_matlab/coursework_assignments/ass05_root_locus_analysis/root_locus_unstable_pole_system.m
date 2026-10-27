clc;
s = tf('s');
G = (s+1)/(s*(0.1*s - 1));
rlocus(G);
title('Root Locus of G(s) = (s+1)/(s(0.1s - 1))');
grid on;