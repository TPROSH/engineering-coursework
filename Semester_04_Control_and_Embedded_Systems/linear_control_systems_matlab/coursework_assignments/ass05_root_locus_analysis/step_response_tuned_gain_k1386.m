K = 1386; %18*77
s = tf('s');
G = 1/(s*(s+7)*(s+11));
step(feedback(K*G, 1));
title('Step Response at K = 1386');
grid on;