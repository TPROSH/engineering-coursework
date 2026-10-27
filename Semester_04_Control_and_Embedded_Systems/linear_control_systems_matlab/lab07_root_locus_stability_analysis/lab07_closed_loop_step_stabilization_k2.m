s=tf('s');
G=(s+1)/(s*((0.1*s)-1));
K = [2];
step(feedback(K(1) * G, 1),5);
