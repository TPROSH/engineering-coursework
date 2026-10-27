%{
exp 9 = to find area by trapezoid rule
%}

% Define the function f(x)
f = @(x) sin(x);
a = 0; % Lower limit of integration
b = pi / 2; % Upper limit of integration
n = 10; % Number of subintervals
h = (b - a) / n; % Calculate the step size
s = 0.5 * (f(a) + f(b)); % Initialize the sum with the first and last terms divided by 2
for i = 1 : n - 1
    s = s + f(a + i * h); % Apply the trapezoidal rule summation for intermediate points
end
I = h * s; % Multiply by h to get the final integral value
fprintf('\nApproximate value of intergraion of f is = %f' , I);