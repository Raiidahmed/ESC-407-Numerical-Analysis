clc
clear

funct = @(x) exp(3.*x).*sin(2.*x);

load('GL.dat')
A = GL(:,1);
W = GL(:,2);

no = 6;
ni = 9;
x = A(no:ni);
w = W(no:ni);
a = 0;
b = pi/4;

foft = funct(((a + b)/2) + ((b - a)/2).*x)



integ = ((b-a)/2)*sum(w.*funct(((a + b)/2) + ((b - a)/2).*x));

gauss(funct,0,pi/4,A,W,1e-9)
integral(funct,0,pi/4)