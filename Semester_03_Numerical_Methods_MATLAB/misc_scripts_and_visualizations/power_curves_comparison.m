x = 0:1:1000;
y1 = x.^2;
y2 = x.^3;

xlabel('x-axis')
ylabel('y-axis')

title('y = x^2 /n')

plot(x,y1,'r');
hold on
plot(x,y2,'r');

x2 = 0:360;
y3 = sind(x2);
x3 = 0:2*pi;
y4 = sin(x3);
hold on
plot(x2,y3,'b');
hold on
plot(x3,y4,'b');
grid on