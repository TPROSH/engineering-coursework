%{
Exp 7 = Do next iteration of
secant method to find root of 
x^3 + 2*x^2 - 3*x - 1 = 0
p0 = 2 , p1 = 1
%}

%Secant method requires pn and pn-1 both
%to find pn+1

f = @(x) (x.^3) + 2*(x.^2) - 3*x - 1 ;
p0 = 2;
p1 = 1;
for i = 1:1:100000
    next_iteration = p1 - (f(p1)*(p1 - p0))/(f(p1)-f(p0));
    po = p1;
    p1 = next_iteration;
end
root = next_iteration
