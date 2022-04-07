format long
clc
clear

k1 = 40;
k2 = 10;
m = 3;
h = .5;
g = 9.81;


funct = @(x) ((4/11)*(k2)*((x)^(11/4))) + ((1/2)*(k1)*((x)^2)) - m*g*(x + h);

fdiff = @(x) k1*x - g*m + k2*x^(7/4);

[a,b,c,d] = newton(funct,fdiff,1.4,1e-4,20);
[e,f,g,h] = secant(funct,[.1 2],1e-4,100)

