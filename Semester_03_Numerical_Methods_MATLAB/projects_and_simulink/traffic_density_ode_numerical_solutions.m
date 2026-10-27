%%
% Numerical Solution of Traffic Density ODE with Multiple Methods and Convergence Analysis

clear all;
clc;
close all;

% Define parameters
alpha = 100;  % Inflow rate (vehicles/hour)
beta = 0.1;   % Outflow coefficient (1/hour)
rho0 = 50;    % Initial density (vehicles/km)
rho_critical = 200;  % Critical density threshold (vehicles/km)
T = 5;        % Simulation end time (hours) - covers beyond threshold for comparison

% Exact solution function
exact_rho = @(t) (alpha / beta) + (rho0 - alpha / beta) * exp(-beta * t);

% Compute exact crossing time analytically
% Solve: rho_critical = alpha/beta + (rho0 - alpha/beta) * exp(-beta * t)
exp_term = (rho_critical - alpha/beta) / (rho0 - alpha/beta);
t_exact_cross = - (1/beta) * log(exp_term);
fprintf('Exact time to reach %d vehicles/km: %.4f hours\n\n', rho_critical, t_exact_cross);

% Define the ODE derivative function
f = @(t, rho) alpha - beta * rho;

% Fixed step size for solution plots (e.g., h=0.05 for visualization)
h_fixed = 0.05;
N_fixed = round(T / h_fixed);
t_fixed = (0:N_fixed) * h_fixed;

% --- Euler's Method ---
rho_euler = zeros(1, N_fixed+1);
rho_euler(1) = rho0;
for i = 1:N_fixed
    rho_euler(i+1) = rho_euler(i) + h_fixed * f(t_fixed(i), rho_euler(i));
end

% --- Runge-Kutta 4th Order (RK4) ---
rho_rk4 = zeros(1, N_fixed+1);
rho_rk4(1) = rho0;
for i = 1:N_fixed
    k1 = f(t_fixed(i), rho_rk4(i));
    k2 = f(t_fixed(i) + h_fixed/2, rho_rk4(i) + (h_fixed/2)*k1);
    k3 = f(t_fixed(i) + h_fixed/2, rho_rk4(i) + (h_fixed/2)*k2);
    k4 = f(t_fixed(i) + h_fixed, rho_rk4(i) + h_fixed*k3);
    rho_rk4(i+1) = rho_rk4(i) + (h_fixed/6) * (k1 + 2*k2 + 2*k3 + k4);
end

% --- Predictor-Corrector (Heun's Method: Euler predictor + Trapezoidal corrector) ---
rho_pc = zeros(1, N_fixed+1);
rho_pc(1) = rho0;
for i = 1:N_fixed
    % Predictor (Euler)
    rho_pred = rho_pc(i) + h_fixed * f(t_fixed(i), rho_pc(i));
    % Corrector (Trapezoidal)
    rho_pc(i+1) = rho_pc(i) + (h_fixed/2) * (f(t_fixed(i), rho_pc(i)) + f(t_fixed(i+1), rho_pred));
end

% Compute exact solution on the same grid
rho_exact = exact_rho(t_fixed);

% Plot solutions vs. time and compare to exact
figure(1);
plot(t_fixed, rho_euler, 'b-', 'LineWidth', 1.5); hold on;
plot(t_fixed, rho_rk4, 'g-', 'LineWidth', 1.5);
plot(t_fixed, rho_pc, 'm-', 'LineWidth', 1.5);
plot(t_fixed, rho_exact, 'k--', 'LineWidth', 2);
plot(t_fixed, rho_critical * ones(size(t_fixed)), 'r--', 'LineWidth', 1.5);
xlabel('Time (hours)');
ylabel('Density \rho(t) (vehicles/km)');
title('Numerical Solutions vs Exact');
legend('Euler', 'RK4', 'PC (Heun)', 'Exact', 'Critical Threshold', 'Location', 'southeast');
grid on;

% Find approximate crossing times for each method (interpolation)
methods = {'Euler', 'RK4', 'Predictor-Corrector'};
rhos = {rho_euler, rho_rk4, rho_pc};
for m = 1:3
    rho = rhos{m};
    idx = find(rho >= rho_critical, 1, 'first');
    if ~isempty(idx) && idx > 1
        t_cross = t_fixed(idx-1) + (t_fixed(idx) - t_fixed(idx-1)) * (rho_critical - rho(idx-1)) / (rho(idx) - rho(idx-1));
        fprintf('%s time to reach %d vehicles/km: %.4f hours\n', methods{m}, rho_critical, t_cross);
    end
end
fprintf('\n');

% --- Convergence Analysis ---
% Vary step sizes h (halving for log-log plot)
h_values = 0.5 ./ 2.^(0:5);  % h = 0.5, 0.25, 0.125, 0.0625, 0.03125, 0.015625
num_h = length(h_values);
error_euler = zeros(1, num_h);
error_rk4 = zeros(1, num_h);
error_pc = zeros(1, num_h);

for j = 1:num_h
    h = h_values(j);
    N = round(T / h);
    t = (0:N) * h;
    
    % Euler
    rho = rho0;
    for i = 1:N
        rho = rho + h * f(t(i), rho);
    end
    error_euler(j) = abs(rho - exact_rho(T));
    
    % RK4
    rho = rho0;
    for i = 1:N
        k1 = f(t(i), rho);
        k2 = f(t(i) + h/2, rho + (h/2)*k1);
        k3 = f(t(i) + h/2, rho + (h/2)*k2);
        k4 = f(t(i) + h, rho + h*k3);
        rho = rho + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
    error_rk4(j) = abs(rho - exact_rho(T));
    
    % Predictor-Corrector (Heun)
    rho = rho0;
    for i = 1:N
        rho_pred = rho + h * f(t(i), rho);
        rho = rho + (h/2) * (f(t(i), rho) + f(t(i+1), rho_pred));
    end
    error_pc(j) = abs(rho - exact_rho(T));
end

% Plot convergence: log(error) vs log(h) - slopes indicate order of convergence
figure(2);
loglog(h_values, error_euler, 'b-o', 'LineWidth', 1.5); hold on;
loglog(h_values, error_rk4, 'g-o', 'LineWidth', 1.5);
loglog(h_values, error_pc, 'm-o', 'LineWidth', 1.5);
xlabel('log(h)');
ylabel('log(|Error| at t=T)');
title('Error vs. Step Size h (Speed of Convergence)');
legend('Euler (Order 1)', 'RK4 (Order 4)', 'Predictor-Corrector (Heun, Order 2)', 'Location', 'southeast');
grid on;

% Compute and display approximate convergence rates (slopes from linear fit)
fit_euler = polyfit(log(h_values), log(error_euler), 1);
fit_rk4 = polyfit(log(h_values), log(error_rk4), 1);
fit_pc = polyfit(log(h_values), log(error_pc), 1);
fprintf('Approximate convergence orders (slopes):\n');
fprintf('Euler: %.2f (expected ~1)\n', fit_euler(1));
fprintf('RK4: %.2f (expected ~4)\n', fit_rk4(1));
fprintf('Predictor-Corrector (Heun): %.2f (expected ~2)\n', fit_pc(1));

% %%
% % Numerical Solution of Inventory Level ODE with Multiple Methods and Convergence Analysis
% 
% clear all;
% clc;
% close all;
% 
% % Define parameters
% r = 200;      % Replenishment rate (units/day)
% k = 0.05;     % Decay rate (per day)
% I0 = 1000;    % Initial inventory (units)
% I_target = 2000;  % Target inventory level to reach (units, for crossing time example)
% T = 30;       % Simulation end time (days)
% 
% % Exact solution function
% exact_I = @(t) (r / k) + (I0 - r / k) * exp(-k * t);
% 
% % Compute exact crossing time analytically (time to reach I_target from below)
% % Solve: I_target = r/k + (I0 - r/k) * exp(-k * t)
% exp_term = (I_target - r/k) / (I0 - r/k);
% if exp_term > 0
%     t_exact_cross = - (1/k) * log(exp_term);
%     fprintf('Exact time to reach %d units: %.4f days\n\n', I_target, t_exact_cross);
% else
%     fprintf('Target is below initial or equilibrium; no crossing from below.\n');
% end
% 
% % Define the ODE derivative function
% f = @(t, I) r - k * I;
% 
% % Fixed step size for solution plots (e.g., h=0.1 for visualization, adjusted for 30 days)
% h_fixed = 0.1;
% N_fixed = round(T / h_fixed);
% t_fixed = (0:N_fixed) * h_fixed;
% 
% % --- Euler's Method ---
% I_euler = zeros(1, N_fixed+1);
% I_euler(1) = I0;
% for i = 1:N_fixed
%     I_euler(i+1) = I_euler(i) + h_fixed * f(t_fixed(i), I_euler(i));
% end
% 
% % --- Runge-Kutta 4th Order (RK4) ---
% I_rk4 = zeros(1, N_fixed+1);
% I_rk4(1) = I0;
% for i = 1:N_fixed
%     k1 = f(t_fixed(i), I_rk4(i));
%     k2 = f(t_fixed(i) + h_fixed/2, I_rk4(i) + (h_fixed/2)*k1);
%     k3 = f(t_fixed(i) + h_fixed/2, I_rk4(i) + (h_fixed/2)*k2);
%     k4 = f(t_fixed(i) + h_fixed, I_rk4(i) + h_fixed*k3);
%     I_rk4(i+1) = I_rk4(i) + (h_fixed/6) * (k1 + 2*k2 + 2*k3 + k4);
% end
% 
% % --- Predictor-Corrector (Heun's Method: Euler predictor + Trapezoidal corrector) ---
% I_pc = zeros(1, N_fixed+1);
% I_pc(1) = I0;
% for i = 1:N_fixed
%     % Predictor (Euler)
%     I_pred = I_pc(i) + h_fixed * f(t_fixed(i), I_pc(i));
%     % Corrector (Trapezoidal)
%     I_pc(i+1) = I_pc(i) + (h_fixed/2) * (f(t_fixed(i), I_pc(i)) + f(t_fixed(i+1), I_pred));
% end
% 
% % Compute exact solution on the same grid
% I_exact = exact_I(t_fixed);
% 
% % Plot solutions vs. time and compare to exact
% figure(1);
% plot(t_fixed, I_euler, 'b-', 'LineWidth', 1.5); hold on;
% plot(t_fixed, I_rk4, 'g-', 'LineWidth', 1.5);
% plot(t_fixed, I_pc, 'm-', 'LineWidth', 1.5);
% plot(t_fixed, I_exact, 'k--', 'LineWidth', 2);
% plot(t_fixed, I_target * ones(size(t_fixed)), 'r--', 'LineWidth', 1.5);
% xlabel('Time (days)');
% ylabel('Inventory I(t) (units)');
% title('Numerical Solutions vs Exact');
% legend('Euler', 'RK4', 'Predictor-Corrector (Heun)', 'Exact', 'Target Level', 'Location', 'southeast');
% grid on;
% 
% % Find approximate crossing times for each method (interpolation, reaching target from below)
% methods = {'Euler', 'RK4', 'Predictor-Corrector'};
% Is = {I_euler, I_rk4, I_pc};
% for m = 1:3
%     I_val = Is{m};
%     idx = find(I_val >= I_target, 1, 'first');
%     if ~isempty(idx) && idx > 1
%         t_cross = t_fixed(idx-1) + (t_fixed(idx) - t_fixed(idx-1)) * (I_target - I_val(idx-1)) / (I_val(idx) - I_val(idx-1));
%         fprintf('%s time to reach %d units: %.4f days\n', methods{m}, I_target, t_cross);
%     end
% end
% fprintf('\n');
% 
% % --- Convergence Analysis ---
% % Vary step sizes h (halving for log-log plot)
% h_values = 1 ./ 2.^(0:5);  % h = 1, 0.5, 0.25, 0.125, 0.0625, 0.03125 (adjusted for longer T)
% num_h = length(h_values);
% error_euler = zeros(1, num_h);
% error_rk4 = zeros(1, num_h);
% error_pc = zeros(1, num_h);
% 
% for j = 1:num_h
%     h = h_values(j);
%     N = round(T / h);
%     t = (0:N) * h;
% 
%     % Euler
%     I_val = I0;
%     for i = 1:N
%         I_val = I_val + h * f(t(i), I_val);
%     end
%     error_euler(j) = abs(I_val - exact_I(T));
% 
%     % RK4
%     I_val = I0;
%     for i = 1:N
%         k1 = f(t(i), I_val);
%         k2 = f(t(i) + h/2, I_val + (h/2)*k1);
%         k3 = f(t(i) + h/2, I_val + (h/2)*k2);
%         k4 = f(t(i) + h, I_val + h*k3);
%         I_val = I_val + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
%     end
%     error_rk4(j) = abs(I_val - exact_I(T));
% 
%     % Predictor-Corrector (Heun)
%     I_val = I0;
%     for i = 1:N
%         I_pred = I_val + h * f(t(i), I_val);
%         I_val = I_val + (h/2) * (f(t(i), I_val) + f(t(i+1), I_pred));
%     end
%     error_pc(j) = abs(I_val - exact_I(T));
% end
% 
% % Plot convergence: log(error) vs log(h) - slopes indicate order of convergence
% figure(2);
% loglog(h_values, error_euler, 'b-o', 'LineWidth', 1.5); hold on;
% loglog(h_values, error_rk4, 'g-o', 'LineWidth', 1.5);
% loglog(h_values, error_pc, 'm-o', 'LineWidth', 1.5);
% xlabel('log(h)');
% ylabel('log(|Error| at t=T)');
% title('Error vs. Step Size h (Speed of Convergence)');
% legend('Euler (Order 1)', 'RK4 (Order 4)', 'Predictor-Corrector (Heun, Order 2)', 'Location', 'southeast');
% grid on;
% 
% % Compute and display approximate convergence rates (slopes from linear fit)
% fit_euler = polyfit(log(h_values), log(error_euler), 1);
% fit_rk4 = polyfit(log(h_values), log(error_rk4), 1);
% fit_pc = polyfit(log(h_values), log(error_pc), 1);
% fprintf('Approximate convergence orders (slopes):\n');
% fprintf('Euler: %.2f (expected ~1)\n', fit_euler(1));
% fprintf('RK4: %.2f (expected ~4)\n', fit_rk4(1));
% fprintf('Predictor-Corrector (Heun): %.2f (expected ~2)\n', fit_pc(1));
% 
% %%
% % Numerical Solution of Fuel Consumption ODE with Multiple Methods and Convergence Analysis
% 
% clear all;
% clc;
% close all;
% 
% % Define parameters
% c = 0.1;      % Consumption coefficient (liters/km)
% kL = 0.05;    % Load factor consumption (liters/hour)
% F0 = 50;      % Initial fuel (liters)
% T = 2;        % Simulation end time (hours)
% F_critical = 40;  % Critical low fuel threshold (liters, for crossing time example)
% 
% % Define speed function v(t) in km/h
% v = @(t) 60 + 10 * sin(t);
% 
% % Define the ODE derivative function: dF/dt = -c * v(t) - kL
% f = @(t, F) -c * v(t) - kL;
% 
% % Exact solution function
% exact_F = @(t) 49 + cos(t) - 6.05 * t;  % Derived from integration: 50 - integral(6.05 + sin(s)) ds = 49 + cos(t) - 6.05 t
% 
% % Compute exact crossing time analytically/numerically (time to reach F_critical from above)
% % Solve: 49 + cos(t) - 6.05 t = F_critical => cos(t) - 6.05 t = F_critical - 49
% % Use fzero for numerical solution
% eqn = @(t) exact_F(t) - F_critical;
% t_exact_cross = fzero(eqn, [0, T]);  % Assuming it crosses within [0,T]
% fprintf('Exact time to reach %d liters: %.4f hours\n\n', F_critical, t_exact_cross);
% 
% % Fixed step size for solution plots (e.g., h=0.01 for visualization)
% h_fixed = 0.01;
% N_fixed = round(T / h_fixed);
% t_fixed = (0:N_fixed) * h_fixed;
% 
% % --- Euler's Method ---
% F_euler = zeros(1, N_fixed+1);
% F_euler(1) = F0;
% for i = 1:N_fixed
%     F_euler(i+1) = F_euler(i) + h_fixed * f(t_fixed(i), F_euler(i));
% end
% 
% % --- Runge-Kutta 4th Order (RK4) ---
% F_rk4 = zeros(1, N_fixed+1);
% F_rk4(1) = F0;
% for i = 1:N_fixed
%     k1 = f(t_fixed(i), F_rk4(i));
%     k2 = f(t_fixed(i) + h_fixed/2, F_rk4(i) + (h_fixed/2)*k1);
%     k3 = f(t_fixed(i) + h_fixed/2, F_rk4(i) + (h_fixed/2)*k2);
%     k4 = f(t_fixed(i) + h_fixed, F_rk4(i) + h_fixed*k3);
%     F_rk4(i+1) = F_rk4(i) + (h_fixed/6) * (k1 + 2*k2 + 2*k3 + k4);
% end
% 
% % --- Predictor-Corrector (Heun's Method: Euler predictor + Trapezoidal corrector) ---
% F_pc = zeros(1, N_fixed+1);
% F_pc(1) = F0;
% for i = 1:N_fixed
%     % Predictor (Euler)
%     F_pred = F_pc(i) + h_fixed * f(t_fixed(i), F_pc(i));
%     % Corrector (Trapezoidal)
%     F_pc(i+1) = F_pc(i) + (h_fixed/2) * (f(t_fixed(i), F_pc(i)) + f(t_fixed(i+1), F_pred));
% end
% 
% % Compute exact solution on the same grid
% F_exact = exact_F(t_fixed);
% 
% % Plot solutions vs. time and compare to exact
% figure(1);
% plot(t_fixed, F_euler, 'b-', 'LineWidth', 1.5); hold on;
% plot(t_fixed, F_rk4, 'g-', 'LineWidth', 1.5);
% plot(t_fixed, F_pc, 'm-', 'LineWidth', 1.5);
% plot(t_fixed, F_exact, 'k--', 'LineWidth', 2);
% plot(t_fixed, F_critical * ones(size(t_fixed)), 'r--', 'LineWidth', 1.5);
% xlabel('Time (hours)');
% ylabel('Fuel F(t) (liters)');
% title('Numerical Solutions vs Exact');
% legend('Euler', 'RK4', 'Predictor-Corrector (Heun)', 'Exact', 'Critical Fuel Level', 'Location', 'southeast');
% grid on;
% 
% % Find approximate crossing times for each method (interpolation, reaching critical from above)
% methods = {'Euler', 'RK4', 'Predictor-Corrector'};
% Fs = {F_euler, F_rk4, F_pc};
% for m = 1:3
%     F_val = Fs{m};
%     idx = find(F_val <= F_critical, 1, 'first');
%     if ~isempty(idx) && idx > 1
%         t_cross = t_fixed(idx-1) + (t_fixed(idx) - t_fixed(idx-1)) * (F_critical - F_val(idx-1)) / (F_val(idx) - F_val(idx-1));
%         fprintf('%s time to reach %d liters: %.4f hours\n', methods{m}, F_critical, t_cross);
%     end
% end
% fprintf('\n');
% 
% % --- Convergence Analysis ---
% % Vary step sizes h (halving for log-log plot)
% h_values = 0.2 ./ 2.^(0:5);  % h = 0.2, 0.1, 0.05, 0.025, 0.0125, 0.00625 (adjusted for shorter T)
% num_h = length(h_values);
% error_euler = zeros(1, num_h);
% error_rk4 = zeros(1, num_h);
% error_pc = zeros(1, num_h);
% 
% for j = 1:num_h
%     h = h_values(j);
%     N = round(T / h);
%     t = (0:N) * h;
% 
%     % Euler
%     F_val = F0;
%     for i = 1:N
%         F_val = F_val + h * f(t(i), F_val);
%     end
%     error_euler(j) = abs(F_val - exact_F(T));
% 
%     % RK4
%     F_val = F0;
%     for i = 1:N
%         k1 = f(t(i), F_val);
%         k2 = f(t(i) + h/2, F_val + (h/2)*k1);
%         k3 = f(t(i) + h/2, F_val + (h/2)*k2);
%         k4 = f(t(i) + h, F_val + h*k3);
%         F_val = F_val + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
%     end
%     error_rk4(j) = abs(F_val - exact_F(T));
% 
%     % Predictor-Corrector (Heun)
%     F_val = F0;
%     for i = 1:N
%         F_pred = F_val + h * f(t(i), F_val);
%         F_val = F_val + (h/2) * (f(t(i), F_val) + f(t(i+1), F_pred));
%     end
%     error_pc(j) = abs(F_val - exact_F(T));
% end
% 
% % Plot convergence: log(error) vs log(h) - slopes indicate order of convergence
% figure(2);
% loglog(h_values, error_euler, 'b-o', 'LineWidth', 1.5); hold on;
% loglog(h_values, error_rk4, 'g-o', 'LineWidth', 1.5);
% loglog(h_values, error_pc, 'm-o', 'LineWidth', 1.5);
% xlabel('log(h)');
% ylabel('log(|Error| at t=T)');
% title('Error vs. Step Size h (Speed of Convergence)');
% legend('Euler (Order 1)', 'RK4 (Order 4)', 'Predictor-Corrector (Heun, Order 2)', 'Location', 'southeast');
% grid on;
% 
% % Compute and display approximate convergence rates (slopes from linear fit)
% fit_euler = polyfit(log(h_values), log(error_euler), 1);
% fit_rk4 = polyfit(log(h_values), log(error_rk4), 1);
% fit_pc = polyfit(log(h_values), log(error_pc), 1);
% fprintf('Approximate convergence orders (slopes):\n');
% fprintf('Euler: %.2f (expected ~1)\n', fit_euler(1));
% fprintf('RK4: %.2f (expected ~4)\n', fit_rk4(1));
% fprintf('Predictor-Corrector (Heun): %.2f (expected ~2)\n', fit_pc(1));
% 
% %%
% % Numerical Solution of Supply Chain Inventory ODE with Multiple Methods and Convergence Analysis
% 
% % Clear workspace and command window
% clear all;
% clc;
% close all;
% 
% % Define parameters
% p = 150;      % Production rate (units/week)
% S0 = 500;     % Initial stock (units)
% T = 52;       % Simulation end time (weeks)
% S_target = 1000;  % Target stock level to reach (units, for crossing time example; adjust as needed)
% 
% % Define demand rate function d(t)
% d_fun = @(t) 0.02 + 0.01 * sin(2 * pi * t / 52);
% 
% % Define the ODE derivative function: dS/dt = p - d(t) * S
% f = @(t, S) p - d_fun(t) * S;
% 
% % Compute reference "exact" solution using ode45 with tight tolerances
% options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10);
% [t_ref, S_ref] = ode45(f, [0 T], S0, options);
% S_T_ref = S_ref(end);  % Reference value at t=T
% 
% % Compute reference crossing time (numerical approximation)
% idx_ref = find(S_ref >= S_target, 1, 'first');
% if ~isempty(idx_ref) && idx_ref > 1
%     t_exact_cross = t_ref(idx_ref-1) + (t_ref(idx_ref) - t_ref(idx_ref-1)) * (S_target - S_ref(idx_ref-1)) / (S_ref(idx_ref) - S_ref(idx_ref-1));
%     fprintf('Approximate reference time to reach %d units: %.4f weeks\n\n', S_target, t_exact_cross);
% else
%     fprintf('Target not reached within time span.\n');
% end
% 
% % Fixed step size for solution plots (e.g., h=0.1 for visualization)
% h_fixed = 0.1;
% N_fixed = round(T / h_fixed);
% t_fixed = (0:N_fixed) * h_fixed;
% 
% % Compute reference solution on fixed grid for plotting (interpolate)
% S_exact = interp1(t_ref, S_ref, t_fixed, 'spline');
% 
% % --- Euler's Method ---
% S_euler = zeros(1, N_fixed+1);
% S_euler(1) = S0;
% for i = 1:N_fixed
%     S_euler(i+1) = S_euler(i) + h_fixed * f(t_fixed(i), S_euler(i));
% end
% 
% % --- Runge-Kutta 4th Order (RK4) ---
% S_rk4 = zeros(1, N_fixed+1);
% S_rk4(1) = S0;
% for i = 1:N_fixed
%     k1 = f(t_fixed(i), S_rk4(i));
%     k2 = f(t_fixed(i) + h_fixed/2, S_rk4(i) + (h_fixed/2)*k1);
%     k3 = f(t_fixed(i) + h_fixed/2, S_rk4(i) + (h_fixed/2)*k2);
%     k4 = f(t_fixed(i) + h_fixed, S_rk4(i) + h_fixed*k3);
%     S_rk4(i+1) = S_rk4(i) + (h_fixed/6) * (k1 + 2*k2 + 2*k3 + k4);
% end
% 
% % --- Predictor-Corrector (Heun's Method: Euler predictor + Trapezoidal corrector) ---
% S_pc = zeros(1, N_fixed+1);
% S_pc(1) = S0;
% for i = 1:N_fixed
%     % Predictor (Euler)
%     S_pred = S_pc(i) + h_fixed * f(t_fixed(i), S_pc(i));
%     % Corrector (Trapezoidal)
%     S_pc(i+1) = S_pc(i) + (h_fixed/2) * (f(t_fixed(i), S_pc(i)) + f(t_fixed(i+1), S_pred));
% end
% 
% % Plot solutions vs. time and compare to reference
% figure(1);
% plot(t_fixed, S_euler, 'b-', 'LineWidth', 1.5); hold on;
% plot(t_fixed, S_rk4, 'g-', 'LineWidth', 1.5);
% plot(t_fixed, S_pc, 'm-', 'LineWidth', 1.5);
% plot(t_fixed, S_exact, 'k--', 'LineWidth', 2);
% plot(t_fixed, S_target * ones(size(t_fixed)), 'r--', 'LineWidth', 1.5);
% xlabel('Time (weeks)');
% ylabel('Stock S(t) (units)');
% title('Numerical Solutions vs ODE45');
% legend('Euler', 'RK4', 'Predictor-Corrector (Heun)', 'Reference (ode45)', 'Target Level', 'Location', 'southeast');
% grid on;
% 
% % Find approximate crossing times for each method (interpolation)
% methods = {'Euler', 'RK4', 'Predictor-Corrector'};
% Ss = {S_euler, S_rk4, S_pc};
% for m = 1:3
%     S_val = Ss{m};
%     idx = find(S_val >= S_target, 1, 'first');
%     if ~isempty(idx) && idx > 1
%         t_cross = t_fixed(idx-1) + (t_fixed(idx) - t_fixed(idx-1)) * (S_target - S_val(idx-1)) / (S_val(idx) - S_val(idx-1));
%         fprintf('%s time to reach %d units: %.4f weeks\n', methods{m}, S_target, t_cross);
%     end
% end
% fprintf('\n');
% 
% % --- Convergence Analysis ---
% % Vary step sizes h (halving for log-log plot, adjusted for longer T)
% h_values = 2 ./ 2.^(0:5);  % h = 2, 1, 0.5, 0.25, 0.125, 0.0625
% num_h = length(h_values);
% error_euler = zeros(1, num_h);
% error_rk4 = zeros(1, num_h);
% error_pc = zeros(1, num_h);
% 
% for j = 1:num_h
%     h = h_values(j);
%     N = round(T / h);
%     t = (0:N) * h;
% 
%     % Euler
%     S_val = S0;
%     for i = 1:N
%         S_val = S_val + h * f(t(i), S_val);
%     end
%     error_euler(j) = abs(S_val - S_T_ref);
% 
%     % RK4
%     S_val = S0;
%     for i = 1:N
%         k1 = f(t(i), S_val);
%         k2 = f(t(i) + h/2, S_val + (h/2)*k1);
%         k3 = f(t(i) + h/2, S_val + (h/2)*k2);
%         k4 = f(t(i) + h, S_val + h*k3);
%         S_val = S_val + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
%     end
%     error_rk4(j) = abs(S_val - S_T_ref);
% 
%     % Predictor-Corrector (Heun)
%     S_val = S0;
%     for i = 1:N
%         S_pred = S_val + h * f(t(i), S_val);
%         S_val = S_val + (h/2) * (f(t(i), S_val) + f(t(i+1), S_pred));
%     end
%     error_pc(j) = abs(S_val - S_T_ref);
% end
% 
% % Plot convergence: log(error) vs log(h) - slopes indicate order of convergence
% figure(2);
% loglog(h_values, error_euler, 'b-o', 'LineWidth', 1.5); hold on;
% loglog(h_values, error_rk4, 'g-o', 'LineWidth', 1.5);
% loglog(h_values, error_pc, 'm-o', 'LineWidth', 1.5);
% xlabel('log(h)');
% ylabel('log(|Error| at t=T)');
% title('Error vs. Step Size h (Speed of Convergence)');
% legend('Euler (Order 1)', 'RK4 (Order 4)', 'Predictor-Corrector (Heun, Order 2)', 'Location', 'southeast');
% grid on;
% 
% % Compute and display approximate convergence rates (slopes from linear fit)
% fit_euler = polyfit(log(h_values), log(error_euler), 1);
% fit_rk4 = polyfit(log(h_values), log(error_rk4), 1);
% fit_pc = polyfit(log(h_values), log(error_pc), 1);
% fprintf('Approximate convergence orders (slopes):\n');
% fprintf('Euler: %.2f (expected ~1)\n', fit_euler(1));
% fprintf('RK4: %.2f (expected ~4)\n', fit_rk4(1));
% fprintf('Predictor-Corrector (Heun): %.2f (expected ~2)\n', fit_pc(1));