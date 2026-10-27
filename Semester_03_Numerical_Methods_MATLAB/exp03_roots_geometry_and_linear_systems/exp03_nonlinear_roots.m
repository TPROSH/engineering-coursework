%{
Exp 3.2
To find Nonlinear Roots: 
f(x) = 2x + e^(−x/2)
find f(0) and roots
%}

f = @(x) 2*x + exp(-x/2);
f0 = f(0) ;
root1 = fzero (f , -1);
root2 = fzero (f , -5);
fprintf('f(0) =%0.6f\n',f0);
fprintf('root1 =%0.6f\n',root1);
fprintf('root2 =%0.6f\n',root2);

f = @(x) 2*x + exp(-x/2);   % Define the function

f0 = f(0);                  % Evaluate f(0)

% Find roots near -1 and -5
root1 = fzero(f, -1);
root2 = fzero(f, -5);

% Display results
fprintf('f(0) = %.6f\n', f0);
fprintf('root1 = %.6f\n', root1);
fprintf('root2 = %.6f\n', root2);
