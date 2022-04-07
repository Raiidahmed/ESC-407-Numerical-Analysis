%Raiid Ahmed HW5 Problem 3

format long
clc
clear

%allocate data and integrate first function with gauss

load('GL.dat')
A = GL(:,1);
W = GL(:,2);

funct = @(x) (x.^4).*exp(-x).*(cos(x).^2).*sin(x);
a = 0;
b = 2*pi;

[g_quad,rel_err,n] = gauss(funct,a,b,A,W,1e-9);

%calculate true result

trueinteg = integral(funct,a,b);

%display result

disp('Integrating (x.^4).*exp(-x).*(cos(x).^2).*sin(x) with gauss:')
disp("gauss estimate of the integral is " + g_quad)
disp("approximate relative error is " + rel_err)
disp("value of n to achieve this error is " + n)
disp("Matlab's estimate of the integral is " + trueinteg)

%allocate and integrate second function with gauss

funct = @(x) (x.^2 + x + 1).*exp((-x.^2)/2);
a = 1;
b = pi;

[g_quad,rel_err,n] = gauss(funct,a,b,A,W,1e-9);

%calculate true result

trueinteg = integral(funct,a,b);

%display results

disp(' ')
disp('Integrating (x.^2 + x + 1).*exp((-x.^2)/2) with gauss:')
disp("gauss estimate of the integral is " + g_quad)
disp("approximate relative error is " + rel_err)
disp("value of n to achieve this error is " + n)
disp("Matlab's estimate of the integral is " + trueinteg)

%allocate and integrate third function with gauss

funct = @(x) (x.*exp(-x).*sin(x))./(x.^2 + 9);
a = 0;
b = 5;

[g_quad,rel_err,n] = gauss(funct,a,b,A,W,1e-9);

%calculate true result

trueinteg = integral(funct,a,b);

%display result

disp(' ')
disp('Integrating (x.*exp(-x).*sin(x))./(x.^2 + 9) with gauss:')
disp("gauss estimate of the integral is " + g_quad)
disp("approximate relative error is " + rel_err)
disp("value of n to achieve this error is " + n)
disp("Matlab's estimate of the integral is " + trueinteg)

%allocate and integrate fourth function with gauss

funct = @(x) (x.^3).*cos(((2*pi)/log(2)).*log(x));
a = 1;
b = 2;

[g_quad,rel_err,n] = gauss(funct,a,b,A,W,1e-9);

%calculate true result

trueinteg = integral(funct,a,b);

%display results

disp(' ')
disp('Integrating (x.^3).*cos(((2*pi)/log(2)).*log(x)) with gauss:')
disp("gauss estimate of the integral is " + g_quad)
disp("approximate relative error is " + rel_err)
disp("value of n to achieve this error is " + n)
disp("Matlab's estimate of the integral is " + trueinteg)

%allocate and integrate fifth function with gauss

funct = @(x) log(x).*sec(x);
a = .001;
b = pi/2 - .001;

[g_quad,rel_err,n] = gauss(funct,a,b,A,W,1e-9);

%calculate true result

trueinteg = integral(funct,a,b);

%display results

disp(' ')
disp('Integrating log(x).*sec(x) with gauss:')
disp("gauss estimate of the integral is " + g_quad)
disp("approximate relative error is " + rel_err)
disp("value of n to achieve this error is " + n)
disp("Matlab's estimate of the integral is " + trueinteg)









