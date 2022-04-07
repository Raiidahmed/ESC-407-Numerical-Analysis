% Raiid Ahmed Homework 3 Problem 1 Main Script
clear
clc

funct = @(x) -1 + 7 .* exp(-x) .* sin(x);

bracket = [1,3];

fplot(funct,[-20 20])

disp('Bisect')
[a,b,c,d] = bisect(funct,bracket,10^(-10),100);
disp("Root Approx: " + num2str(a) + " Final Function Value: " + num2str(b) + " Final Relative Error: " + num2str(c) + " Iterations to Convergence: " + num2str(d))
disp('False Positive')
[e,f,g,h] = false_pos(funct,bracket,10^(-10),100);
disp("Root Approx: " + num2str(e) + " Final Function Value: " + num2str(f) + " Final Relative Error: " + num2str(g) + " Iterations to Convergence: " + num2str(h))
disp('Secant')
[i,j,k,l] = secant(funct,bracket,10^(-10),100);
disp("Root Approx: " + num2str(i) + " Final Function Value: " + num2str(j) + " Final Relative Error: " + num2str(k) + " Iterations to Convergence: " + num2str(l))

fdiff = @(x) 7 .* exp(-x) .* (cos(x) - sin(x));
init = 1;
flag = true;

disp('Newton')
[m,n,o,p] = newton(funct,fdiff,init,10^(-10),100,flag);
disp("Root Approx: " + num2str(m) + " Final Function Value: " + num2str(n) + " Final Relative Error: " + num2str(o) + " Iterations to Convergence: " + num2str(p))

root = fzero(funct,100);

err1 = abs(root - a)/root;
err2 = abs(root - e)/root;
err3 = abs(root - i)/root;
err4 = abs(root - m)/root;

disp("Bisect Error: " + err1 + " False Positive Error: " + err2 + " Secant Error: " + err3 + " Newton Error: " + err4)
