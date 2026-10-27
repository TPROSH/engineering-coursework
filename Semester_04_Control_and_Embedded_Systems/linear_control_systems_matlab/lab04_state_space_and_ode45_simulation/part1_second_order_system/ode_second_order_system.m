function dxdt=ode_second_order_system(t,x)
dxdt=zeros(2,1);
dxdt(1)=x(2);
dxdt(2)=x(2)+5;
end
