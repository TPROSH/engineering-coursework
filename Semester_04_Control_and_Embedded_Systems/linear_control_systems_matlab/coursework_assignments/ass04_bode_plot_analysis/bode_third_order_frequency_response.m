clc;
s=tf('s'); 
G=(10)/((s)*(0.02*s+1)*(1+0.2*s)); 
[GM,PM,wg,wphi]=margin(G)
bode(G)