clc;
wn = 1;
zeta = [0 0.2 0.5 0.707 1 2];

for i = 1:length(zeta)
    num = [wn*wn];
    den = [1 2*zeta(i)*wn wn*wn];
    a = tf(num, den)
    b = stepinfo(a)
    b.Overshoot
    b.PeakTime
    b.RiseTime
    b.TransientTime
    b.D
    step(a)
    hold on;
end