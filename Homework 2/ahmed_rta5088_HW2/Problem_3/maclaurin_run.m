% Raiid Ahmed Homework 2 Problem 3

% Write a Matlab function called maclaurin_sum to compute the Maclaurin series expansion of a function to within a user-specied relative error and then evaluated at
% user-specified point 𝑥0. The Maclaurin series must be representable in a closed form
% so that it can be passed as an anonymous function to your function. Examples of such
% functions include 𝑒^𝑥, cos 𝑥, and sin 𝑥. The Matlab function should take as inputs
% • the anonymous function for the closed form version of the Maclaurin series for 𝑓(𝑥); for example, for 𝑒^𝑥 it would be f = @(x,n) (x^n)/factorial(n);
% • the point 𝑥0 at which you want the Maclaurin series to approximate 𝑓(𝑥0),
% • the desired approximate relative error of the approximation,
% • the maximum number of terms allowed in the Maclaurin series.
%
% Your Matlab function should output
% • the Maclaurin series approximation to 𝑓 (𝑥0),
% • the approximate relative error of the approximation,
% • the number of terms needed in the Maclaurin series to achieve the desired relative error.
% 
% For example, my function looks like:
%   function [mac_sum,err,n] = maclaurin_sum(f,x0,rel_err,max_it)
% Now, for the following functions
% (i) find the first four nonzero terms in the Maclaurin series,
% (ii) find the general term and write the series in summation form,
% (iii) plot all four partial sums of the series as well as the original function on one plot,
% (iv) write a single script called maclaurin_run that uses your maclaurin_sum function to approximate each of the 𝑓(𝑥)’s at the indicated 𝑥0’s and using the indicated relative error tolerances.
% 
% You should make an informed choice of the maximum number of terms allowed in
% the Maclaurin series to achieve the desired relative error.
% (a) 𝑓(𝑥) = 𝑥^2 sin 𝑥 at 𝑥0 = 3 and at 𝑥0 = 30 with a relative error of 10−9
% (b) 𝑓 (𝑥) = cos(3𝑥^2) at 𝑥0 = 2 with a relative error of 10−10
% (c) 𝑓 (𝑥) = ∫cos𝜉^2 𝑑𝜉 at 𝑥0 = 1 with a relative error of 10−11
% (d) 𝑓 (𝑥) = 1/(1 + 𝑥)^2 at 𝑥0 = 0.5 and at 𝑥0 = 2 with a relative error of 10−9
% If you plot 𝑓 (𝑥) (shown below), it looks perfectly well behaved everywhere. Why does
% the first 𝑥0 converge and the second one does not? This one is tricky and is
% worth bonus points if you get it.
%
% In all cases, show the calculations you used to obtain the Maclaurin expansions
% 49 terms in the series. Add previous partial sum to the next one for
% plotting. Use element by element notation


max_term = 100;                   %Run approximations for A through D
x0 = 3;
rel_err = 10^(-9);
funct1 = @(x,n) (((-1) ^ (n)) * (x ^ (2 + (2 * n + 1))))/(factorial(2 * n + 1));
maclaurin_sum(funct1, x0, rel_err, max_term)

x0 = 30;
maclaurin_sum(funct1, x0, rel_err, max_term)


x0 = 2; 
rel_err = 10^(-10);
funct2 = @(x,n) (((-9) ^ n) * (x ^ 2) ^ (2 * n))/(factorial(2 * n)); 
maclaurin_sum(funct2, x0, rel_err, max_term)


x0 = 1;
rel_err = 10^(-11);
funct3 = @(x,n) (((-1) ^ n) * (x ^ (4 * n + 1)))/(factorial(2 * n) * (4 * n + 1));
maclaurin_sum(funct3, x0, rel_err, max_term)


x0 = .5;
rel_err = 10^(-9);
funct4 = @(x,n) ((-1) ^ n * x ^ (2 * n));
maclaurin_sum(funct4, x0, rel_err, max_term)

x0 = 2;
maclaurin_sum(funct4, x0, rel_err, max_term)

