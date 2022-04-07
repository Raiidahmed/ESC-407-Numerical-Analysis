% Raiid Ahmed Homework 1 Problem 2 days_test
%
% Write a Matlab function m-file called days that determines the elapsed days in any year. The
% function should be called as follows:
% >> n_days = days(mo,da,yr);
% where mo is the month, properly capitalized and entered as a string,∗
% da is the numerical value
% of the day of the month, and yr is the numerical value of the year. Take into account leap years.
% Recall that a leap year occurs every year that is exactly divisible by four, except for years that
% are exactly divisible by 100. Years that are exactly divisible by 400 are leap years, even though
% they are also divisible by 100. A nice way to do this is with for and switch structures.

n_days = days("September", 5, 2020); %Test call with the date this program was written
disp(n_days)

