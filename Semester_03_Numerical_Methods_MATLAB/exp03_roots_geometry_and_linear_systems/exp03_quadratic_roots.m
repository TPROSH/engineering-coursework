%{
Exp 3.1
To find root of quadratic
equation x^2 + 3*x - 4 = 0
%}

a = 1; b = 3; c = -4; % Coefficients of the quadratic equation
d = b^2 - 4*a*c; % Calculate the discriminant

root1 = (-b+sqrt(d))/(2*a); %find root 1
root2 = (-b-sqrt(d))/(2*a); %find root 2

%display the result
disp('determinant :- '); disp(d);
disp('Root 1 :- '); disp(root1);
disp('root 2 :- '); disp(root2);
