%root locus
s=tf('s');
G=(s+1)/(s*((0.1*s)-1));
rlocus(G)
grid on;
axis equal;
hold on;;

