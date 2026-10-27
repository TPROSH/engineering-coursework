%% Q6) Using Meshgrid Function
x = -50:1:50;
y = 0:1:50;
[X, Y] = meshgrid(x, y);       % Create grid
Z1 = sin(X) + sin(Y);          % First surface
Z2 = X.^2 + Y.^2;              % Second surface

figure;
surf(X, Y, Z1);
hold on;
surf(X, Y, Z2);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Surface Plots of z1 = sin(x)+sin(y) and z2 = x^2 + y^2');
grid on;