clc;
wn = 1;    % Natural frequency
zeta = [0 0.2 0.5 0.707 1 2];   % Damping ratios

figure;
hold on;
grid on;

for i = 1:length(zeta)
    
    sys = tf(wn^2,[1 2*zeta(i)*wn wn^2]);
    t = 0:0.01:40;
    [y,t_out] = step(sys,t);
    plot(t_out,y,'LineWidth',1.5)
    fprintf('\nFor zeta = %.2f\n', zeta(i));
    if zeta(i) == 0
        fprintf('Undamped system → No settling time\n');
    else
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
end

legend('\zeta=0','\zeta=0.2','\zeta=0.5','\zeta=0.707','\zeta=1','\zeta=2');
title('Step Response for Different Damping Ratios (\omega_n = 1)');
xlabel('Time (sec)');
ylabel('Output');