K = 2;
s = tf('s');
G = (s^2 - 4*s + 20)/((s+2)*(s+4));
step(feedback(K*G, 1))
title('Step Response for K = 2');
grid on;