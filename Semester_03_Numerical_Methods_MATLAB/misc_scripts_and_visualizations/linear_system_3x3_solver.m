%{
3x+4y-7z=0
4x+9y+z=8
-x-y+z=-4
%}

D = [3,4,-7;4,9,1;-1,-1,1];
rank(D)

Dx = [0,4,-7;8,9,1;-4,-1,1];
rank(Dx)
x = det(Dx)/det(D)

Dy = [3,0,-7;4,8,1;-1,-4,1];
rank(Dy)
y = det(Dy)/det(D)

Dz = [3,4,0;4,9,8;-1,-1,-4];
rank(Dz)
z = det(Dz)/det(D)
