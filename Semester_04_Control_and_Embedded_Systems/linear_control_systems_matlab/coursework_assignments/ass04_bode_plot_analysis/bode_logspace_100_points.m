w =logspace(0, 3, 100); 
s = tf('s'); 
G =(s+1)/(0.1*s+1); 
grid on;
bode(G, w);