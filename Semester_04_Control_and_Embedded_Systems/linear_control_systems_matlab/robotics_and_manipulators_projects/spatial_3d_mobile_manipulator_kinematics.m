%% MOBILE MANIPULATOR VARIABLE USED

%% PARAMETERS
% r  -> wheel radius
% L  -> distance between wheels
% l1 -> length of link 1
% l2 -> length of link 2

%% INPUTS (CONTROL VARIABLES)
% wr          -> right wheel angular velocity (ωr)
% wl          -> left wheel angular velocity (ωl)
% theta1_dot  -> angular velocity of link 1 (θ̇1)
% theta2_dot  -> angular velocity of link 2 (θ̇2)

%% STATE VARIABLES
% x, y   -> position of mobile base
% theta  -> orientation of mobile base
% theta1 -> joint 1 angle
% theta2 -> joint 2 angle

%% BASE KINEMATICS 

% Linear velocity of base
% v = (r/2)*(wr + wl);

% Angular velocity of base
% omega = (r/L)*(wr - wl);

% Position derivatives
% x_dot = v * cos(theta);
%y_dot = v * sin(theta);
%theta_dot = omega;

%% MANIPULATOR FORWARD KINEMATICS

% Joint 1 position
% x1 = x + l1*cos(theta + theta1);
% y1 = y + l1*sin(theta + theta1);

% End-effector position
% xe = x + l1*cos(theta + theta1) + l2*cos(theta + theta1 + theta2);
% ye = y + l1*sin(theta + theta1) + l2*sin(theta + theta1 + theta2);

%% END-EFFECTOR VELOCITY (FROM DERIVATION)

% x velocity of end-effector
% xe_dot = (r/2)*(wr + wl)*cos(theta)- l1*sin(theta + theta1)*( (r/L)*(wr - wl) + theta1_dot ) - l2*sin(theta + theta1 + theta2)*( (r/L)*(wr - wl) + theta1_dot + theta2_dot );

% y velocity of end-effector
%ye_dot = (r/2)*(wr + wl)*sin(theta) + l1*cos(theta + theta1)*( (r/L)*(wr - wl) + theta1_dot ) + l2*cos(theta + theta1 + theta2)*( (r/L)*(wr - wl) + theta1_dot + theta2_dot );

clc; clear; close all;

%% PARAMETERS
r = 0.05; % radius of tyre
L = 0.3;  % distance between wheels
l1 = 1; % link 1 length
l2 = 0.9; % link 2 length

dt = 1;
t = 0:dt:2000;   

%% INPUTS
wr = 1; %right wheel velocity
wl = 1; %left wheel velocity
theta1_dot = deg2rad(0); %1st link velocity
theta2_dot = deg2rad(0); %2nd link relative velocity to 1st link
vz = 0.0;   % vertical velocity

%% INITIAL CONDITIONS
x = 0; y = 0; z = 0;
theta = deg2rad(0);
theta1 = deg2rad(0);
theta2 = deg2rad(180);

%% STORAGE 
xe_arr = zeros(size(t));
ye_arr = zeros(size(t));
ze_arr = zeros(size(t));

%% FIGURE FOR ANIMATION
fig = figure;

for i = 1:length(t)

    %% BASE MOTION
    x_dot = (r/2)*(wr + wl)*cos(theta);
    y_dot = (r/2)*(wr + wl)*sin(theta);
    theta_dot = (r/L)*(wr - wl);

    z_dot = vz;

    x = x + x_dot*dt;
    y = y + y_dot*dt;
    z = z + z_dot*dt;

    theta = theta + theta_dot*dt;

    %% ARM MOTION
    theta1 = theta1 + theta1_dot*dt;
    theta2 = theta2 + theta2_dot*dt;

    %% POSITIONS
    x0 = x; y0 = y; z0 = z;

    x1 = x + l1*cos(theta + theta1);
    y1 = y + l1*sin(theta + theta1);
    z1 = z + 0.2;

    x2 = x1 + l2*cos(theta + theta1 + theta2);
    y2 = y1 + l2*sin(theta + theta1 + theta2);
    z2 = z + 0.4;

    %% STORE END EFFECTOR 
    xe_arr(i) = x2;
    ye_arr(i) = y2;
    ze_arr(i) = z2;

    %% DRAW
    if ishandle(fig)
        cla;
        
        plot3(x0,y0,z0,'ko','MarkerSize',8,'MarkerFaceColor','k'); hold on;
        plot3([x0 x1],[y0 y1],[z0 z1],'LineWidth',3);
        plot3([x1 x2],[y1 y2],[z1 z2],'LineWidth',3);
        plot3(x2,y2,z2,'o','MarkerSize',8,'MarkerFaceColor','g');

        %  TRAJECTORY TRAIL 
        plot3(xe_arr(1:i), ye_arr(1:i), ze_arr(1:i), 'g--', 'LineWidth', 1.5);

        grid on;
        axis equal;
        xlim([-2 4]); ylim([-2 4]); zlim([0 4]);
    
        xlabel('X'); ylabel('Y'); zlabel('Z');
        title('TRUE 3D Mobile Manipulator');
    
        view(45,30);
        drawnow;
        pause(0.02);
    end

end

%% END EFFECTOR vs TIME GRAPH

figure;

subplot(3,1,1)
plot(t, xe_arr, 'LineWidth', 1.5);
grid on;
ylabel('X_e (m)');
title('End Effector Position vs Time');

subplot(3,1,2)
plot(t, ye_arr, 'LineWidth', 1.5);
grid on;
ylabel('Y_e (m)');

subplot(3,1,3)
plot(t, ze_arr, 'LineWidth', 1.5);
grid on;
ylabel('Z_e (m)');
xlabel('Time (s)');