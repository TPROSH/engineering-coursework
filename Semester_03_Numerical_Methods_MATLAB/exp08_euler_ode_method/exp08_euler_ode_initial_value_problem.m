%{
1st page = adl lab front page jaisa
2nd page = index
exp 6 , 7 to find root = bisection , secant , newton raphspon
exp 8 to find differentiation = euler method
exp 9 ,10 to find integrator = simpson 1/3 trapejoidal , simpson 3/8
exp 5 = draw and 2d and 3d curve
exp 4 = find solution of given equation using crammer's rule
exp 3 = sum of number , sum of series , ap , gp , looping
exp 2 = matrix codes , genration of vectors
exp 1 = basic airthmetic and logical operations ALU , how to generate a number vector
        find the roots of quadratic equation , 

y' = y^2 - x^2
y' = x*y , y(1) = 5 ,[1,1.5] , n = 3
y' = x^2 +y^2 ,y(0) = 0, x= [0, 05 or 0.5]
%}

clc;
clear;
% Define the function dy/dx = f(x,y)
f = @(x, y) (x.^2 + y.^2);
% Initial conditions
x0 = 0;
y0 = 0.5;
% Step size and final x value
h = 0.1;
xn = 1;
% Number of steps
n = (xn - x0)/h;
% Initialize arrays
x = x0;
y = y0;
% Euler's Method Iteration
for i = 1:n
    y = y + h * f(x, y);
    x = x + h;
    fprintf('At x = %.2f, y = %.6f\n', x, y);
end
fprintf('\nApproximate value of y at x = %.2f is %.6f\n', x, y);