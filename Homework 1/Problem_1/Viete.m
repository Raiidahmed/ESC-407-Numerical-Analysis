% Raiid Ahmed Homework 1 Problem 1 Viete
%
% %Viète’s formula for approximating 𝜋, which is
% is named after François Viète who published it in 1593. It is the rst instance of an innite
% product in mathematics and the rst example of an explicit formula for the exact value of 𝜋. It
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
% 𝑒tr =
% true val − approx val
% true val .
% Finally, plot the approximations for 𝜋 versus 𝑛 and plot the relative error versus 𝑛. For the
% error plot, use a semilog plot and comment on what you see.

function approx = Viete(n)  %Viete formula in writing
    approx = 1;
    for i = 0:n
       approx = approx * (1/2) * sqrt(2 + Nested_Sqrt(i));
    end
end