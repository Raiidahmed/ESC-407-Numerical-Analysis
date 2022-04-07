%Raiid Ahmed Homework 2 Question 2

format long
clc
clear

funct1 = @(x) exp(x.^2).*sin(cos(1./(x.^3)));
x01 = 1/sqrt(2);


funct2 = @(x) tan(cos((sqrt(5)+sin(x))/(1+x^3)));
x02 = (1+sqrt(5))/3;

funct3 = @(x) x^(x^(x^(x^(x^(x)))));
x03 = .0001;
x04 = 1.5;

[a, b] = diff_limit(funct1, x01, 1e-9, 100, 1);
[c, d] = diff_limit(funct2, x02, 1e-9, 100, 1);
[e, f] = diff_limit(funct3, x03, 1e-9, 100, 1);
[g, h] = diff_limit(funct3, x04, 1e-9, 100, 1);
