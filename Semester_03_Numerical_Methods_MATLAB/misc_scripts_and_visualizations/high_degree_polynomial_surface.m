[x,y] = meshgrid(-1:0.05:1,-1:0.05:1);

z = (x.^200+y.^200).^(150);

z(imag(z)~= 0) = NaN;

surf(x,y,z)