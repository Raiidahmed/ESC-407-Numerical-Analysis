% Raiid Ahmed Homework 2 Problem 3

% Write a Matlab function called maclaurin_sum to compute the Maclaurin series expansion of a function to within a user-specied relative error and then evaluated at
% user-specified point ð¥0. The Maclaurin series must be representable in a closed form
% so that it can be passed as an anonymous function to your function. Examples of such
% functions include ð^ð¥, cos ð¥, and sin ð¥. The Matlab function should take as inputs
% â¢ the anonymous function for the closed form version of the Maclaurin series for ð(ð¥); for example, for ð^ð¥ it would be f = @(x,n) (x^n)/factorial(n);
% â¢ the point ð¥0 at which you want the Maclaurin series to approximate ð(ð¥0),
% â¢ the desired approximate relative error of the approximation,
% â¢ the maximum number of terms allowed in the Maclaurin series.
%
% Your Matlab function should output
% â¢ the Maclaurin series approximation to ð (ð¥0),
% â¢ the approximate relative error of the approximation,
% â¢ the number of terms needed in the Maclaurin series to achieve the desired relative error.
% 
% For example, my function looks like:
%   function [mac_sum,err,n] = maclaurin_sum(f,x0,rel_err,max_it)
% Now, for the following functions
% (i) find the first four nonzero terms in the Maclaurin series,
% (ii) find the general term and write the series in summation form,
% (iii) plot all four partial sums of the series as well as the original function on one plot,
% (iv) write a single script called maclaurin_run that uses your maclaurin_sum function to approximate each of the ð(ð¥)âs at the indicated ð¥0âs and using the indicated relative error tolerances.
% 
% You should make an informed choice of the maximum number of terms allowed in
% the Maclaurin series to achieve the desired relative error.
% (a) ð(ð¥) = ð¥^2 sin ð¥ at ð¥0 = 3 and at ð¥0 = 30 with a relative error of 10â9
% (b) ð (ð¥) = cos(3ð¥^2) at ð¥0 = 2 with a relative error of 10â10
% (c) ð (ð¥) = â«cosð^2 ðð at ð¥0 = 1 with a relative error of 10â11
% (d) ð (ð¥) = 1/(1 + ð¥)^2 at ð¥0 = 0.5 and at ð¥0 = 2 with a relative error of 10â9
% If you plot ð (ð¥) (shown below), it looks perfectly well behaved everywhere. Why does
% the first ð¥0 converge and the second one does not? This one is tricky and is
% worth bonus points if you get it.
%
% In all cases, show the calculations you used to obtain the Maclaurin expansions
% 49 terms in the series. Add previous partial sum to the next one for
% plotting. Use element by element notation

clc
clear

max_term = 100;                   %Run approximations for A through D
x0 = 3;
rel_err = 10^(-9);
funct1 = @(x,n) (((-1) ^ (n)) * (x ^ (2 + (2 * n + 1))))/(factorial(2 * n + 1));
[mac_sum, err, n] = maclaurin_sum(funct1, x0, rel_err, max_term)

x0 = 30;
[mac_sum, err, n] = maclaurin_sum(funct1, x0, rel_err, max_term)


x0 = 2; 
rel_err = 10^(-10);
funct2 = @(x,n) (((-9) ^ n) * (x ^ 2) ^ (2 * n))/(factorial(2 * n)); 
[mac_sum, err, n] = maclaurin_sum(funct2, x0, rel_err, max_term)


x0 = 1;
rel_err = 10^(-11);
funct3 = @(x,n) (((-1) ^ n) * (x ^ (4 * n + 1)))/(factorial(2 * n) * (4 * n + 1));
[mac_sum, err, n] = maclaurin_sum(funct3, x0, rel_err, max_term)


x0 = .5;
rel_err = 10^(-9);
funct4 = @(x,n) ((-1) ^ n * x ^ (2 * n));
[mac_sum, err, n] = maclaurin_sum(funct4, x0, rel_err, max_term)

x0 = 2;
[mac_sum, err, n] = maclaurin_sum(funct4, x0, rel_err, max_term)

