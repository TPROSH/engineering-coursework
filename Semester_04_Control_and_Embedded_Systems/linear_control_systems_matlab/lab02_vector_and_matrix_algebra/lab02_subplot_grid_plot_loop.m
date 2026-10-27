x = 0:0.01:20;
y = 4*x;
for i = 1:12
    subplot(5,5,i)
    plot(x,y)
    hold on
end