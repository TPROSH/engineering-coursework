%% MOBILE MANIPULATOR — TASK-SPACE PID CONTROLLER
% Strategy: Compute end-effector position error (xe,ye),
%           run PID to get desired Cartesian velocity,
%           map to control inputs [wr, wl, θ1_dot, θ2_dot]
%           via the Jacobian pseudoinverse.
%
% JACOBIAN DERIVATION (2×4):
%   [xe_dot]   = J * [wr; wl; theta1_dot; theta2_dot]
%   [ye_dot]
%
%   J(1,1) =  (r/2)*cos(θ) − (r/L)*(l1*sin(θ+θ1) + l2*sin(θ+θ1+θ2))
%   J(1,2) =  (r/2)*cos(θ) + (r/L)*(l1*sin(θ+θ1) + l2*sin(θ+θ1+θ2))
%   J(1,3) = −l1*sin(θ+θ1) − l2*sin(θ+θ1+θ2)
%   J(1,4) = −l2*sin(θ+θ1+θ2)
%
%   J(2,1) =  (r/2)*sin(θ) + (r/L)*(l1*cos(θ+θ1) + l2*cos(θ+θ1+θ2))
%   J(2,2) =  (r/2)*sin(θ) − (r/L)*(l1*cos(θ+θ1) + l2*cos(θ+θ1+θ2))
%   J(2,3) =  l1*cos(θ+θ1) + l2*cos(θ+θ1+θ2)
%   J(2,4) =  l2*cos(θ+θ1+θ2)

clc; clear; close all;

%% ── PARAMETERS ──────────────────────────────────────────────────────────
r  = 0.05;   % wheel radius (m)
L  = 0.3;    % wheelbase (m)
l1 = 1.0;    % link 1 length (m)
l2 = 0.9;    % link 2 length (m)

%% ── SIMULATION SETTINGS ─────────────────────────────────────────────────
dt      = 0.1;          % time step (s)  — smaller dt → smoother PID
t_end   = 60;            % simulation duration (s)
t       = 0:dt:t_end;
N       = length(t);

%% ── DESIRED END-EFFECTOR TARGET ─────────────────────────────────────────
% Change these to test different goals
xe_des = 2;
ye_des = 0.25;
% Optional: uncomment for a time-varying circular target
% xe_des_fn = @(ti)  1.5*cos(0.1*ti);
% ye_des_fn = @(ti)  1.5*sin(0.1*ti);

%% ── PID GAINS ────────────────────────────────────────────────────────────
Kp = 3.0;    % Proportional  (increase → faster response, possible overshoot)
Ki = 0.05;   % Integral      (increase → removes steady-state error faster)
Kd = 0.8;    % Derivative    (increase → more damping, less overshoot)

%% ── CONTROL SATURATION ──────────────────────────────────────────────────
w_max        = 5.0;    % max wheel angular velocity  (rad/s)
thdot_max    = 2.0;    % max joint angular velocity  (rad/s)
v_cmd_max    = 0.5;    % cap on PID commanded Cartesian velocity (m/s)

%% ── DAMPED PSEUDOINVERSE REGULARISATION ─────────────────────────────────
% Prevents blow-up near kinematic singularities
lambda = 1e-4;

%% ── INITIAL CONDITIONS ──────────────────────────────────────────────────
x      = 0;
y      = 0;
z      = 0.0;
theta  = deg2rad(0);
theta1 = deg2rad(0);
theta2 = deg2rad(180);   % arm initially stretched backwards

%% ── STORAGE ─────────────────────────────────────────────────────────────
xe_arr   = zeros(1,N);
ye_arr   = zeros(1,N);
ze_arr   = zeros(1,N);
ex_arr   = zeros(1,N);
ey_arr   = zeros(1,N);
wr_arr   = zeros(1,N);
wl_arr   = zeros(1,N);
t1d_arr  = zeros(1,N);
t2d_arr  = zeros(1,N);
xe_arr1   = zeros(1,N);
ye_arr1   = zeros(1,N);

%% ── PID INTERNAL STATE ──────────────────────────────────────────────────
ex_prev = 0;  ey_prev = 0;
ex_int  = 0;  ey_int  = 0;

%% ── ANIMATION FIGURE ────────────────────────────────────────────────────
fig = figure('Name','Mobile Manipulator PID','Color','k');

%% ══════════════════════════════════════════════════════════════════════════
%                        MAIN SIMULATION LOOP
%% ══════════════════════════════════════════════════════════════════════════
for i = 1:N

    %% ── CURRENT END-EFFECTOR POSITION ───────────────────────────────────
    x2 = x  + l1*cos(theta + theta1) ...
             + l2*cos(theta + theta1 + theta2);
    y2 = y  + l1*sin(theta + theta1) ...
             + l2*sin(theta + theta1 + theta2);

    % For time-varying target uncomment:
    % xe_des = xe_des_fn(t(i));
    % ye_des = ye_des_fn(t(i));

    %% ── PID ERROR COMPUTATION ───────────────────────────────────────────
    ex = xe_des - x2;
    ey = ye_des - y2;

    % Integral (with anti-windup: clamp accumulation)
    ex_int = ex_int + ex * dt;
    ey_int = ey_int + ey * dt;
    ex_int = max(min(ex_int,  5), -5);
    ey_int = max(min(ey_int,  5), -5);

    % Derivative
    ex_der = (ex - ex_prev) / dt;
    ey_der = (ey - ey_prev) / dt;

    % PID commanded Cartesian velocity
    vx_cmd = Kp*ex + Ki*ex_int + Kd*ex_der;
    vy_cmd = Kp*ey + Ki*ey_int + Kd*ey_der;

    % Saturate commanded velocity
    v_cmd_norm = norm([vx_cmd, vy_cmd]);
    if v_cmd_norm > v_cmd_max
        vx_cmd = vx_cmd * v_cmd_max / v_cmd_norm;
        vy_cmd = vy_cmd * v_cmd_max / v_cmd_norm;
    end

    ex_prev = ex;
    ey_prev = ey;

    %% ── BUILD JACOBIAN  J (2×4) ─────────────────────────────────────────
    s1  = sin(theta + theta1);
    c1  = cos(theta + theta1);
    s12 = sin(theta + theta1 + theta2);
    c12 = cos(theta + theta1 + theta2);

    % Partial derivatives w.r.t. wr, wl, θ1_dot, θ2_dot
    J = [ (r/2)*cos(theta) - (r/L)*(l1*s1 + l2*s12), ...
          (r/2)*cos(theta) + (r/L)*(l1*s1 + l2*s12), ...
          -(l1*s1 + l2*s12), ...
          -l2*s12 ;
          ...
          (r/2)*sin(theta) + (r/L)*(l1*c1 + l2*c12), ...
          (r/2)*sin(theta) - (r/L)*(l1*c1 + l2*c12), ...
           (l1*c1 + l2*c12), ...
           l2*c12 ];

    %% ── DAMPED PSEUDOINVERSE → CONTROL INPUTS ───────────────────────────
    % u = J^T * (J*J^T + λI)^{-1} * v_cmd
    u = J' * ((J*J' + lambda*eye(2)) \ [vx_cmd; vy_cmd]);

    wr         = u(1);
    wl         = u(2);
    theta1_dot = u(3);
    theta2_dot = u(4);

    % Saturate control inputs
    wr         = max(min(wr,         w_max),    -w_max);
    wl         = max(min(wl,         w_max),    -w_max);
    theta1_dot = max(min(theta1_dot, thdot_max),-thdot_max);
    theta2_dot = max(min(theta2_dot, thdot_max),-thdot_max);

    %% ── STORE CONTROL SIGNALS FOR PLOTTING ──────────────────────────────
    wr_arr(i)  = wr;
    wl_arr(i)  = wl;
    t1d_arr(i) = theta1_dot;
    t2d_arr(i) = theta2_dot;

    %% ── INTEGRATE STATE ─────────────────────────────────────────────────
    x      = x + (r/2)*(wr + wl)*cos(theta)   * dt;
    y      = y + (r/2)*(wr + wl)*sin(theta)   * dt;
    theta  = theta  + (r/L)*(wr - wl)         * dt;
    theta1 = theta1 + theta1_dot               * dt;
    theta2 = theta2 + theta2_dot               * dt;

    %% ── RECOMPUTE ALL LINK POSITIONS FOR DRAWING ─────────────────────────
    x0 = x; y0 = y; z0 = z;
    x1_pos = x + l1*cos(theta + theta1);
    y1_pos = y + l1*sin(theta + theta1);
    z1_pos = z + 0.2;
    x2     = x1_pos + l2*cos(theta + theta1 + theta2);
    y2     = y1_pos + l2*sin(theta + theta1 + theta2);
    z2     = z + 0.4;

    %% ── STORE END-EFFECTOR TRAJECTORY ───────────────────────────────────
    xe_arr(i) = x2;
    ye_arr(i) = y2;
    ze_arr(i) = z2;
    ex_arr(i) = xe_des - x2;
    ey_arr(i) = ye_des - y2;
    xe_arr1(i) = vx_cmd;
    ye_arr1(i) = vy_cmd;

    
    %% ── ANIMATION ───────────────────────────────────────────────────────
    if ishandle(fig)
        cla;

        % Desired target marker
        plot3(xe_des, ye_des, z2, 'r*', 'MarkerSize',14,'LineWidth',2);
        hold on;

        % Robot base
        plot3(x0, y0, z0, 'ko', 'MarkerSize',10, 'MarkerFaceColor','y');

        % Link 1
        plot3([x0 x1_pos],[y0 y1_pos],[z0 z1_pos], 'b-','LineWidth',3);

        % Link 2
        plot3([x1_pos x2],[y1_pos y2],[z1_pos z2], 'm-','LineWidth',3);

        % End-effector
        plot3(x2, y2, z2, 'go', 'MarkerSize',10, 'MarkerFaceColor','g');

        % Trajectory trail
        plot3(xe_arr(1:i), ye_arr(1:i), ze_arr(1:i), ...
              'g--', 'LineWidth',1.5);

        % Error line from EE to target
        plot3([x2 xe_des],[y2 ye_des],[z2 z2], ...
              'r:','LineWidth',1);

        grid on; axis equal;
        xlim([-3 4]); ylim([-3 4]); zlim([0 4]);
        xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
        title(sprintf('PID Mobile Manipulator  |  t = %.1f s  |  Error = %.4f m', ...
                       t(i), norm([ex_arr(i), ey_arr(i)])));
        legend('Target','Base','Link 1','Link 2','End-Effector', ...
               'Trajectory','Error','Location','northwest');
        view(45,30);
        drawnow;
        pause(0.01);
    end
end




%% ══════════════════════════════════════════════════════════════════════════
%                        RESULT PLOTS
%% ══════════════════════════════════════════════════════════════════════════

%% ── END-EFFECTOR POSITION vs TIME ───────────────────────────────────────
figure('Name','End-Effector Position','Color','k');
subplot(2,1,1)
plot(t, xe_arr1, 'b-', 'LineWidth',1.5); hold on;
yline(xe_des,'r--','LineWidth',1.5);
grid on; ylabel('X_e (m)');
title('End-Effector Position vs Time');
legend('X_e actual','X_e desired','Location','best');

subplot(2,1,2)
plot(t, ye_arr1, 'b-', 'LineWidth',1.5); hold on;
yline(ye_des,'r--','LineWidth',1.5);
grid on; ylabel('Y_e (m)'); xlabel('Time (s)');
legend('Y_e actual','Y_e desired','Location','best');

%% ── TRACKING ERROR vs TIME ──────────────────────────────────────────────
figure('Name','Tracking Error','Color','k');
subplot(3,1,1)
plot(t, ex_arr, 'r-', 'LineWidth',1.5);
grid on; ylabel('e_x (m)'); title('PID Tracking Error vs Time');

subplot(3,1,2)
plot(t, ey_arr, 'b-', 'LineWidth',1.5);
grid on; ylabel('e_y (m)');

subplot(3,1,3)
plot(t, sqrt(ex_arr.^2 + ey_arr.^2), 'k-', 'LineWidth',1.5);
grid on; ylabel('||e|| (m)'); xlabel('Time (s)');
title('Euclidean Error Norm');

%% ── CONTROL INPUTS vs TIME ──────────────────────────────────────────────
figure('Name','Control Inputs','Color','k');
subplot(4,1,1)
plot(t, wr_arr,  'LineWidth',1.5); grid on;
ylabel('\omega_r (rad/s)'); title('Control Inputs vs Time');
yline( w_max,'r--'); yline(-w_max,'r--');

subplot(4,1,2)
plot(t, wl_arr,  'LineWidth',1.5); grid on;
ylabel('\omega_l (rad/s)');
yline( w_max,'r--'); yline(-w_max,'r--');

subplot(4,1,3)
plot(t, t1d_arr, 'LineWidth',1.5); grid on;
ylabel('\theta_1\_dot (rad/s)');
yline( thdot_max,'r--'); yline(-thdot_max,'r--');

subplot(4,1,4)
plot(t, t2d_arr, 'LineWidth',1.5); grid on;
ylabel('\theta_2\_dot (rad/s)'); xlabel('Time (s)');
yline( thdot_max,'r--'); yline(-thdot_max,'r--');

%% ── 2D TOP-DOWN TRAJECTORY ───────────────────────────────────────────────
figure('Name','2D Trajectory','Color','k');
plot(xe_arr, ye_arr, 'b-', 'LineWidth',1.5); hold on;
plot(xe_arr(1),   ye_arr(1),   'go', 'MarkerSize',12, 'MarkerFaceColor','g');
plot(xe_des,      ye_des,      'r*', 'MarkerSize',14, 'LineWidth',2);
grid on; axis equal;
xlabel('X_e (m)'); ylabel('Y_e (m)');
title('End-Effector Trajectory (Top View)');
legend('Trajectory','Start','Target','Location','best');