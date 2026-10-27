%{
exp 10  = to find area by simpson 1/3 rule
%}

f = @(x) 1/(1+x.^2);
a = 0;
b = 1;
h = 1/6;
n = (b - a) / h;
s = f(a) + f(b);
for i = 1:2:n-1
    s = s + 4 * f(a + i * h);
end
for i = 2:2:n-2
    s = s + 2 * f(a + i * h);
end
I = h / 3 * s;
fprintf('\nApproximate value of intergraion of f is = %f' , I);