s=tf('s'); 
G=(10)/((s)*(0.02*s+1)*(1+0.2*s)); 
grid on;
bode(G)