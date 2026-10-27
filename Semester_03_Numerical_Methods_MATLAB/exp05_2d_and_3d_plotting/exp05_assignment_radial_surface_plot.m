%Assignment Question 9
%Plotting z = 1/(15*((X.^2) + (Y.^2))
x = -10:0.1:10;
y = -10:0.1:10;
[X, Y] = meshgrid(x, y);
den = (X.^2) + (Y.^2);
Z = 1./(15*den);
figure;
surf(X, Y, Z);
shading interp;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
title('3D Plot of z = 1/(15*((X.^2) + (Y.^2)))');
colorbar;
