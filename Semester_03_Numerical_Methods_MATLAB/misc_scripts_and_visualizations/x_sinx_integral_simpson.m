f = @(x) x*sin(x);
a = 0;
b = pi/2;
n = 99;
if mod(n,3) ~= 0
        error('n must be a multiple of 3.');
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
approx_integral_value = (3*h*s)/8