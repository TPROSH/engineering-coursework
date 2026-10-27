%% Q3) Trigonometric Function Plot
x = 0:360;             % Degrees
y1 = sind(x);          % sin(x)
y2 = 2*((sind(x)).^2 + (cosd(x)).^2);  % Derived function

figure;
plot(x, y1, 'y', 'LineWidth', 1.5 ); hold on;
plot(x, y2, 'b', 'LineWidth', 1.5);
legend('sind','bigguy')
xlabel('x-axis');
ylabel('y-axis');
title('Trigonometric Functions');
grid on;