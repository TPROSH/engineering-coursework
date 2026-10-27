x = 0:0.01:10;
y = 4*x;

subplot(2,2,1)
plot(x,y*2)
subplot(2,2,2)
plot(x, x-2)
subplot(2,2,3)
plot(x, x.^2)
subplot(2,2,4)
plot(x, x+2)