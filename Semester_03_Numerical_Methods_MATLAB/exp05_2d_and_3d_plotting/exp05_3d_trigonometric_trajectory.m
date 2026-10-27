%% Q5) 3D Trigonometric Function
t = 0:0.1:10*pi;
x = t;
y = t.*sin(t);
z = t.*cos(t);

figure;
comet3(x, y, z);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Trigonometric Graph');
grid on;