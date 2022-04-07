% Raiid Ahmed Homework 3 Problem 4 Script
clc 
clear

funct = @(z) z.^3 - 2.*z + 2;
fdiff = @(z) 3.*(z.^2) - 2;

roots = roots([1 0 -2 2]);

init = -2;
rel_err_max = .00001;
max_iter = 1000;
is_max_iter = false;

[a,b,c,d] = newton(funct,fdiff,init,rel_err_max,max_iter,is_max_iter);

init = 1 + 1i;
rel_err_max = .00001;
max_iter = 1000;
is_max_iter = false;

[e,f,g,h] = newton(funct,fdiff,init,rel_err_max,max_iter,is_max_iter);

init = 1 - 1i;
rel_err_max = .00001;
max_iter = 1000;
is_max_iter = false;

[i,j,k,l] = newton(funct,fdiff,init,rel_err_max,max_iter,is_max_iter);