f = @(x) sqrt(x-1)/ 3; % define function
df = @(x) 1/(6*(x - 1)^(1/2)); % derivative of f(x)
x0 = a; % Initial guess and tolerance
tol = 1e-3;
maxIter = 100; % Maximum number of iterations
i = 1;
% Newton-Raphson iterations
while abs(f(x1)) > tol && i < maxIter
    x = x - (f(x) / df(x));
    i = i + 1;
    %fprintf(' %d %.6f\n', i-1, x1);
end
% Display the final root
fprintf('\nRoot approximation: %.6f\n', x1)