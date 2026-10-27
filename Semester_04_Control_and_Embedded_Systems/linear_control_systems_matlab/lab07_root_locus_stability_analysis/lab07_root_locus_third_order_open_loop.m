%root locus
s=tf('s');
G=1/(s*(s+7)*(s+11));
rlocus(G)
axis equal;