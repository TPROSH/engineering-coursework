% exp 4.4
% Find the roots using cramer's rule

%{
3x+4y-7z=0
4x+9y+z=8
-x-y+z=-4
%}

D = [3,4,-7;4,9,1;-1,-1,1];
disp('rank of D = '); disp(rank(D));

Dx = [0,4,-7;8,9,1;-4,-1,1]; %replaced 1st column with b
disp('rank of Dx = ');disp(rank(Dx));
x = det(Dx)/det(D);
disp('x = '); disp(x);

Dy = [3,0,-7;4,8,1;-1,-4,1]; %replace 2nd column with b
disp('rank of Dy = '); disp(rank(Dy));
y = det(Dy)/det(D);
disp('y = '); disp(y);

Dz = [3,4,0;4,9,8;-1,-1,-4]; %replace 3rd column with b
disp('rank of Dz = '); disp(rank(Dz));
z = det(Dz)/det(D);
disp('z = '); disp(z);