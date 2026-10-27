clc;
zeta = 0.5;    % Damping ratios
wn = [5 10 20];   % Natural frequency

figure;
hold on;
grid on;

for i = 1:length(wn)
    sys = tf(wn(i)^2,[1 2*zeta*wn(i) wn(i)^2]);
    t = 0:0.01:6;
    [y,t_out] = step(sys,t);
    plot(t_out,y,'LineWidth',1.5)
    fprintf('\nFor wn = %.2f\n', wn(i));
    info = stepinfo(sys);    % Get time specifications
    index = find(y >= 0.5, 1);
    Delay_time = t_out(index);
    Rise_time = info.RiseTime;
    Settling_time = info.SettlingTime;
    peak_time = info.PeakTime;
    overshoot = info.Overshoot;
    fprintf('Delay time: %.4f s\n', Delay_time);
    fprintf('Rise time: %.4f s\n', Rise_time);
    fprintf('Settling time: %.4f s\n', Settling_time);
    fprintf('Peak time: %.4f s\n', peak_time);
    fprintf('Overshoot: %.4f%%\n', overshoot);
end

legend('\omega_n = 5','\omega_n = 10','\omega_n = 20');
title('Step Response for Different Natural frequency (\zeta = 0.5)');
xlabel('Time (sec)');
ylabel('Output');