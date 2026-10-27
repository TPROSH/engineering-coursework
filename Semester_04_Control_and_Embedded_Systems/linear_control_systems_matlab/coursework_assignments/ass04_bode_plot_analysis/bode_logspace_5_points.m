clc;
w =logspace(-1, 1, 5); 
s = tf('s'); 
G =(s+1)/(0.1*s+1); 
[mag , phase , w] = bode(G, w)
