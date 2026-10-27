s=tf('s');
G=1/(s*(s+7)*(s+11));

K= 860;
step(feedback(K*G,1),5)