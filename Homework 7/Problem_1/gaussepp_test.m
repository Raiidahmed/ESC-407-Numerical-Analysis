%Raiid Ahmed Homework 7 Problem 1

clc 
clear
format shorte

%Allocate A and b from assignment text

A = [2, -6, -1;
    -3, -1,  7;
    -8,  1,  -2];

B = [-38, -21, 15
     -34,  29,  2
     -20, -15, 15];

%Call gaussepp
 
[X,Adet] = gaussepp(A,B);

%Display solution and determinant

disp("Solution Matrix:")
disp(X)
disp("Determinant:")
disp(Adet)

%Calculate inverse

[Ainv] = gaussepp(A,eye(3));

%Display inverse

disp("Inverse of matrix A:")
disp(Ainv)


