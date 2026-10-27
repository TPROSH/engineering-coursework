%WHEELED ROBOT PID CONTROLLER SIMULATION :- 

T = 20;                % simulation time in seconds 
x_ref = 5;             % target coordinates
y_ref = 5;             

% Control Gains for Velocity (PID)

Kv_p = 0.6;     % determines how hard the robot pushes 
Kv_i = 0.001;   % Small integral gain to prevent windup
Kv_d = 0.15;    % Derivative gain for damping

% Control Gain for the heading angle
Kw = 2.5; 

% Initial Conditions
% x=0, y=0, phi=30 degrees (converted to radians), v=0, int_e=0
phi_init = 30 * (pi/180); 
s0 = [0; 0; phi_init; 0; 0];    

% s0 is the initial state vector
% It tells the computer that robot starts at : 
% X=0, Y=0, Angle=30 degree , Velocity=0, and Integral Error=0

% Solve using ODE45

opts = odeset('RelTol', 1e-6);            %Sets the precision (tolerance)
[t, s] = ode45(@(t, s) whlrbt(t, s, x_ref, y_ref, Kv_p, Kv_i, Kv_d, Kw), [0 T], s0, opts);

% whlrbt : robot's logic function (naming)
% [ 0 T ] : Time span
% s0 : starting point

% --- PLOTTING ---

subplot(3,1,1); 
plot(t, s(:,1), 'b', 'LineWidth', 2); hold on;
plot(t, s(:,2), 'r', 'LineWidth', 2);
title('X and Y Trajectories'); ylabel('Position (m)'); legend('x','y'); grid on;

subplot(3,1,2); 
plot(t, s(:,3), 'g', 'LineWidth', 2);
title('Heading Angle (\phi)'); ylabel('Angle (rad)'); grid on;

subplot(3,1,3); 
plot(t, s(:,4), 'b', 'LineWidth', 2);
title('Input Velocity (v)'); ylabel('m/s'); xlabel('Time (s)'); grid on;

% --- ROBOT FUNCTION ---

function ds = whlrbt(t, s, xr, yr, Kvp, Kvi, Kvd, Kw)

    % State Mapping :extracts current data from solver (to calc next move)

    x       = s(1);
    y       = s(2);
    phi     = s(3);
    v_track = s(4);
    int_e   = s(5); % This is the running sum of distance error

    % 1. ERROR CALCULATION

    dist_e = sqrt((xr - x)^2 + (yr - y)^2);
    
    % Heading logic (Same as your original) 

    % Calc exact angle the robot should be facing to look at the target
    phi_des = atan2(yr - y, xr - x);

    % Mod part is Angle Wrapping 
    % (ensures robot turns 10 degree left instead of 350 degree right)
    phi_e = mod(phi_des - phi + pi, 2*pi) - pi;

    % 2. PID CALCULATION

    % Derivative of distance error is approximately -velocity
    dist_deriv = -v_track; 
    % Robot is moving toward the goal, the distance error is decreasing ;)

    % Compute Velocity using P, I, and D (Velocity Control Law)
    v = (Kvp * dist_e) + (Kvi * int_e) + (Kvd * dist_deriv);
    
    % Compute Angular Velocity (Angular Control Law)
    w = Kw * phi_e;

    % 3. SATURATION 
    v = max(0, min(v, 1.5));  % Limits robot's speed to max 1.5{ m/s}
    w = max(min(w, 2), -2);   % Limits the turning speed to 2{rad/s}

    % 4. SYSTEM DYNAMICS
    dx   = v * cos(phi);
    dy   = v * sin(phi);
    dphi = w;
    
    % Update velocity tracker
    dv = v - v_track; 
    
    % Update the integral state (The derivative of the integral is the error)
    di = dist_e; 

    ds = [dx; dy; dphi; dv; di]; 
end

% STATE VECTOR :mathematical way of grouping all the essential information 
               % about a system into a single column of numbers.

% (Q.) The state vector only contains the integral error because: 
% (Ans.)Unlike the proportional&derivative terms which are calculated from 
%     current conditions, the integral requires a dedicated "memory" 
%     slot to accumulate and store the sum of errors over time.

% TIME SPAN : the specific interval from the start to the finish over 
%             which you want to calculate the system's behavior.