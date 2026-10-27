
%{
EXP 2
Matrix operations with A and B
%}

% Define 4x3 matrices
A = [1 2 3; 4 5 6; 7 8 9; 1 0 1];
B = [0 1 0; 1 0 1; 2 2 2; 3 3 3];

% Combine matrices
C_h = [A B];   % Horizontal combine (4x6)
C_v = [A; B];  % Vertical combine (8x3)

% Rank
rankA = rank(A);

% Trace (only for square submatrix)
traceA = trace(A(1:3,1:3));

% Flip
A_lr = fliplr(A); % Left-right flip
A_ud = flipud(A); % Up-down flip

% Modify diagonal elements (+10)
A_diagmod = A;
for i = 1:min(size(A))
    A_diagmod(i,i) = A_diagmod(i,i) + 10;
end

% Add / Subtract matrices
AddAB = A + B;
SubAB = A - B;

% Transpose
A_T = A';

% Inverse of a 3x3 matrix
M = [2 1 1; 1 2 1; 1 1 2];
invM1 = inv(M)              % Method 1
invM2 = adjoint(M)/det(M)    % Method 2 (using custom adjoint function)

% Display results
disp('Horizontal combination C_h ='); disp(C_h);
disp('Vertical combination C_v ='); disp(C_v);
disp(['Rank of A = ', num2str(rankA)]);
disp(['Trace of 3x3 submatrix of A = ', num2str(traceA)]);
disp('A left-right flip ='); disp(A_lr);
disp('A up-down flip ='); disp(A_ud);
disp('A with diagonal modified (+10) ='); disp(A_diagmod);
disp('A + B ='); disp(AddAB);
disp('A - B ='); disp(SubAB);
disp('Transpose of A ='); disp(A_T);
disp('Inverse of M (method 1) ='); disp(invM1);
disp('Inverse of M (method 2 using adjoint) ='); disp(invM2);
