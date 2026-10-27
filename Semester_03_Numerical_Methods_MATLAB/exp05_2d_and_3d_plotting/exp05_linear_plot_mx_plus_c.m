%% Q1) Plotting a Straight Line Graph: y = m*x + c
x = -5:1:100;                             % Define x range
m = 1;  % slope
c = 0; % intercept

y = m*x + c;                              % Linear equation

plot(x, y, 'r', 'LineWidth', 1.5);
xlabel('x-axis');
ylabel('y-axis');
title('Linear Function Plot');
grid on;