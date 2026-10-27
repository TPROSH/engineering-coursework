clc;
syms s
K = -((s+2)*(s+4))/(s^2 - 4*s + 20);
dK = diff(K, s);
break_points = solve(dK == 0, s);
disp('Breakaway / Break-in points:');
double(break_points)