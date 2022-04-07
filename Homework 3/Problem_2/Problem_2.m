% Raiid Ahmed Homework 3 Problem 2
clear
clc

t = 60 * 24 * 60 * 60;
Ta = -15;
Ti = 20;
alpha = .138 * 10^(-6);

funct = @(x) (erf(x/(2*sqrt(alpha * t)))*(Ti - Ta)) + Ta;

bracket = [0,2];

disp('Bisect')
[a,b,c,d] = bisect(funct,bracket,.001,100);
disp("Depth Approx: " + num2str(a) + " Final Relative Error: " + num2str(c) + " Iterations to Convergence: " + num2str(d))

fdiff = @(x) ((2/sqrt(pi)) * exp(-x ^ 2)) * (Ti - Ta);
init = 0;
flag = true;

disp('Newton')
[k,l,m,n] = newton(funct,fdiff,init,.001,100,flag);
disp("Depth Approx: " + num2str(k) + " Final Relative Error: " + num2str(m) + " Iterations to Convergence: " + num2str(n))


