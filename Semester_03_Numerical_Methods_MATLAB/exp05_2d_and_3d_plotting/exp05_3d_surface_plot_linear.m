%% Q4) 3D Plot of Z = x/2 + y
x = 0:0.1:10;
y = x;                 % Use same range for y
z = x/2 + y;           % Equation for z

figure;
plot3(x, y, z, 'LineWidth', 1.5);
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('3D Plot of Z = x/2 + y');
grid on;