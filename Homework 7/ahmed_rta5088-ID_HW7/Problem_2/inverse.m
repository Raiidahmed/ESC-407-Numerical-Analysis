%Raiid Ahmed Homework 7 Problem 2

%Takes about 21 minutes to run a 5000x5000 matrix

clc
clear

%Allocate matrix of random values

n = 5000;

A = (rand(n)*6) - 3;

%Calculate inverse with Matlab 

tic
Ainv_matlab = inv(A);
matlab_time = toc;

%Calculate inverse with Gauss

tic
Ainv_gaussepp = gaussepp(A,eye(n));
gaussepp_time = toc;

%Calculate Elucidean norm of difference between two inverses

diff = Ainv_matlab - Ainv_gaussepp;
Elucid_norm = sqrt(sum(sum(diff.^2)));

disp("Matlab took " + matlab_time + " seconds to run.")
disp("Gaussepp took " + gaussepp_time + " seconds to run.")
disp("The Elucidean norm between the two inversions is: " + Elucid_norm)

