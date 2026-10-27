%% Q2) Plotting y = x^n Function
x = 0:0.1:2;     % Define x range
y1 = x.^2;       % y = x^2
y2 = x.^3;       % y = x^3 (added for better demonstration)

figure;
plot(x, y1, 'b', 'LineWidth', 1.5); hold on;
plot(x, y2, 'y', 'LineWidth', 1.5);
xlabel('x-axis');
ylabel('y-axis');
title('Plot of y = x^2 and y = x^3');
grid on;