%{
Exp 4.3
find how many years are required to make 
a sum of 10 thousands to 20 thousands with 
rate of interest of 8% compounded annualy
%}

principle = 10000;
total_amount = 20000;
rate = 8;

%{
We know: total_amount = principle * (1 + rate/100)^time
log(total_amount) = log(principle) + time * log(1 + rate/100)
time = (log(total_amount) - log(principle)) / log(1 + rate/100)
%}

time = (log(total_amount) - log(principle)) / log(1 + rate / 100);
disp(time);
