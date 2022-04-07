%Raiid Ahmed HW5 Problem 3

format long
clc
clear

load('GL.dat')
A = GL(:,1);
W = GL(:,2);

funct = @(x) sin(x)

[g_quad,err,n] = gauss(funct,0,pi,A,W,1e-9)






