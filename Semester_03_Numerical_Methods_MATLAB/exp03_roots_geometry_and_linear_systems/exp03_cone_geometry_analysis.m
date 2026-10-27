%{
Exp 3.7
Find the surface area and volume of a cone having 
a height of 10cm and radius of 5 cm 
%}

height = 10;
radius = 5;

curved_area = pi*radius*sqrt(height*height + radius*radius);
total_area = curved_area + pi*radius*radius;
vol = (pi*height*(radius^2))/3;

disp(' curved surface area = ');disp(curved_area);
disp('total area = '); disp(total_area);
disp('volume = ');disp(vol);