clc; 
s = tf('s');
G = 1/(s*(s+7)*(s+11));
rlocus(G);
title('Root Locus of G(s) = K / [s(s+7)(s+11)]');
grid on;