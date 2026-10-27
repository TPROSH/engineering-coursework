clc;
clear;
close all;

%% =========================
%% USER CHOICE
%% =========================
traj_type = 2;   % 1 = straight , 2 = circular
mode = 2;        % 1 = animation , 2 = final plot

%% =========================
%% PID GAINS
%% =========================
Kp_v = 2; Ki_v = 0.1; Kd_v = 0.5;
Kp_w = 6; Ki_w = 0.1; Kd_w = 1;

%% =========================
%% PARAMETERS
%% =========================
R = 5;
wr = 0.5;

tspan = [0 20];

%% =========================
%% INITIAL CONDITION
%% =========================
x0 = [0; 0; 0; 0; 0; 0; 0];  
% [x y theta int_ev int_ew prev_ev prev_ew]

%% =========================
%% SOLVE ODE
%% =========================
[t, X] = ode45(@(t,x) pid_robot(t,x,R,wr,traj_type,...
    Kp_v,Ki_v,Kd_v,Kp_w,Ki_w,Kd_w), tspan, x0);

x = X(:,1);
y = X(:,2);
theta = X(:,3);

%% =========================
%% DESIRED TRAJECTORY
%% =========================
Xd = zeros(size(t));
Yd = zeros(size(t));

for i = 1:length(t)
    if traj_type == 1
        vd = 2;
        Xd(i) = vd*t(i);
        Yd(i) = 0;
    else
        Xd(i) = R*cos(wr*t(i));
        Yd(i) = R*sin(wr*t(i));
    end
end

%% =========================
%% ANIMATION
%% =========================
if mode == 1
    
    figure
    
    for i = 1:length(t)
        clf
        
        plot(Xd, Yd, 'r--','LineWidth',2)
        hold on
        
        plot(x(1:i), y(1:i), 'b','LineWidth',2)
        
        plot(x(i), y(i), 'ko','MarkerFaceColor','k')
        
        quiver(x(i), y(i), cos(theta(i)), sin(theta(i)),...
               0.5,'k','LineWidth',2)
        
        legend('Desired','Robot','Robot')
        xlabel('X'); ylabel('Y')
        title('PID Trajectory Tracking')
        
        axis equal
        grid on
        xlim([-10 10]); ylim([-10 10])
        
        drawnow
        pause(0.01)
    end
end

%% =========================
%% FINAL PLOT
%% =========================
if mode == 2
    
    figure
    plot(Xd,Yd,'r--','LineWidth',2)
    hold on
    plot(x,y,'b','LineWidth',2)
    
    legend('Desired Path','Robot Path')
    xlabel('X'); ylabel('Y')
    title('PID Controlled Path')
    
    axis equal
    grid on
end

%% =========================
%% PID ROBOT FUNCTION
%% =========================
function dxdt = pid_robot(t, x, R, wr, traj_type,...
    Kp_v,Ki_v,Kd_v,Kp_w,Ki_w,Kd_w)

    % States
    xr = x(1); yr = x(2); theta = x(3);
    int_ev = x(4); int_ew = x(5);
    prev_ev = x(6); prev_ew = x(7);
    
    %% Desired trajectory
    if traj_type == 1
        vd = 2;
        xd = vd*t;
        yd = 0;
    else
        xd = R*cos(wr*t);
        yd = R*sin(wr*t);
    end
    
    %% Errors
    ex = xd - xr;
    ey = yd - yr;
    
    dist_error = sqrt(ex^2 + ey^2);
    desired_theta = atan2(ey, ex);
    angle_error = wrapToPi(desired_theta - theta);
    
    %% PID calculations
    dt = 0.01;
    
    int_ev = int_ev + dist_error * dt;
    int_ew = int_ew + angle_error * dt;
    
    der_ev = (dist_error - prev_ev) / dt;
    der_ew = (angle_error - prev_ew) / dt;
    
    v = Kp_v*dist_error + Ki_v*int_ev + Kd_v*der_ev
    w = Kp_w*angle_error + Ki_w*int_ew + Kd_w*der_ew
    
    %% System dynamics
    dxdt = zeros(7,1);
    
    dxdt(1) = v*cos(theta);
    dxdt(2) = v*sin(theta);
    dxdt(3) = w;
    
    dxdt(4) = dist_error;   % integral
    dxdt(5) = angle_error;
    
    dxdt(6) = der_ev;       % store derivative
    dxdt(7) = der_ew;
    
end