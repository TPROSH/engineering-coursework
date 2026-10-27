%{
Exp 3.5
Find principle amount compoundly
at interest of 6.1% , principle amount = 100
time = 3 years 

Find also SI and CI and their difference
%}

principal = 100; % Principal amount
rate = 6.1; % Interest rate
time = 3; % Time in years

SI = (principal * rate * time) / 100; %Simple Interest
CI = principal * (1 + rate / 100)^time - principal; %Compound Interest
difference = CI - SI; %difference between CI and SI
total_amount = principal + CI;

disp('Total amount = '); disp(total_amount);
disp('simple interest = '); disp(SI);
disp('compund interest = '); disp(CI);
disp('difference between ci and si = '); disp(difference);