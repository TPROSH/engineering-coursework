function dxdt=ode_state_feedback_system(t,x)
dxdt=zeros(3,1);
k1 = 2; k2 = 3; k3 = 2;
u = k1*x(1) + k2*x(2) + k3*x(3);
dxdt(1)=x(2);
dxdt(2)=x(2)+5;
dxdt(3)=u+5;
end
