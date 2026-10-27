s = tf("s");
G=(s+1)/(s*(s+2)*(s+5)*(s+10));

axis equal;

K = [1020,25,625];
step(feedback(K(1)*G, 1),5) %marginally stable
step(feedback(K(2)*G, 1),5)
step(feedback(K(3)*G, 1),5)
step(feedback(K(4)*G, 1),5)