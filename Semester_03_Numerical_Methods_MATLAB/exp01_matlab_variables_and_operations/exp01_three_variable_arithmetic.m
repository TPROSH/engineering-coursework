%{
EXP 1.1
Operations on three variables (a, b, c)
Add, Subtract, Multiply, Divide, Square, Square-root, 
Remainder, Average
%}

a = 10;
b = 15;
c = 20;

% Addition
add_result = a + b + c;

% Subtraction 
sub_result = a - b - c;

% Multiplication
mult_result = a * b * c;

% Division 
div_result = a / b / c;

% Squares
square_a = a^2;
square_b = b^2;
square_c = c^2;

% Square roots
sqrt_a = sqrt(a);
sqrt_b = sqrt(b);
sqrt_c = sqrt(c);

% Remainder (modulus)
rem_ab = mod(a, b);   % remainder of a ÷ b
rem_bc = mod(b, c);   % remainder of b ÷ c
rem_ca = mod(c, a);   % remainder of c ÷ a

% Average
avg_result = (a + b + c) / 3;

% Display results
disp('Addition:'), disp(add_result)
disp('Subtraction:'), disp(sub_result)
disp('Multiplication:'), disp(mult_result)
disp('Division:'), disp(div_result)
disp('Squares:'), disp([square_a square_b square_c])
disp('Square roots:'), disp([sqrt_a sqrt_b sqrt_c])
disp('Remainders [a mod b, b mod c, c mod a]:'), disp([rem_ab rem_bc rem_ca])
disp('Average:'), disp(avg_result)
