clc; clear; close all;

%% PARAMETERS
r = 0.05;
L = 0.3;
l1 = 0.4;
l2 = 0.3;

dt = 0.2;
t = 0:dt:1000;

%% INPUTS
wr = 2; 
wl = 1;
theta1_dot = deg2rad(30);
theta2_dot = deg2rad(60);

%% INITIAL CONDITIONS
x = 0; y = 0; theta = 0;
theta1 = 0; theta2 = 0;

%% FIGURE
fig = figure;
axis equal;
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
view(3);
xlim([-1 1]); ylim([-1 1]); zlim([0 1]);

hold on;

for i = 1:length(t)

    if ~ishandle(fig) 
        break;
    end
    %% BASE KINEMATICS
    x_dot = (r/2)*(wr + wl)*cos(theta);
    y_dot = (r/2)*(wr + wl)*sin(theta);
    theta_dot = (r/L)*(wr - wl);

    x = x + x_dot*dt;
    y = y + y_dot*dt;
    theta = theta + theta_dot*dt;

    %% ARM ANGLES
    theta1 = theta1 + theta1_dot*dt;
    theta2 = theta2 + theta2_dot*dt;

    %% JOINT POSITIONS
    x0 = x;
    y0 = y;
    z0 = 0;

    x1 = x + l1*cos(theta + theta1);
    y1 = y + l1*sin(theta + theta1);
    z1 = 0;

    x2 = x1 + l2*cos(theta + theta1 + theta2);
    y2 = y1 + l2*sin(theta + theta1 + theta2);
    z2 = 0;

    %% CLEAR PREVIOUS FRAME
    cla;

    %% DRAW BASE
    plot3(x0, y0, z0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor','k');

    %% DRAW LINKS
    plot3([x0 x1], [y0 y1], [z0 z1], 'r', 'LineWidth', 3);
    plot3([x1 x2], [y1 y2], [z1 z2], 'b', 'LineWidth', 3);

    %% DRAW END EFFECTOR
    plot3(x2, y2, z2, 'go', 'MarkerSize', 8, 'MarkerFaceColor','g');

    %% SETTINGS
    title('3D Visualization of Mobile Manipulator');
    xlim([-1 1]); ylim([-1 1]); zlim([0 1]);
    view(45,30);

    drawnow;
    pause(0.02);
end