% Raiid Ahmed Homework 1 Problem 1 Viete_Run
%
% %Viète’s formula for approximating 𝜋, which is
% (Equation)
% is named after François Viète who published it in 1593. It is the first instance of an infnite
% product in mathematics and the first example of an explicit formula for the exact value of 𝜋. It
% can be interpreted as a variation of an Archimedes idea of approximating the length of a circle
% by the perimeter of a many-sided polygon. It is remarkable that it only uses the number 2 to
% approximate 𝜋 as accurately as desired.
% Write a Matlab function called viete that approximates 𝜋 using this formula. It should
% take as input the number of terms 𝑛 to use in the product on the right-hand side of the formula.
% The output should be the corresponding approximation for 𝜋.
% Next, write a script called viete_run that calls viete starting with 𝑛 = 1 and then repeatedly
% calls viete, increasing 𝑛 by one on each call up to 𝑛 = 25. For each call, you should save the
% approximation for 𝜋 and the true relative error between the approximation and Matlab’s builtin approximation for 𝜋, which is given by the built-in function pi. We will soon see that the
% true relative error is given by
% (equation)
% Finally, plot the approximations for 𝜋 versus 𝑛 and plot the relative error versus 𝑛. For the
% error plot, use a semilog plot and comment on what you see.

function output = Nested_Sqrt(n)    %required the root in it's own function to enable recursion and prevent an infinite loop
    if n == 0                       %there is probably a better way to do this, but this is what was easiest for me to implement
        output = 0;                 %Function is meant to be run in a loop, this line sets output to zero when the loop is over
    else
        output = sqrt(2 + Nested_Sqrt(n - 1));   %Calculates a nested square root for n levels
    end
end

%Function adapted from https://github.com/lpuettmann/ramanujan-nested-radicals/blob/master/iter_sqrt.m

