s = tf('s');
G = 1 / (s^2 + 0.8*s + 1);
nyquist(G)