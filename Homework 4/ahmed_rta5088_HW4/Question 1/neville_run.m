%Raiid Ahmed Homework 4 Question 1

format long
clc 
clear

funct1 = @(x) (x.^3).*exp(x).*cos(10.*x)+1;
int1 = [-3,5];
xe1 = 2.2;

funct2 = @(x) tan(cos(sqrt(5+sin(x))./(1+x.^3)));
int2 = [-1.5,30];
xe2 = 20;

[a,b,c] = neville_f(funct1, xe1, int1, 1e-9, 100);
d = (funct1(xe1) - a)/funct1(xe1);
[e,f,g] = neville_f(funct2, xe2, int2, 1e-9, 100);
h = (funct2(xe2) - e)/funct1(xe2);

disp('Function (a):')
disp("Final Approx: " + a)
disp("Approx Relative Error: " + b);
disp("True Relative Error: " + d)
disp("Iterations: " + c)

disp('Function (b):')
disp("Final Approx: " + e)
disp("Approx Relative Error: " + f);
disp("True Relative Error: " + h)
disp("Iterations: " + g)


