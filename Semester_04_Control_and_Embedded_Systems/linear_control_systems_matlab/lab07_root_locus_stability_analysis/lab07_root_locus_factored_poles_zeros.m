s = tf('s');

G = (s^2 - 4*s + 20) / ((s+2) * (s + 4));
rlocus(G)
axis equal

K = [1.5, 2, 0.456, 3 ];5

step(feedback(K(1)*G, 1),5) %marginally stable
step(feedback(K(2)*G, 1),5)
step(feedback(K(3)*G, 1),5)
step(feedback(K(4)*G, 1),5)
