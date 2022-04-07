% Raiid Ahmed Homework 2 Problem 1

% In numerical computation, the machine epsilon 𝜀 can be thought of as the smallest
% number that when added to one gives a number greater than one. Develop a Matlab
% function called macheps that finds this number and compare it with the Matlab command eps, 
% which is is the positive distance from abs(x) to the next larger floating
% point number with the same precision as x. The function should have no inputs and
% the outputs should be the machine epsilon that your function finds and Matlab’s machine epsilon. 
% Hint: Start with the number one and keep halving it until that number
% added to one is no longer different from one.

function [functionEps, MatlabEps] = macheps()   %Calculating Eps through calculations and compare with matlab default

functionEps = 1;

    while functionEps + 1 ~= 1
       functionEps = functionEps / 2;     %Half eps until matlab approximates it to zero
    end
 
MatlabEps = eps;    
end

    