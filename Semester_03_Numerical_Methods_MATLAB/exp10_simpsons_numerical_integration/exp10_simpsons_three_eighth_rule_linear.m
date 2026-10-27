%{
exp 10 area by simpson 3/8 rule
use the normal formula to calculate and verify the result
%}

f = @(x) 15*x;
a = 0;
b = 1;
% Define the number of sub-intervals (must be a multiple of 3)
n = 99;
if mod(n,3) ~= 0
    error('Number of sub-intervals n must be a multiple of 3.');
end

h = (b-a)/n;
s = f(a) + f(b);
for i = 1:1:(n-1)
    x = a + i*h;
    if mod(i,3) == 0
        s = s + 2*f(x);
    else
        s = s + 3 * f(x);
    end
end

% Call the simpsons38 function
% integral_value = simpsons_3_8(f, a, b, n);

area = (3*h*s)/8;
% Display the result
fprintf('The approximate integral value is: %f\n',area);
