clc 
clear

syms x

f = @(x) cos(x)/(1+x^3);
h = .2;

f(1.1)
f(.7)

c = (f(1.1)-f(.7))/(2*h)

f = cos(x)/(1+x^3);
diff(f)

d = @(x) -sin(x)/(x^3 + 1) - (3*x^2*cos(x))/(x^3 + 1)^2;
d(.9)

funct = @(x) cos(x)/(1+x^3);
step = .2;
x0 = .9;

D = (funct(x0 + step) - funct(x0 - step))/(2*(step))

