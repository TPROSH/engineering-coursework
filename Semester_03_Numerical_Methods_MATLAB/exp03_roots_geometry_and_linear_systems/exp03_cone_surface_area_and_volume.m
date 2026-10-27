%{
Exp 3.4
find the surface area and volume of a right angle cone 
having a height of 10 cm and radius of 3 cm 
with user input and output
%}

height = 10 ;
radius = 3 ;

curved_area = pi*radius*sqrt(height*height + radius*radius);
total_area = curved_area + pi*radius*radius;
vol = (pi*height*(radius^2))/3;

disp(' curved surface area = ');disp(curved_area);
disp('total area = '); disp(total_area);
disp('volume = ');disp(vol);