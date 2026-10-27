K = 1.449;
s = tf('s');
G = (s+1)/(s*(0.1*s - 1));
figure (1);
rlocus(G)

figure (2);
step(feedback(K*G, 1));
title('Step Response for K = 1.449');
grid on;