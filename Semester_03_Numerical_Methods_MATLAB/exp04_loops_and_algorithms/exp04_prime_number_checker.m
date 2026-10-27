% Exp 4.7
% Check if a number is prime or not

number = 57;

count = 0;
for i = 1:1:number %for loop from 1 to n
    if mod(number , i) == 0 %check if that number is divisable bw 1 to n
        count = count + 1; %adds 1 if fully divisable
    end
end

if count == 2
    disp('prime')
else
    disp('not prime')
end