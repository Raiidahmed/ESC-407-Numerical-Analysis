% Raiid Ahmed Homework 1 Problem 2 days
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

function output = days(mo,da,yr)
    output = 0;                     %Pre allocation so we can iterate on it later
    Feb_days = 28;                  %Set it as a variable so it can be edited later
    if mod(yr, 4) == 0              %Leap year check           
        if mod(yr, 100) ~= 0 || mod(yr, 400) == 0 
            Feb_days = 29;
        end
    end
    
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]; %Allocate possible months in a vector
    month_days = [31, Feb_days, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];    %Allocate month lengths in a vector
    %Probably a better way to do this, but we can index to get the answer
    %regardless
    
    for i = 1:12    %Continues loop until we hit the input month
        if mo ~= months(i)
            output = output + month_days(i);    %Adds full months to day count
        else
            output = output + da;               %Adds days in current month to total
            break
        end
    end
        
    
    
