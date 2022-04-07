% Raiid Ahmed Homework 3 Problem 3
clc
clear

funct = @(x) log(x.^2 + 1) - exp(.4.*x).*cos(pi.*x);
fdiff = @(x) ((2.*x)./(x.^2 + 1)) + pi.*exp(.4.*x)*sin(pi.*x) - .4.*exp(.4.*x).*cos(pi.*x);
fplot(funct,[0 25])

init = -.5;
flag = true;
disp('Negative Root')
[a,b,c,d] = newton(funct,fdiff,init,10^(-8),100,flag);
disp("Root Approx: " + num2str(a) + " Final Relative Error: " + num2str(c) + " Iterations to Convergence: " + num2str(d))

nthroot = 1;
init = nthroot-.70;
disp('1st Positive Root')
[e,f,g,h] = newton(funct,fdiff,init,10^(-8),100,flag);
disp("Root Approx: " + num2str(e) + " Final Relative Error: " + num2str(g) + " Iterations to Convergence: " + num2str(h))

nthroot = 2;
init = nthroot-.25;
disp('2nd Positive Root')
[i,j,k,l] = newton(funct,fdiff,init,10^(-8),100,flag);
disp("Root Approx: " + num2str(i) + " Final Relative Error: " + num2str(k) + " Iterations to Convergence: " + num2str(l))

nthroot = 3;
init = nthroot-.70;
disp('3rd Positive Root')
[m,n,o,p] = newton(funct,fdiff,init,10^(-8),100,flag);
disp("Root Approx: " + num2str(m) + " Final Relative Error: " + num2str(o) + " Iterations to Convergence: " + num2str(p))

nthroot = 4;
init = nthroot-.25;
disp('4th Positive Root')
[q,r,s,t] = newton(funct,fdiff,init,10^(-9),100,flag);
disp("Root Approx: " + num2str(q) + " Final Relative Error: " + num2str(s) + " Iterations to Convergence: " + num2str(t))

nthroot = 25;
init = nthroot-.70;
disp('25th Positive Root')
[u,v,w,x] = newton(funct,fdiff,init,10^(-9),100,flag);
disp("Root Approx: " + num2str(u) + " Final Relative Error: " + num2str(w) + " Iterations to Convergence: " + num2str(x))





