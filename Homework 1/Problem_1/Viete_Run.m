% Raiid Ahmed Homework 1 Problem 1 Viete_Run
%
% ViΓ¨teβs formula for approximating π, which is
% is named after FranΓ§ois ViΓ¨te who published it in 1593. It is the rst instance of an innite
% product in mathematics and the rst example of an explicit formula for the exact value of π. It
% can be interpreted as a variation of an Archimedes idea of approximating the length of a circle
% by the perimeter of a many-sided polygon. It is remarkable that it only uses the number 2 to
% approximate π as accurately as desired.
% Write a Matlab function called viete that approximates π using this formula. It should
% take as input the number of terms π to use in the product on the right-hand side of the formula.
% The output should be the corresponding approximation for π.
% Next, write a script called viete_run that calls viete starting with π = 1 and then repeatedly
% calls viete, increasing π by one on each call up to π = 25. For each call, you should save the
% approximation for π and the true relative error between the approximation and Matlabβs builtin approximation for π, which is given by the built-in function pi. We will soon see that the
% true relative error is given by
% πtr =
% true val β approx val
% true val .
% Finally, plot the approximations for π versus π and plot the relative error versus π. For the
% error plot, use a semilog plot and comment on what you see.

TestVal = 25;                %N terms to use in the equation
Pies = zeros(TestVal,1);     %Pi approximations pre allocation
Err = zeros(TestVal,1);      %Error between test and reality pre allocation

for i = 1:TestVal            %Allocate solutions and error from Viete's formula approximations
    Pies(i) = 2/Viete(i);
    Err(i) = (pi - Pies(i))/pi;
end

subplot(1,2,1)       %Plot approximations and error vs n steps
    plot(Pies)
        title('N vs Approx. pi')
        ylabel('Approx pi')
        xlabel('N')
subplot(1,2,2)
    semilogx(Err)
        title('N vs Error')
            ylabel('Error')
            xlabel('N')
            
%It was interesting to see that as N increased, the series seemed to
%converge and error got exponentially lower.

    



