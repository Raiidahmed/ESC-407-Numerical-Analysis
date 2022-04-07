% Raiid Ahmed Homework 3 Problem 4 Script
clc 
clear

funct = @(z) z.^3 - 2.*z + 2;
fdiff = @(z) 3.*(z.^2) - 2;

Left = -2;
Right = 2.5;
Bottom = -1.5;
Top = 1.5;

Base = Left:.0025:Right;
Height = Bottom:.0025:Top;
Height = Height * 1i;

roots = roots([1 0 -2 2]);
rel_err_max = .00001;
max_iter = 20;
is_max_iter = true;
tolerance = .01;
results = zeros(1200,length(Base));
rootcheck = zeros(1200,length(Base));

for i = 1:length(Height)
    Row = Base + Height(i);
    for j = 1:length(Base)
        init = Row(j);
        rootcheck(i,j) = newton(funct,fdiff,init,rel_err_max,max_iter,is_max_iter);
        if (abs(rootcheck(i,j) - roots(1))) < tolerance
            results(i,j) = 1;
        elseif (abs(rootcheck(i,j) - roots(2))) < tolerance
            results(i,j) = 2;
        elseif (abs(rootcheck(i,j) - roots(3))) < tolerance
            results(i,j) = 3;
        else 
            results(i,j) = 0;
        end
    end
end

map = [0 0 0
       1 1 0
       1 0 0 
       0 0 1];

imagesc([Left Right],[Bottom Top],results)
    t = colorbar;
    colormap(map)
    set(t,'ytick',0:.5:3)
hold on
plot(real(roots),imag(roots),'.','MarkerSize',30,'MarkerEdgeColor','green')
