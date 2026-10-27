%{
Exp 7: Newton–Raphson Method
Find root of f(x) = (x-1)^0.5 / 3
%}

syms x
f = sqrt(x-1)/ 3;   % Define the function
df = diff(f, x);    % Derivative of the function

% Convert symbolic expressions to numeric function handles
f = matlabFunction(f);
df = matlabFunction(df);

% Initial guess
initial = 7;
initial_value = initial;
% Apply Newton–Raphson formula
for i=1:1:100
    if ~isreal(f) || ~isreal(df) || isnan(f) || isnan(df) || isinf(df)
        warning('Iteration produced invalid value (NaN/Inf/complex). Stopping.');
        return;
    end
    next_value = initial_value - (f(initial_value) / df(initial_value));
    initial_value = next_value;
end
% Display results
disp('Initial value:');
disp(initial);
disp('Final Root');
disp(next_value);
