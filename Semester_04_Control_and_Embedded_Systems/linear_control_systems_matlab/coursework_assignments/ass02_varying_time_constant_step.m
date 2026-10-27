clc;
T = [0.25 0.5 1 2 3];   % Time constants

figure;
hold on;
grid on;

for i = 1:length(T) 
    sys = tf(1,[T(i) 1]);     % Transfer function 1/(Ts+1)
    step(sys)                % Plot step response

    info = stepinfo(sys);    % Get time specifications
    fprintf('\nFor T = %.2f\n', T(i));
    
    Delay_time =  0.693*T(i)
    Rise_time = info.RiseTime
    Settling_time = info.SettlingTime
end

legend('T=0.25','T=0.5','T=1','T=2','T=3');
title('Step Response of First Order System');
xlabel('Time (sec)');
ylabel('Output');