s = tf('s');
G = (s+1);
[mag , phase , w] = bode(G);

bode(G);       