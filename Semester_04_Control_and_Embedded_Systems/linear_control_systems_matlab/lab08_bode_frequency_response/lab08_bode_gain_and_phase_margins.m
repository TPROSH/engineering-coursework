clc;

s = tf('s');
G = 10/((s)*(0.2*s+1)*(0.02*s+1));
[GM,PM,wg,wphi] = margin(G)

bode(G);