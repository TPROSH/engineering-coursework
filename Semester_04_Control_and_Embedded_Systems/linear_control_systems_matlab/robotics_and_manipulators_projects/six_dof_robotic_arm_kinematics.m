clc; clear; close all;

%% ===== PARAMETERS =====
L1=0.4; L2=0.3; L3=0.25; L4=0.2; L5=0.15; L6=0.1;

t = linspace(0,10,50);

figure; hold on; grid on; view(3); axis equal;

for k = 1:length(t)

    %% ===== BASE MOTION =====
    xb = 0.2*cos(0.5*t(k));
    yb = 0.2*sin(0.5*t(k));
    theta_b = 0.5*t(k);

    Tb = [cos(theta_b) -sin(theta_b) 0 xb;
          sin(theta_b)  cos(theta_b) 0 yb;
          0              0           1 0;
          0              0           0 1];

    %% ===== DESIRED EE TRAJECTORY =====
    xd = 0.3 + 0.1*cos(t(k));
    yd = 0.3 + 0.1*sin(t(k));
    zd = 0.5;

    R = eye(3);

    %% ===== WRIST POSITION =====
    pw = [xd; yd; zd] - L6 * R(:,3);

    %% ===== IK =====
    theta1 = atan2(pw(2), pw(1));

    r = sqrt(pw(1)^2 + pw(2)^2);
    s = pw(3) - L1;

    D = (r^2 + s^2 - L2^2 - L3^2)/(2*L2*L3);
    D = max(min(D,1),-1);

    theta3 = atan2(sqrt(1-D^2), D);
    theta2 = atan2(s,r) - atan2(L3*sin(theta3), L2 + L3*cos(theta3));

    q = [theta1 theta2 theta3 0 0 0];

    %% ===== FORWARD KINEMATICS =====
    T = eye(4);
    pts = [0;0;0];

    for i = 1:6
        th = q(i);

        if i==1
            A = trotz(th)*transl(0,0,L1);
        elseif i==2
            A = troty(th)*transl(L2,0,0);
        elseif i==3
            A = troty(th)*transl(L3,0,0);
        elseif i==4
            A = trotx(th)*transl(0,0,L4);
        elseif i==5
            A = troty(th)*transl(0,0,L5);
        else
            A = trotz(th)*transl(0,0,L6);
        end

        T = T*A;
        pts(:,end+1) = T(1:3,4);
    end

    %% ===== APPLY BASE TRANSFORM =====
    pts_h = [pts; ones(1,size(pts,2))];
    pts_world = Tb * pts_h;
    pts = pts_world(1:3,:);

    %% ===== STORE =====
    ee(:,k) = pts(:,end);
    xb_store(k) = xb;
    yb_store(k) = yb;

    %% ===== PLOT =====
    plot3(pts(1,:), pts(2,:), pts(3,:), 'b');
    plot3(pts(1,end), pts(2,end), pts(3,end), 'ro');

    drawnow;
end

%% ===== 3D EE TRAJECTORY =====
figure;
plot3(ee(1,:), ee(2,:), ee(3,:), 'b','LineWidth',2);
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('End Effector Path');

%% ===== BASE MOTION PLOT =====
figure;
plot(t, xb_store, 'r','LineWidth',2); hold on;
plot(t, yb_store, 'b','LineWidth',2);
grid on;
title('Base Motion');
legend('X base','Y base');

%% ===== FUNCTIONS =====
function T = trotx(a)
T = [1 0 0 0; 0 cos(a) -sin(a) 0; 0 sin(a) cos(a) 0; 0 0 0 1];
end

function T = troty(a)
T = [cos(a) 0 sin(a) 0; 0 1 0 0; -sin(a) 0 cos(a) 0; 0 0 0 1];
end

function T = trotz(a)
T = [cos(a) -sin(a) 0 0; sin(a) cos(a) 0 0; 0 0 1 0; 0 0 0 1];
end

function T = transl(x,y,z)
T = [1 0 0 x; 0 1 0 y; 0 0 1 z; 0 0 0 1];
end