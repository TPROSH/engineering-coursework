%{
Bisection method
%}


y = @(x) (exp(2*x)) - x - 6;
x1 = input("Enter the value of x1 = ");
x2 = input("Enter the value of x2 = ");

if y(x1)*y(x2) > 0
    fprintf("no roots or more than 1 root exist in the interval")
    return;
end

if y(x1) == 0 
    fprintf('x1 is one of the roots\n')
    disp(x1)
    return;
elseif y(x2) == 0 
    fprintf('x2 is one of the roots\n')
    disp(x2)
    return;
end

for i = 1:100000
    xc = (x1+x2)/2; %bisection
    if y(xc) * y(x1) < 0
        x2 = xc; % Update x2
    else
        x1 = xc; % Update x1
    end

    if abs(y(x1)) < 1.0E-6
        break;
    end
end

fprintf('\nThe root: %f\nThe number of bisections: %d\n', x1, i)