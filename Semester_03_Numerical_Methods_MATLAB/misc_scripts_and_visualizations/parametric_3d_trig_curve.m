x = 0:360;
y = sind(2*x);
z = cosd(x/2);
t = x;

plot3(x,y,z);
hold on
% plot3(x,z);

xlabel('x')
ylabel('y')
zlabel('z')
grid on