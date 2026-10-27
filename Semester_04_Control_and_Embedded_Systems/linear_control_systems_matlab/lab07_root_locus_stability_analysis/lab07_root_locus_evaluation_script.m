s = tf('s')
G = (s + 1) / (s * (0.1*s - 1));
% rlocus(G)
% axis equal
hold on
K = [2,0.5,0.97];
step(feedback(K(1)*G, 1),5);
step(feedback(K(2)*G,1),5);
step(feedback(K(3)*G,1),5);
legend('K=2', 'K=0.5', 'K=0.97');