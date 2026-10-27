num1 = [10];
den1 = [1 2 10];
num2 = [5];
den2 = [1 2];

G1 = tf(num1, den1)
G2 = tf(num2, den2)
G_series = series(G1, G2)
G_parallel = parallel(G1, G2)
G_feedback = feedback(G1, G2)

figure; %plotting strts 
subplot(3,2,1)
step(G1)
title('Step Response of G1')
grid on
subplot(3,2,2)
step(G2)
title('Step Response of G2')
grid on
subplot(3,2,3)
step(G_series)
title('Step Response of Series (G1*G2)')
grid on
subplot(3,2,4)
step(G_parallel)
title('Step Response of Parallel (G1+G2)')
grid on
subplot(3,2,5)
step(G_feedback)
title('Step Response of Feedback')
grid on